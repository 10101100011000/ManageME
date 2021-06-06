part of 'page.dart';

class DaftarProdukPage extends StatefulWidget {
  final ProductList productlist;
  DaftarProdukPage({this.productlist});

  @override
  _DaftarProdukPageState createState() => _DaftarProdukPageState();
}

class _DaftarProdukPageState extends State<DaftarProdukPage> {
  final uid = FirebaseAuth.instance.currentUser.uid;

  CollectionReference productCollection =
      FirebaseFirestore.instance.collection("product");

  bool _folder = true;

  final ctrlSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(220, 237, 33, 1),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(left: 5, right: 5, top: 0),
            width: 385,
            height: 120,
            child: Column(
              children: [
                Container(
                  child: AnimatedContainer(
                    margin: EdgeInsets.only(top: 30),
                    duration: Duration(milliseconds: 400),
                    width: 300,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Color.fromRGBO(220, 237, 33, 1),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.only(left: 16, top: 13),
                          child: TextField(
                            controller: ctrlSearch,
                            decoration: InputDecoration(
                                hintText: 'search',
                                hintStyle: TextStyle(color: Colors.black),
                                border: InputBorder.none),
                          ),
                        )),
                        Container(
                          child: Material(
                            type: MaterialType.transparency,
                            child: InkWell(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(_folder ? 32 : 0),
                                topRight: Radius.circular(32),
                                bottomLeft: Radius.circular(_folder ? 32 : 0),
                                bottomRight: Radius.circular(32),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  // ignore: deprecated_member_use
                                  child: RaisedButton(
                                    color: Color.fromRGBO(0, 0, 0, 0.5),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => SPage(
                                                  ctrlSearch:
                                                      ctrlSearch.text)));
                                    },
                                    child: Text("Cari",
                                        style: TextStyle(color: Colors.white)),
                                  )),
                              onTap: () {
                                setState(() {
                                  _folder = !_folder;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 45, top: 5),
                      child: Flexible(
                          flex: 3,
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              color: Color.fromRGBO(220, 237, 33, 1),
                              onPressed: () {},
                              child: Text(
                                "Brand",
                                style: TextStyle(color: Colors.black),
                              ))),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 75, top: 5),
                      child: Flexible(
                          flex: 3,
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              color: Color.fromRGBO(220, 237, 33, 1),
                              onPressed: () {},
                              child: Text(
                                "Urutkan Nama",
                                style: TextStyle(color: Colors.black),
                              ))),
                    )
                  ],
                )
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.white),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 7),
            child: Text(
              "Daftar Barang Anda",
              style: TextStyle(
                fontFamily: 'MarkoOne',
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          Flexible(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(left: 25, right: 25),
                height: double.infinity,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("product").where("owner",
                      isEqualTo: FirebaseAuth.instance.currentUser.uid)
                  
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text("Failed to get products data!");
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SpinKitFadingCircle(
                          size: 50,
                          color: Colors.blue,
                        );
                      }

                      return ListView(
                        children:
                            snapshot.data.docs.map((DocumentSnapshot doc) {
                          return ProductListCard(
                              productList: ProductList(
                                  doc.data()['id'],
                                  doc.data()['owner'],
                                  doc.data()['Nama Produk'],
                                  doc.data()['Deskripsi'],
                                  doc.data()['Harga Beli'],
                                  doc.data()['Harga Jual'],
                                  doc.data()['Jumlah Stok'],
                                  doc.data()['Brand'],
                                  doc.data()['Kategori'],
                                  doc.data()['image']));
                        }).toList(),
                      );
                    },
                  ),
                ),
              )),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
