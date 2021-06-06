import 'package:intl/intl.dart';
import 'package:manage_me/pages/page.dart';
import 'package:flutter/material.dart';
import 'package:manage_me/models/models.dart';

// ignore: must_be_immutable
class ProductListCard extends StatelessWidget {
  final ProductList productList;
  ProductListCard({this.productList});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.yellow,
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HalamanEdit(productList: productList)));
        },
        title: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
            Text("Nama Barang: ",textAlign: TextAlign.left,style: TextStyle(fontFamily: 'MarkoOne')),
            Text(productList.namaproduk ?? '', style: TextStyle(fontFamily: 'MarkoOne')),
            Text("Stock: " + productList.jumlahstok ?? '', style: TextStyle(fontFamily: 'MarkoOne'),),         
            Text("Harga Beli: " + NumberFormat.currency(locale: 'id', decimalDigits: 0, symbol: 'Rp. ').format(int.parse(productList.hargabeli))),
            Text("Harga Jual: " + NumberFormat.currency(locale: 'id', decimalDigits: 0, symbol: 'Rp. ').format(int.parse(productList.hargajual))),
            Text("Kategori: " + productList.kategori ?? '', style: TextStyle(fontFamily: 'MarkoOne')),
            Text("Brand: " + productList.brand ?? '', style: TextStyle(fontFamily: 'MarkoOne'))
          ],
        ),
        
        
        trailing: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            
                              image: NetworkImage(productList.image ??
                                  "https://i.pinimg.com/originals/54/95/41/549541f8cf16e4a9e6d822c9819a6c84.jpg"),
                              fit: BoxFit.cover),
                          color: Colors.greenAccent),
                      width: 50,
                      height: 100,
                    ),
      ),
    );
  }
}
