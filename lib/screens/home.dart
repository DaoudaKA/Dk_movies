import 'package:flutter/material.dart';
import 'package:movie/pages/search_page.dart';
import 'package:movie/screens/account_page/account_page.dart';
import 'package:movie/screens/favorites_page/favorites_page.dart';
import 'package:movie/screens/home_page/home_page.dart';
import 'package:provider/provider.dart';
import '../providers/navigation_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    final List<Widget> pages = [
      HomePage(),
      SearchPage(),
      FavoritesPage(),
      AccountPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'WELCOME IN DK_MOVIES',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Beau Rivage',
              fontSize: 24,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 155, 188, 229),
      ),
      body: Container(
        color: const Color.fromARGB(255, 151, 170, 194),
        child: pages[navigationProvider.selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: Colors.transparent,
        currentIndex: navigationProvider.selectedIndex,
        onTap: (index) {
          navigationProvider.setIndex(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Recherche',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoris',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Compte',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
