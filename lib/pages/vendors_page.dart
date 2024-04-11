import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VendorsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vendors'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final token = '95671cefc1141c5172aea24e36a8615027c93112';
            fetchProducts(
              vendorId: '',
              productName: '',
              productCode: '',
              pageNumber: 1,
              itemsPerPage: 10,
              token: token,
            );
          },
          child: Text('Fetch Vendors'),
        ),
      ),
    );
  }

  Future<void> fetchProducts({
    required String vendorId,
    required String productName,
    required String productCode,
    required int pageNumber,
    required int itemsPerPage,
    required String token,
  }) async {
    final url = Uri.parse(
        'http://103.211.218.241/api/get_vendors?vendor_id=$vendorId&product_name=$productName&product_code=$productCode&page_number=$pageNumber&items_per_page=$itemsPerPage');

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'token $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print(responseData);
      } else {
        print('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
