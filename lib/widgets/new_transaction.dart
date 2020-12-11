import 'package:flutter/material.dart';

// ignore: camel_case_types
class New_Transaction extends StatelessWidget {
  final Function addTx;
  New_Transaction(this.addTx);
  final titleeditingcontroller = TextEditingController();
  final amounteditingcontroller = TextEditingController();

  void submitted() {
    final enteredtitled = titleeditingcontroller.text;
    final enterdamount = double.parse(amounteditingcontroller.text);
    if (enterdamount <= 0 || enteredtitled.isEmpty) {
      return;
    }
    addTx(enteredtitled, enterdamount);
  }

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
              keyboardType: TextInputType.text,
              onSubmitted: (_) => submitted(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amounteditingcontroller,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitted(),
            ),
            FlatButton(
              onPressed: submitted,
              child: Text('Add Transaction'),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
