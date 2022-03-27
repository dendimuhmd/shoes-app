import 'package:flutter/material.dart';
import 'package:shoes_app/model/shoes.dart';
import 'package:shoes_app/widget/chart.dart';
import 'package:shoes_app/widget/user_transaction.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Shoes> shoesList = [];
  void _addShoes(String name, double price) {
    final txShoes = Shoes(
        name: name,
        price: double.parse(price.toString()),
        date: DateTime.now());

    setState(() {
      shoesList.add(txShoes);
    });
  }

  void _delete() {
    if (shoesList.length <= 0) return;
    shoesList.removeLast();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [Chart(shoesList, _delete), UserTransaction(_addShoes)],
          ),
        ),
      ),
    );
  }
}
