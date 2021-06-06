part of 'models.dart';

class Users extends Equatable {
  final String uid;
  final String email;
  final String nama;
  final String namatoko;
  final String userimage;

  Users(this.uid, this.email,{
      this.nama, this.namatoko, this.userimage});

  @override
  List<Object> get props => [uid, email, nama, namatoko, userimage];
}
