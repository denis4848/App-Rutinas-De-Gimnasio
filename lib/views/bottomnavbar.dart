import 'package:flutter/material.dart';
import 'package:flutter_app/screens/exercisescreen.dart';
import 'package:flutter_app/screens/homescreen.dart';
import 'package:provider/provider.dart';

import '../screens/profilesceen.dart';
import 'changenotifier.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [SplashScreen(), MainScreen(), ProfileScreen()];
    final tabProvider = Provider.of<TabProvider>(context);
    print('Valor actual de selectedIndex: ${tabProvider.selectedIndex}'); // Agregar un print statement

    return Scaffold(
      body: IndexedStack(
        index: tabProvider.selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[700],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: tabProvider.selectedIndex, // Usar el valor de selectedIndex
        onTap: (value) {
          tabProvider.updateSelectedIndex(value);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color: Colors.amber),
            activeIcon: Icon(Icons.home, color: Colors.amber),
            label: 'Inicio',
            backgroundColor: Colors.grey[800],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline, color: Colors.amber),
            activeIcon: Icon(Icons.add_circle_outlined, color: Colors.amber),
            label: 'Ejercicios',
            backgroundColor: Colors.grey[800],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, color: Colors.amber),
            activeIcon: Icon(Icons.person, color: Colors.amber,),
            label: 'Perfil',
            backgroundColor: Colors.grey[800],
          ),
        ],
      ),
    );
  }
}
