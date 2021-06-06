part of 'page.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final ctrlNamaLengkap = TextEditingController();
  final ctrlEmail = TextEditingController();
  final ctrlPassword = TextEditingController();
  final ctrlTipeBisnis = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    ctrlNamaLengkap.dispose();
    ctrlEmail.dispose();
    ctrlPassword.dispose();
    ctrlTipeBisnis.dispose();
    super.dispose();
  }

  void clearForm() {
    ctrlNamaLengkap.clear();
    ctrlEmail.clear();
    ctrlPassword.clear();
    ctrlTipeBisnis.clear();
    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'MarkoOne'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(220, 237, 33, 1),
        body: Stack(children: [
          Container(
            margin: EdgeInsets.all(18),
            child: ListView(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Register",
                      style: TextStyle(color: Colors.black, fontSize: 65),
                    ),
                    SizedBox(height: 25),
                     Align(//nama lengkap
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Nama Lengkap",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    TextFormField(//nama lengkap
                      keyboardType: TextInputType.name,
                      controller: ctrlNamaLengkap,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Nama Lengkap anda",
                          hintStyle: TextStyle(fontSize: 18),
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          )),
                    ),
                    SizedBox(height: 10),
                   Align(//email
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Email",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    TextFormField(//email
                      keyboardType: TextInputType.emailAddress,
                      controller: ctrlEmail,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Email",
                          hintStyle: TextStyle(fontSize: 18),
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          )),
                    ),
                    SizedBox(height: 10),
                    Align(//password
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Password",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    TextFormField(//password
                      controller: ctrlPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Password",
                          hintStyle: TextStyle(fontSize: 18),
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          )),
                    ),
                    SizedBox(height: 10),  
                    Align(//tipe bisnis
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Tipe Bisnis",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    TextFormField(//tipe bisnis
                      keyboardType: TextInputType.emailAddress,
                      controller: ctrlTipeBisnis,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "nama bisnis anda sekarang",
                          hintStyle: TextStyle(fontSize: 18),
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          )),
                    ),
                    SizedBox(height: 85),  
           
                // ignore: deprecated_member_use
                    RaisedButton.icon(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      icon: Icon(Icons.file_upload),
                      padding: EdgeInsets.all(20),
                      label: Text(
                        "Register",
                        style: TextStyle(fontSize: 38),
                      ),
                      textColor: Colors.black,
                      color: Colors.white,
                      onPressed: () async {
                        if (ctrlEmail.text == "" || ctrlPassword.text == "") {
                          Fluttertoast.showToast(
                            msg: "Please fill all fields !",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        } else if (ctrlPassword.text.characters.length <= 5) {
                          Fluttertoast.showToast(
                            msg: "Password minimal 6 character",
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
                          String result = await AuthServices.signUp(
                              ctrlEmail.text,
                              ctrlPassword.text,
                              ctrlNamaLengkap.text,
                              ctrlTipeBisnis.text,);
                          await AuthServices.addUser(
                              ctrlEmail.text, ctrlPassword.text);
                          if (result == "success") {
                            Fluttertoast.showToast(
                              msg: "Success",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            setState(() {
                              isLoading = false;
                              clearForm();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => StartingPage()));
                            });
                          } else {
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
                              clearForm();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => StartingPage()));
                            });
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
        ]),
      ),
    );
  }
}
