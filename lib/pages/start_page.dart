import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:manage_me/services/services.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:manage_me/pages/page.dart';
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      backgroundColor: Color.fromRGBO(220, 237, 33, 1),
      image: Image.asset('images/ManageMeLogo.png'),
      loaderColor: Color.fromRGBO(220, 237, 33, 1),
      photoSize: 180.0,
      navigateAfterSeconds: StartingPage(),
    );
  }
}

class StartingPage extends StatefulWidget {
  @override
  _StartingPageState createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  final ctrlEmail = TextEditingController();
  final ctrlPassword = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    ctrlEmail.dispose();
    ctrlPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        // ignore: missing_return
        onWillPop: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return StartingPage();
          }));
        },
        child: MaterialApp(
          theme: ThemeData(fontFamily: 'MarkoOne'),
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              backgroundColor: Color.fromRGBO(220, 237, 33, 1), //butuh cek warna
              body: Stack(children: [
                Container(
                  margin: EdgeInsets.all(18),
                  child: ListView(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 30),
                          Text(
                            "Welcome",
                            style: TextStyle(color: Colors.black, fontSize: 65),
                          ),
                          SizedBox(height: 200),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: ctrlEmail,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white, 
                                hintText: "Write your email",
                                hintStyle: TextStyle(fontSize: 18),
                                labelText: 'Email', 
                                labelStyle: TextStyle(fontSize: 18),
                               
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0))),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: ctrlPassword,
                            obscureText: true,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: 'Password',
                                labelStyle: TextStyle(fontSize: 18),
                                hintText: "Write your Password",
                                hintStyle: TextStyle(fontSize: 18),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                )),
                          ),
                          SizedBox(height: 20),
                          RichText(
                            text: TextSpan(
                                text: 'Register Here',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 24),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return SignUp();
                                    }));
                                  }),
                          ),
                          SizedBox(height: 20),
                          // ignore: deprecated_member_use
                          RaisedButton.icon(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            icon: Icon(Icons.arrow_forward_ios_outlined),
                            label: Text(
                              "Login",
                              style: TextStyle(fontSize: 38),
                            ),
                            textColor: Colors.black,
                            color: Colors.lightBlue,
                            onPressed: () async {
                              if (ctrlEmail.text == "" ||
                                  ctrlPassword.text == "") {
                                Fluttertoast.showToast(
                                  msg: "Please fill all fields !",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                              } else {
                                setState(() {
                                  isLoading = true;
                                });
                                String result = await AuthServices.signIn(
                                    ctrlEmail.text, ctrlPassword.text);
                                if (result == "no"){
                                  Fluttertoast.showToast(
                                    msg: result,
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                  setState(() {
                                    isLoading = false;
                                  });
                                }else {
                                  
                                    setState(() {
                                      isLoading = false;
                                    });
                                    Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return MainMenu();
                                  }));
                                  
                                    setState(() {
                                      isLoading = false;
                                    });
                                    Fluttertoast.showToast(
                                    msg: "Welcome",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                }

                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                isLoading == true
                    ? Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.transparent,
                        child: SpinKitFadingCircle(
                          size: 50,
                          color: Colors.blue,
                        ),
                      )
                    : Container()
              ])),
        ));
  }
}
