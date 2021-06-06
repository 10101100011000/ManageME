import 'package:manage_me/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseUserExtension on User {
  Users convertToUser(
          {String nama = "No Name", String namatoko = "tidak ada nama toko", String userimage = "No image"}) =>
      Users(this.uid, this.email, nama: nama, namatoko: namatoko);
}
