part of 'models.dart';

class ProductList extends Equatable {
  final String id;
  final String owner;
  final String namaproduk;
  final String deskripsi;
  final String hargabeli;
  final String hargajual;
  final String jumlahstok;
  final String brand;
  final String kategori;
  final String image;

  ProductList(
      this.id,
      this.owner,
      this.namaproduk,
      this.deskripsi,
      this.hargabeli,
      this.hargajual,
      this.jumlahstok,
      this.brand,
      this.kategori,
      this.image,);

  @override
  List<Object> get props => [
        id,
        owner,
        namaproduk,
        deskripsi,
        hargabeli,
        hargajual,
        jumlahstok,
        brand,
        kategori,
        image
      ];
}
