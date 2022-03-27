import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class UserTransaction extends StatelessWidget {
  final inputShoesController = TextEditingController();
  final inputPriceController = TextEditingController();
  final Function _selectHandler;

  UserTransaction(
    this._selectHandler,
  );

  void _onSubmitted() {
    if (inputPriceController.text.isEmpty && inputPriceController.text.isEmpty)
      return;
    _selectHandler(
        inputShoesController.text, double.parse(inputPriceController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(children: [
        Card(
          elevation: 20,
          child: Container(
            margin: EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'input shoes...'),
                  controller: inputShoesController,
                  onSubmitted: inputShoesController.text.isEmpty
                      ? null
                      : _selectHandler(),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'price...'),
                  controller: inputPriceController,
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  onSubmitted: inputPriceController.text.isEmpty
                      ? null
                      : _selectHandler(),
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
            IconButton(onPressed: _onSubmitted, icon: Icon(IconlyBold.bag)),
          ],
        )
      ]),
    );
  }
}
