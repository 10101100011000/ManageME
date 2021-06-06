part of 'services.dart';

class AuthServices {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static Reference ref;
  static UploadTask uploadTask;

  static DocumentReference userDoc;

  Future<String> getCurrentUID() async {
    return (auth.currentUser).uid;
  }

  static Future<String> signUp(
      String email, String password, String nama, String namatoko) async {
    await Firebase.initializeApp();
    String msg = "";
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      Users users = result.user.convertToUser(nama: nama, namatoko: namatoko);

      auth.signOut();
      await UserServices.updateUser(users);
      msg = "success";
    } catch (e) {
      msg = e.toString();
    }

    return msg;
  }

  static Future<bool> addUser(String email, String password) async {
    await Firebase.initializeApp();

    userDoc = await FirebaseFirestore.instance.collection("userAuth").add(
      {'uid': "", 'email': email, 'password': password},
    );
    if (userDoc.id != null) {
      FirebaseFirestore.instance.collection("userAuth").doc(userDoc.id).update({
        'uid': userDoc.id,
      });

      return true;
    } else {
      return false;
    }
  }

  static Future<String> signIn(String email, String password) async {
    await Firebase.initializeApp();

    String msg = "";
    String uid;
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      uid = result.user.uid;
      DocumentSnapshot snapshot = await UserServices.getUser(uid);
    } catch (e) {
      msg = "No Permission";
    }
    return msg;
  }

  static Future<bool> signout() async {
    bool result = false;
    await auth.signOut().whenComplete(
          () => result = true,
        );
    return result;
  }
}
