import 'package:flutter/material.dart';
import 'package:rick_and_morty/screens/characters_screen.dart';
import 'package:rick_and_morty/screens/favourites_screen.dart';
import 'package:rick_and_morty/screens/settings_screen.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  int selectedPageIndex = 0;
  Widget activePage = const CharactersScreen();
  String activePageTitleText = "Select Character";

  void _selectedPageIndex(int index) {
    setState(() {
      selectedPageIndex = index;
      if (selectedPageIndex == 0) {
        activePage = const CharactersScreen();
        activePageTitleText = "Select Character";
      }
      if (selectedPageIndex == 1) {
        activePage = const FavouritesScreen();
        activePageTitleText = "Favourites";
      }
    });
  }

  void _navigateToSettings() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const SettingsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(activePageTitleText)),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: _navigateToSettings,
            )
          ],
          automaticallyImplyLeading: false,
        ),
        body: activePage,
        bottomNavigationBar: BottomNavigationBar(
            onTap: _selectedPageIndex,
            currentIndex: selectedPageIndex,
            items: const [
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.account_circle),
                  icon: Icon(Icons.account_circle_outlined),
                  label: "Characters"),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.star),
                  icon: Icon(Icons.star_border),
                  label: "Favourites")
            ]));
  }
}
