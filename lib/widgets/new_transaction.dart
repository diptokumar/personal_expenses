import 'package:flutter/material.dart';
// ignore: camel_case_types
class New_Transaction extends StatelessWidget {
  final Function addTx;
  New_Transaction(this.addTx);
  final titleeditingcontroller = TextEditingController();
  final amounteditingcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              autocorrect: true,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: titleeditingcontroller,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amounteditingcontroller,
            ),
            FlatButton(
              onPressed: () {
                  addTx(titleeditingcontroller.text, double.parse(amounteditingcontroller.text));
              },
              child: Text('Add Transaction'),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
