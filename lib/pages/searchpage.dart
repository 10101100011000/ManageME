part of 'page.dart';

// ignore: must_be_immutable
class SPage extends StatefulWidget {
  String ctrlSearch;
  SPage({this.ctrlSearch});

  @override
  _SPageState createState() => _SPageState(ctrlSearch: ctrlSearch);
}
class _SPageState extends State<SPage> {
  String ctrlSearch;
  _SPageState({this.ctrlSearch});

  final uid = FirebaseAuth.instance.currentUser.uid;

  CollectionReference productCollection =
      FirebaseFirestore.instance.collection("productlist");

  // ignore: unused_field
  bool _folder = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hasil Pencaharian"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(220, 237, 33, 1),
      ),
      backgroundColor: Color.fromRGBO(220, 237, 33, 1),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 7),
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
                        .collection("productlist")
                        .where("Nama Produk", isEqualTo: ctrlSearch)
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
                                  doc.data()['Jumlak Stok'],
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
