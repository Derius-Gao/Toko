import 'package:flutter/material.dart';
import 'package:tokoonline/constans.dart';
import 'package:tokoonline/users/depanpage.dart';
import 'package:tokoonline/users/kategoripage.dart';

class Beranda extends StatefulWidget {
  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> with SingleTickerProviderStateMixin {
      late TabController _tabController;
      // ignore: unused_field
      late int _ActiveTabIndex;
      
       @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
}

      @override
      // ignore: override_on_non_overriding_member
      void initstate() {
        super.initState();
        _tabController = TabController(vsync: this, length: 2);
        _tabController.addListener(_setActiveTabIndex);
      }

      void _setActiveTabIndex(){
        _ActiveTabIndex =  _tabController.index;
      }

      @override
      void dispose() {
        super.dispose();
      }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onTap: () {
          },
          readOnly: true,
          style: TextStyle(fontSize: 15),
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: Icon(Icons.search, color: Palette.orange),
            contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: new BorderSide(color: Colors.white),
            ),
            fillColor: Color(0xfff3f3f4),
            filled: true),
          ),
          backgroundColor: Palette.bg1,
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Palette.orange,
            labelColor: Palette.orange,
            unselectedLabelColor: Colors.grey,
            labelPadding: EdgeInsets.all(0),
            tabs: [
              Tab(text: 'Beranda'),
              Tab(text: 'Kategori'),
            ],
        )
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          DepanPage(),
          KategoriPage(),
        ],
      )
    );
  }
}
