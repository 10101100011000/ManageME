part of 'page.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    AddPage(),
    DaftarProdukPage(),
    UserProfileApp()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:Color.fromRGBO(220, 237, 33, 0.1),        
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_rounded),
              label: ("Tambah Produk"),
              backgroundColor: Color.fromRGBO(220, 237, 33, 1)),
          BottomNavigationBarItem(
              icon: Icon(Icons.article_sharp),
              label: ("Daftar Produk"),
              backgroundColor: Color.fromRGBO(220, 237, 33, 1)),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: ("Profil Pengguna"),
              backgroundColor: Color.fromRGBO(220, 237, 33, 1))
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
