part of 'services.dart';

class UserServices {
  static CollectionReference userCollection =
      FirebaseFirestore.instance.collection("user");
  static DocumentReference userADoc;
  static Reference ref;
  static UploadTask uploadTask;
  static String imageUrl;

  static Future<void> updateUser(Users users) async {
    userCollection.doc(users.uid).set({
      'uid': users.uid,
      'E_Mail': users.email,
      'Nama Lengkap': users.nama,
      'Nama Toko': users.namatoko,
    });
  }

  static Future<bool> editUserPro(Users users) async {
    await Firebase.initializeApp();
    await userCollection.doc(users.uid).update({
      'Nama Lengkap': users.nama,
      'Nama Toko': users.namatoko,
      'Users Profile Images': users.userimage ?? "",
    });
    return true;
  }

  static Future updateUserProfile(String uid, PickedFile imageFile) async {
    String fileName = uid + ".png";

    ref = FirebaseStorage.instance
        .ref()
        .child('images/Users Profile Images')
        .child(fileName);
    uploadTask = ref.putFile(File(imageFile.path));
    await uploadTask.whenComplete(
        () => ref.getDownloadURL().then((value) => imageUrl = value));
    return userCollection
        .doc(uid)
        .update({
          
          'Users Profile Images': imageUrl,
        })
        .then((value) => true)
        .catchError((onError) => false);
  }

  static Future<DocumentSnapshot> getUser(String uid) async{
    await Firebase.initializeApp();
    DocumentSnapshot snapshot;
    var data = await UserServices.userCollection.doc(uid).get();
    snapshot = data;
    return snapshot;
  }
}
