import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  @override
  List<String> countries = [
    "ATM",
    "Accessories",
    "Dining",
    "Bank Services",
    "Electronics",
    "Hotel",
    "Kids Toys",
    "Offices",
  ];

  Widget build(BuildContext context) {
    countries.sort((a, z) {
      return a.compareTo(z);
    });
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: Column(
            children: countries.map((cone) {
              return Container(
                child: Card(
                  elevation: 1,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15),
                    child: Text(
                      cone,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
