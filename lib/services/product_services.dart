import 'dart:io';

import 'package:manage_me/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ProductServices {
  static Reference ref;
  static UploadTask uploadTask;
  static String imgUrl;
  static CollectionReference productlistCollection =
      FirebaseFirestore.instance.collection("product");
  static DocumentReference productlistDoc;

  final uid = FirebaseAuth.instance.currentUser.uid;
  final db = FirebaseFirestore.instance;

  User _auth = FirebaseAuth.instance.currentUser;

  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  String id,
      namaproduk,
      deskripsi,
      hargabeli,
      hargajual,
      jumlahstok,
      brand,
      kategori,
      images;

  void getUserUpdate() async {
    userCollection.doc(_auth.uid).snapshots().listen((event) {
      id = event.data()['uid'];
      namaproduk = event.data()['Nama Produk'];
      deskripsi = event.data()['Deskripsi'];
      hargabeli = event.data()['Harga Beli'];
      hargajual = event.data()['Harga Jual'];
      jumlahstok = event.data()['Jumlah Stok'];
      brand = event.data()['Brand'];
      kategori = event.data()['Kategori'];
      images = event.data()['User Images'];
    });
  }

  static Future<bool> editProductlist(ProductList productlist) async {
    await Firebase.initializeApp();

    await productlistCollection.doc(productlist.id).update(
      {'id' : productlist.id,
        'Nama Produk': productlist.namaproduk,
        'Deskripsi': productlist.deskripsi,
        'Harga Beli': productlist.hargabeli,
        'Harga Jual': productlist.hargajual,
        'Jumlah Stok': productlist.jumlahstok,
        'Brand': productlist.brand,
        'Kategori': productlist.kategori,
        'gambar':productlist.image
      },
    );

    return true;
  }

  static Future<bool> addproductlist(ProductList productlist, PickedFile imgFile) async {
    await Firebase.initializeApp();

    productlistDoc = await productlistCollection.add(
      {
        'id': "",
          'Nama Produk': productlist.namaproduk,
        'Deskripsi': productlist.deskripsi,
        'Harga Beli': productlist.hargabeli,
        'Harga Jual': productlist.hargajual,
        'Jumlah Stok': productlist.jumlahstok,
        'Brand': productlist.brand,
        'owner': FirebaseAuth.instance.currentUser.uid,
        'Kategori': productlist.kategori,
        'Gambar':productlist.image,
      },
    );

    if (productlistDoc.id != null) {
      //upload foto
      ref = FirebaseStorage.instance
          .ref()
          .child("images")
          .child(productlistDoc.id + ".png");
      uploadTask = ref.putFile(File(imgFile.path));

      await uploadTask.whenComplete(
        () => ref.getDownloadURL().then(
              (value) => imgUrl = value,
            ),
      );

      productlistCollection.doc(productlistDoc.id).update({
        'id': productlistDoc.id,
        'image': imgUrl,
      });

      return true;
    } else {
      return false;
    }
  }

  static Future<bool> deleteProductlist(ProductList productlist) async {
    await Firebase.initializeApp();

    await productlistCollection.doc(productlist.id).delete();

    return true;
  }
}
