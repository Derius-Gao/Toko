import 'package:flutter/material.dart';
import 'package:tokoonline/constans.dart';
import 'package:tokoonline/users/akunpage.dart';
import 'package:tokoonline/users/beranda.dart';
import 'package:tokoonline/users/favoritepage.dart';
import 'package:tokoonline/users/keranjangpage.dart';
import 'package:tokoonline/users/transaksipage.dart';

class LandingPage extends StatefulWidget {
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
int bottomNavCurrentIndex = 0;
 List <Widget> _Container = [

  new Beranda(),
  new FavoritePage(),
  new KeranjangPage(),
  new Transaksipage(),
  new AkunPage()
 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  _Container [bottomNavCurrentIndex],
        bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Palette.bg1, 
        type: BottomNavigationBarType.fixed,
         onTap: (index) { 
          setState(() { 
            bottomNavCurrentIndex = index;
            }); 
          },
          currentIndex: bottomNavCurrentIndex, 
          items: [
           BottomNavigationBarItem( 
            activeIcon: new Icon(
               Icons.home,
            color: Palette.bg1, 
            ),
            icon: new Icon(
              Icons.home,
              color: Colors.grey,
          
            ),
            label: 'Beranda',
           ),
    BottomNavigationBarItem(
      activeIcon: new Icon(
        Icons.favorite,
        color: Palette.bg1,
    ),
    icon: new Icon(
      Icons.favorite_border,
      color : Colors.grey,
    ),
    label: 'Favorite',
    ),
    BottomNavigationBarItem( 
            activeIcon: new Icon(
               Icons.shopping_cart,
            color: Palette.bg1, 
            ),
            icon: new Icon(
              Icons.shopping_cart,
              color: Colors.grey,
            ),
            label: 'Keranjang',
    ),
    BottomNavigationBarItem(
      activeIcon: new Icon(
        Icons.swap_horiz_sharp,
        color: Palette.bg1,
      ),
      icon: new Icon(
       Icons.swap_horiz_sharp,
        color: Colors.grey,
      ),
      label: 'Transaksi',
    ),
    BottomNavigationBarItem(
       activeIcon: new Icon(
        Icons.person,
        color: Palette.bg1,
      ),
      icon: new Icon(
      Icons.person_outline,
        color: Colors.grey,
      ),
      label: 'Profile',
    ),
          ],
        ),
    
    );
  }
}


