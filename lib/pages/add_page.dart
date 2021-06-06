part of 'page.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}


class _AddPageState extends State<AddPage> {
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
  
  PickedFile imageFile;
  final ImagePicker imagePicker = ImagePicker();


  Future chooseImage() async {
    final selectedImage = await imagePicker.getImage(
        source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      imageFile = selectedImage;
    });
  }

  void clearForm() {
  ctrlNamaProduk.clear();
  ctrlDeskripsi.clear();
  ctrlHargaBeli.clear();
  ctrlHargaJual.clear();
  ctrlJumlahStok.clear();
  ctrlBrand.clear();
  ctrlKategori.clear();

    setState(() {
      imageFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(220, 237, 33, 1),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(children: [
          Column(
            children: <Widget>[
              SizedBox(height: 5),
              Flexible(
                flex: 8,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: ListView(
                    children: [
                      SizedBox(height: 5),
                      Text("Nama Produk",
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'MarkoOne')),
                      TextFormField(
                        controller: ctrlNamaProduk,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5),
                            filled: true,
                            fillColor: Colors.white,
                            labelStyle: TextStyle(fontSize: 15),
                            hintText: "Tuliskan Nama barang anda",
                            hintStyle: TextStyle(fontSize: 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0))),
                      ),
                      SizedBox(height: 10),
                      Text("Deskripsi barang",
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'MarkoOne')),
                      TextFormField(
                        maxLines: 5,
                        controller: ctrlDeskripsi,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelStyle: TextStyle(fontSize: 15),
                            hintText:
                                "Tuliskan Deskripsi barang anda",
                            hintStyle: TextStyle(fontSize: 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0))),
                      ),
                     SizedBox(height: 10),
                      Text("Harga Beli",
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'MarkoOne')),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: ctrlHargaBeli,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5),
                            filled: true,
                            fillColor: Colors.white,
                            labelStyle: TextStyle(fontSize: 15),
                            hintText: "Harga Jual Barang Anda",
                            hintStyle: TextStyle(fontSize: 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0))),
                      ),
                      SizedBox(height: 10),
                      Text("Harga Jual",
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'MarkoOne')),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: ctrlHargaJual,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5),
                            filled: true,
                            fillColor: Colors.white,
                            labelStyle: TextStyle(fontSize: 15),
                            hintText: "Harga Jual Barang Anda",
                            hintStyle: TextStyle(fontSize: 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0))),
                      ),
                      SizedBox(height: 10), 
                      
                      Text("Jumlah Stok",
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'MarkoOne')),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: ctrlJumlahStok,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5),
                            filled: true,
                            fillColor: Colors.white,
                            labelStyle: TextStyle(fontSize: 15),
                            hintText: "Jumlah Stok yang anda punya sekarang",
                            hintStyle: TextStyle(fontSize: 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0))),
                      ),

                      SizedBox(height: 10), 
                      
                      Text("Brand",
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'MarkoOne')),
                      TextFormField(
                        controller: ctrlBrand,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5),
                            filled: true,
                            fillColor: Colors.white,
                            labelStyle: TextStyle(fontSize: 15),
                            hintText: "Merek produk anda",
                            hintStyle: TextStyle(fontSize: 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0))),
                      ),
                    SizedBox(height: 10), 
                      
                      Text("Kategori",
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'MarkoOne')),
                      TextFormField(
                        controller: ctrlKategori,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5),
                            filled: true,
                            fillColor: Colors.white,
                            labelStyle: TextStyle(fontSize: 15),
                            hintText: "Jenis apakah barang anda",
                            hintStyle: TextStyle(fontSize: 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0))),
                      ),
                      Text("Gambar",
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'MarkoOne')),
                      imageFile == null
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // ignore: deprecated_member_use
                                RaisedButton(
                                  color: Colors.white,
                                  child: Text(
                                    "Pilih Gambar",
                                    style: TextStyle(
                                        fontFamily: 'MarkoOne', fontSize: 15),
                                  ),
                                  onPressed: () async {
                                    chooseImage();
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                Text("File not found"),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // ignore: deprecated_member_use
                                RaisedButton(
                                  color: Colors.white,
                                  child: Text(
                                    "Pilih Gambar",
                                    style: TextStyle(
                                        fontFamily: 'MarkoOne', fontSize: 15),
                                  ),
                                  onPressed: () async {
                                    chooseImage();
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                Semantics(
                                  child: Image.file(File(imageFile.path),
                                      width: 100),
                                )
                              ],
                            ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  child: Center(
                      child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                            color: Color.fromRGBO(0, 255, 0, 1),
                            child: Text(
                              "Add Product",
                              style:
                                  TextStyle(fontFamily: 'MarkoOne', fontSize: 25, color: Colors.black),
                            ),
                            onPressed: () async {
                              if (ctrlNamaProduk.text == "" ||
                                  ctrlDeskripsi.text == "" ||
                                  ctrlHargaBeli.text == "" ||
                                  ctrlHargaJual.text == "" ||
                                  ctrlJumlahStok.text == "" ||
                                  ctrlBrand.text== "" ||
                                  ctrlKategori.text == "" ||
                                  imageFile == null) {
                                Fluttertoast.showToast(
                                  msg:
                                      "tolong isi semua bagian yang belum terisi",
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
                                ProductList productList = ProductList(
                                    '',
                                    '',
                                    ctrlNamaProduk.text,
                                    ctrlDeskripsi.text,
                                    ctrlHargaBeli.text,
                                    ctrlHargaJual.text,
                                    ctrlJumlahStok.text,
                                    ctrlBrand.text,
                                    ctrlKategori.text,
                                    '');
                                bool result = await ProductServices.addproductlist(productList, imageFile);
                                if (result == true) {
                                  Fluttertoast.showToast(
                                    msg: "Barang Berhasil Ditambahkan!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                  clearForm();
                                  setState(() {
                                    isLoading = false;
                                  });
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "Failed! Try again",
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
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ),
                      ],
                    ),
                  )),
                ),
              )
            ],
          ),
          isLoading == true
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.transparent,
                  child: SpinKitFadingCircle(size: 50, color: Colors.blue),
                )
              : Container(),
        ]),
      ),
    );
  }
}
