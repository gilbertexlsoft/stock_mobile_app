import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 16.0),
              _buildDashboardCard(
                context,
                title: 'Products',
                icon: Icons.shopping_bag,
                count: '100',
                iconColor: '',
              ),
              SizedBox(height: 16.0),
              _buildDashboardCard(
                context,
                title: 'Vendors',
                icon: Icons.people_alt,
                count: '20',
                iconColor: '',
              ),
              SizedBox(height: 16.0),
              _buildDashboardCard(
                context,
                title: 'Banks',
                icon: Icons.account_balance,
                count: '5',
                iconColor: '',
              ),
              SizedBox(height: 16.0),
              _buildDashboardCard(
                context,
                title: 'Sales',
                icon: Icons.attach_money,
                count: '500',
                iconColor: '',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardCard(BuildContext context,
      {required String title,
      required IconData icon,
      required String count,
      required String iconColor}) {
    return Card(
      elevation: 4, // Change the elevation as needed
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: Color(0xFF1E1F3D),
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 40,
              color: Color.fromARGB(255, 214, 214, 0),
            ),
            SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Total: $count',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
