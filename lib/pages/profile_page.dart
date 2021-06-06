part of 'page.dart';

class UserProfileApp extends StatefulWidget {
  UserProfileApp({this.users});
  final Users users;
  @override
  _UserProfileAppState createState() => _UserProfileAppState();
}

class _UserProfileAppState extends State<UserProfileApp> {
  bool isLoading;
  TextEditingController controllerNamaLengkap;
  TextEditingController controllerNamaToko;

  User _auth = FirebaseAuth.instance.currentUser;

  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("user");
  String id, email, namalengkap, namatoko, userimage;
  var ctrlEmail = TextEditingController();
  var ctrlNamaLengkap = TextEditingController();
  var ctrlNamaToko = TextEditingController();
  var ctrlId = TextEditingController();
  var ctrlemail = TextEditingController();

  PickedFile imageFile;
  final ImagePicker imagePicker = ImagePicker();

  Future chooseImage() async {
    final selectedImage = await imagePicker.getImage(
        source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      imageFile = selectedImage;
    });
  }

  void getUserUpdate() async {
    userCollection.doc(_auth.uid).snapshots().listen((event) {
      id = event.data()['uid'];
      email = event.data()['E_Mail'];
      namalengkap = event.data()['Nama Lengkap'];
      namatoko = event.data()['Nama Toko'];
      userimage = event.data()['Users Profile Images'];
      setState(() {});
    });
  }

  void initState() {
    getUserUpdate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(220, 237, 33, 1),
      body: Stack(children: [
        Container(
          margin: EdgeInsets.all(18),
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 50),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(userimage ??
                                  "https://firebasestorage.googleapis.com/v0/b/carikerja-49dd8.appspot.com/o/blankProfile%2Fblank-profile-picture-973460_1280.png?alt=media&token=74f8e1a1-50bc-4158-b3b2-a4d80c9ce2fa"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      width: 250,
                      height: 250,
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                      child: Container(
                    child: Text("Gambar Profile",
                        style: TextStyle(
                            color: Colors.black, fontFamily: 'MarkoOne')),
                  )),
                  // ignore: deprecated_member_use
                  RaisedButton.icon(
                      onPressed: () async {
                        await chooseImage();
                        await UserServices.updateUserProfile(
                                _auth.uid, imageFile)
                            .then((value) {
                          if (value) {
                            Fluttertoast.showToast(
                              msg: "Pembaharuan Gambar Berhasil!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          } else {
                            Fluttertoast.showToast(
                              msg: "Pembaharuan Gambar Gagal. Coba Lagi!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          }
                        });
                      },
                      icon: Icon(Icons.image_aspect_ratio),
                      label: Text("Pilih Ulang dari galeri")),
                  Center(
                    child: Column(children: [
                      Text(namalengkap ?? '',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'MarkoOne',
                              fontSize: 25)),
                      Text(email ?? '',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'MarkoOne',
                              fontSize: 20)),
                      Text(namatoko ?? '',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'MarkoOne',
                              fontSize: 20)),
                    ]),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 400,
                    height: 60,
                    child: Center(
                        child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         Container(
                            margin: EdgeInsets.only(left: 10),
                            // ignore: deprecated_member_use
                            child: RaisedButton(
                              color: Colors.red,
                              child: Text(
                                "Sign Out",
                                style: TextStyle(
                                    fontFamily: 'MarkoOne', fontSize: 25),
                              ),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Signout Confirmation"),
                                        content:
                                            Text("Are you sure to signout?"),
                                        actions: [
                                          // ignore: deprecated_member_use
                                          FlatButton(
                                            onPressed: () async {
                                              setState(() {
                                                isLoading = true;
                                              });
                                              await AuthServices.signout()
                                                  .then((value) {
                                                if (value) {
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                    return StartingPage();
                                                  }));
                                                  setState(() {
                                                    isLoading = false;
                                                  });
                                                } else {
                                                  setState(() {
                                                    isLoading = false;
                                                  });
                                                }
                                              });
                                            },
                                            child: Text("Yes"),
                                          ),
                                          // ignore: deprecated_member_use
                                          FlatButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          )
                                        ],
                                      );
                                    });
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                          )
                        ],
                      ),
                    )),
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
    );
  }
}
