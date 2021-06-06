part of 'page.dart';

class HalamanEdit extends StatefulWidget {
  HalamanEdit({this.productList});
  final ProductList productList;
  @override
  _HalamanEditState createState() => _HalamanEditState();
}

class _HalamanEditState extends State<HalamanEdit> {
  bool isLoading = false;
  TextEditingController controllerNamaProduk;
  TextEditingController controllerDeskripsi;
  TextEditingController controllerHargaBeli;
  TextEditingController controllerHargaJual;
  TextEditingController controllerJumlahStok;
  TextEditingController controllerBrand;
  TextEditingController controllerKategori;

  var ctrlNamaProduk = TextEditingController();
  var ctrlDeskripsi = TextEditingController();
  var ctrlHargaBeli = TextEditingController();
  var ctrlHargaJual = TextEditingController();
  var ctrlJumlahStok = TextEditingController();
  var ctrlBrand = TextEditingController();
  var ctrlKategori = TextEditingController();
  var ctrlId = TextEditingController();
  var ctrlOwner = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(220, 237, 33, 1),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            child: Container(
              child: ListView(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        NetworkImage(widget.productList.image),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white),
                            width: 300,
                            height: 300,
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.topCenter,
                          child: Column(
                            children: [
                              Container(
                                child: Container(
                                    width: double.infinity,
                                    child: Container(
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                width: 350,
                                                height: 50,
                                                child: TextFormField(
                                                  keyboardType:
                                                      TextInputType.text,
                                                  controller: ctrlNamaProduk =
                                                      TextEditingController(
                                                          text: widget
                                                              .productList
                                                              .namaproduk),
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                          new EdgeInsets
                                                                  .symmetric(
                                                              vertical: 5,
                                                              horizontal: 6.0),
                                                      filled: true,
                                                      fillColor: Colors.white,
                                                      labelText:
                                                          "Nama Produk: ",
                                                      labelStyle: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.black,
                                                          fontFamily:
                                                              "MarkoOne"),
                                                      hintText:
                                                          "Ganti Nama produk anda",
                                                      hintStyle: TextStyle(
                                                          fontSize: 10),
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0))),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: ctrlDeskripsi = TextEditingController(
                              text: widget.productList.deskripsi),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Deskripsi: ",
                              labelStyle: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                  fontFamily: "MarkoOne"),
                              hintText: "Deskripsikan Barang anda",
                              hintStyle: TextStyle(fontSize: 18),
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 40.0, horizontal: 10.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              )),
                          obscureText: false,
                          maxLines: 8,
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: ctrlHargaBeli = TextEditingController(
                              text: widget.productList.hargabeli),
                          decoration: InputDecoration(
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 6.0),
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Harga Beli: ",
                              labelStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontFamily: "MarkoOne"),
                              hintText: "Harga awal anda Beli produk ini",
                              hintStyle: TextStyle(fontSize: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: ctrlHargaJual = TextEditingController(
                              text: widget.productList.hargajual),
                          decoration: InputDecoration(
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 6.0),
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Harga Jual: ",
                              labelStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontFamily: "MarkoOne"),
                              hintText: "Harga Jual produk ini",
                              hintStyle: TextStyle(fontSize: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: ctrlJumlahStok = TextEditingController(
                              text: widget.productList.jumlahstok),
                          decoration: InputDecoration(
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 6.0),
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Jumlah Stok: ",
                              labelStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontFamily: "MarkoOne"),
                              hintText:
                                  "Total Jumlah produk ini yang anda miliki sekarang",
                              hintStyle: TextStyle(fontSize: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: ctrlBrand = TextEditingController(
                              text: widget.productList.brand),
                          decoration: InputDecoration(
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 6.0),
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Brand: ",
                              labelStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontFamily: "MarkoOne"),
                              hintText: "Merek produk ini",
                              hintStyle: TextStyle(fontSize: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: ctrlKategori = TextEditingController(
                              text: widget.productList.kategori),
                          decoration: InputDecoration(
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 6.0),
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Kategori: ",
                              labelStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontFamily: "MarkoOne"),
                              hintText: "Jenis kategori produk ini",
                              hintStyle: TextStyle(fontSize: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  Center(
                      child: Container(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Container(
                          child: Container(
                              child: Container(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  // ignore: deprecated_member_use
                                  child: RaisedButton(
                                      color: Colors.orange,
                                      child: Text(
                                        "Update",
                                        style: TextStyle(
                                            fontFamily: 'MarkoOne',
                                            fontSize: 35),
                                      ),
                                      onPressed: () async {
                                        ctrlId = TextEditingController(
                                            text: widget.productList.id);
                                        if (ctrlNamaProduk.text == "" ||
                                            ctrlDeskripsi.text == "" ||
                                            ctrlHargaBeli.text == "" ||
                                            ctrlHargaJual.text == "" ||
                                            ctrlJumlahStok.text == "" ||
                                            ctrlBrand.text == "" ||
                                            ctrlKategori.text == "") {
                                          Fluttertoast.showToast(
                                            msg:
                                                "Mohon isi semua bagian yang belum terisi!",
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
                                          ProductList product = ProductList(
                                              ctrlId.text,
                                              ctrlOwner.text,
                                              ctrlNamaProduk.text,
                                              ctrlDeskripsi.text,
                                              ctrlHargaBeli.text,
                                              ctrlHargaJual.text,
                                              ctrlJumlahStok.text,
                                              ctrlBrand.text,
                                              ctrlKategori.text,
                                              "");
                                          bool result = await ProductServices
                                              .editProductlist(product);
                                          if (result == true) {
                                            Fluttertoast.showToast(
                                              msg: "Pembaharuan Berhasil!",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              backgroundColor: Colors.green,
                                              textColor: Colors.white,
                                              fontSize: 16.0,
                                            );
                                            setState(() {
                                              isLoading = false;
                                            });
                                            Navigator.pop(context);
                                          } else {
                                            Fluttertoast.showToast(
                                              msg:
                                                  "Pembaharuan Gagal. Coba Lagi!",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              fontSize: 16.0,
                                            );
                                            setState(() {
                                              isLoading = false;
                                            });
                                          }
                                        }
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  // ignore: deprecated_member_use
                                  child: RaisedButton(
                                    color: Colors.red,
                                    child: Text(
                                      "Delete",
                                      style: TextStyle(
                                          fontFamily: 'MarkoOne', fontSize: 35),
                                    ),
                                    onPressed: () {
                                      ctrlId = TextEditingController(
                                          text: widget.productList.id);
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text("Konfirmasi"),
                                              content: Text(
                                                  "Apakah anda yakin untuk menghapus Produk ini?"),
                                              actions: [
                                                // ignore: deprecated_member_use
                                                FlatButton(
                                                  child: Text("Ya"),
                                                  onPressed: () async {
                                                    setState(() {
                                                      isLoading = true;
                                                    });
                                                    ProductList productList =
                                                        ProductList(
                                                            ctrlId.text,
                                                            "",
                                                            "",
                                                            "",
                                                            "",
                                                            "",
                                                            "",
                                                            "",
                                                            "",
                                                            "");
                                                    bool result =
                                                        await ProductServices
                                                            .deleteProductlist(
                                                                productList);
                                                    if (result == true) {
                                                      Fluttertoast.showToast(
                                                        msg:
                                                            "Barang Berhasil DiHapus!",
                                                        toastLength:
                                                            Toast.LENGTH_SHORT,
                                                        gravity:
                                                            ToastGravity.BOTTOM,
                                                        backgroundColor:
                                                            Colors.green,
                                                        textColor: Colors.white,
                                                        fontSize: 16.0,
                                                      );
                                                      setState(
                                                        () {
                                                          isLoading = false;
                                                        },
                                                      );

                                                      Navigator.pop(context);
                                                      Navigator.pop(context);
                                                    }
                                                  },
                                                ),
                                                // ignore: deprecated_member_use
                                                FlatButton(
                                                  child: Text("no"),
                                                  onPressed: () async {
                                                    Navigator.pop(context);
                                                  },
                                                )
                                              ],
                                            );
                                          });
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                  ),
                                )
                              ],
                            ),
                          )),
                        ),
                      ],
                    ),
                  )),
                  SizedBox(height: 10),
                ],
              ),
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
        ],
      ),
    );
  }
}
