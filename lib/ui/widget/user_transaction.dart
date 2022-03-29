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
    if (inputShoesController.text.isEmpty || inputPriceController.text.isEmpty)
      return;

    _selectHandler(
        inputShoesController.text, double.parse(inputPriceController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(children: [
        TextField(
          decoration:
              InputDecoration(border: InputBorder.none, labelText: 'Brand'),
          controller: inputShoesController,
          onSubmitted:
              inputShoesController.text.isEmpty ? null : _selectHandler(),
        ),
        TextField(
          controller: inputPriceController,
          decoration:
              InputDecoration(border: InputBorder.none, labelText: 'Price'),
          keyboardType: TextInputType.number,
          maxLength: 5,
          onSubmitted:
              inputPriceController.text.isEmpty ? null : _selectHandler(),
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
