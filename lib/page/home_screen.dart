import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:shoes_app/model/shoes.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Shoes> shoesList = [];

  final inputShoesController = TextEditingController();

  final inputPriceController = TextEditingController();

  void addShoes() {
    final shoes = Shoes(
        name: inputShoesController.text,
        price: (inputPriceController.text.isEmpty ||
                inputPriceController.text !=
                    int.parse(inputPriceController.text))
            ? null
            : int.parse(inputPriceController.text),
        date: DateTime.now());
    if (shoes == null) return;
    setState(() {
      shoesList.add(shoes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Card(
              elevation: 10,
              child: Container(
                width: double.infinity,
                height: 400,
                child: Column(
                  children: shoesList
                      .map((e) => Card(
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                    color: Colors.black,
                                    width: 2,
                                  )),
                                  margin: EdgeInsets.all(10),
                                  child: Text(
                                      "${(e.price == null) ? null : e.price!.toStringAsFixed(2)}"),
                                ),
                                Container(
                                  child: Text(e.name),
                                )
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
            Card(
              elevation: 20,
              child: Container(
                margin: EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'input shoes...'),
                      controller: inputShoesController,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'price...'),
                      controller: inputPriceController,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(onPressed: addShoes, icon: Icon(IconlyBold.bag)),
                IconButton(onPressed: () {}, icon: Icon(IconlyBold.delete)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
