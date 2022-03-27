import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../model/shoes.dart';

class Chart extends StatelessWidget {
  List<Shoes> _shoesList;
  final VoidCallback _delete;
  Chart(this._shoesList, this._delete);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Card(
        elevation: 10,
        child: Container(
            width: double.infinity,
            height: 400,
            child: ListView.builder(
                itemCount: _shoesList.length,
                itemBuilder: (context, index) => Card(
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Colors.black,
                              width: 2,
                            )),
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              _shoesList[index].price.toStringAsFixed(2),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              _shoesList[index].name,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: IconButton(
                                onPressed: _delete,
                                icon: Icon(IconlyBold.delete)),
                          ),
                        ],
                      ),
                    ))),
      ),
    );
  }
}
