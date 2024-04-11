import 'package:flutter/material.dart';
import 'pages/dashboard_page.dart';
import 'pages/products_page.dart';
import 'pages/vendors_page.dart';
import 'pages/banks_page.dart';
import 'pages/sales_page.dart';
import 'pages/profile_page.dart';

class SidebarLayout extends StatefulWidget {
  @override
  _SidebarLayoutState createState() => _SidebarLayoutState();
}

class _SidebarLayoutState extends State<SidebarLayout> {
  int _selectedIndex = 0;

  List<bool> _pageSelected = List.generate(6, (index) => false);

  List<Widget> _pages = [
    DashboardPage(),
    ProductsPage(),
    VendorsPage(),
    BanksPage(),
    SalesPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock App'),
      ),
      drawer: Drawer(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              _buildDrawerHeader(),
              _buildDrawerItem(Icons.dashboard, 'Dashboard', 0),
              _buildDrawerItem(Icons.shopping_cart, 'Products', 1),
              _buildDrawerItem(Icons.people, 'Vendors', 2),
              _buildDrawerItem(Icons.account_balance, 'Banks', 3),
              _buildDrawerItem(Icons.attach_money, 'Sales', 4),
              _buildDrawerItem(Icons.person, 'Profile', 5),
            ],
          ),
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, int index) {
    return Column(
      children: <Widget>[
        Container(
          color: _pageSelected[index]
              ? Color.fromARGB(255, 163, 1, 163)
              : Theme.of(context).primaryColor,
          child: ListTile(
            leading: Icon(
              icon,
              color: Colors.white,
            ), // Set icon color to white
            title: Text(
              title,
              style: TextStyle(
                color: Colors.white,
              ),
            ), // Set text color to white
            onTap: () {
              _selectPage(index);
              Navigator.pop(context);
            },
          ),
        ),
        const Divider(
          height: 0,
          color: Color.fromARGB(40, 255, 255,
              255), // Set divider color to a lighter shade of primary color
          thickness: 1,
          indent: 16,
          endIndent: 16,
        ),
      ],
    );
  }

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
      for (int i = 0; i < _pageSelected.length; i++) {
        _pageSelected[i] = i == index;
      }
    });
  }

  Widget _buildDrawerHeader() {
    return const DrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://img.freepik.com/free-photo/ethereal-environment-with-cloth_23-2151113623.jpg?t=st=1707461849~exp=1707465449~hmac=6c4629e14641e7e28ea9e43f5ce68efe1f05fd475436cd0e51b2d687456cc40c&w=1380',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30,
            child: Text(
              'U',
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Username',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Email@example.com', // You can replace with actual email
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
