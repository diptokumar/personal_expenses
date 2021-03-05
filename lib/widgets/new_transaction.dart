import 'package:flutter/material.dart';

// ignore: camel_case_types
class New_Transaction extends StatefulWidget {
  final Function addTx;
  New_Transaction(this.addTx);

  @override
  _New_TransactionState createState() => _New_TransactionState();
}

class _New_TransactionState extends State<New_Transaction> {
  final titleeditingcontroller = TextEditingController();
  final amounteditingcontroller = TextEditingController();

  void submitted() {
    final enteredtitled = titleeditingcontroller.text;
    final enterdamount = double.parse(amounteditingcontroller.text);
    if (enterdamount <= 0 || enteredtitled.isEmpty) {
      return;
    }
    widget.addTx(enteredtitled, enterdamount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
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
              TextButton(
                onPressed: submitted,
                child: Text('Add Transaction',
                style: TextStyle(
                  color: Colors.purple
                ),),

              )
            ],
          ),
        ),
      ),
    );
  }
}
