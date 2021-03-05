import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  DateTime _selecteddate;

  void _submitted() {
    if (amounteditingcontroller.text.isEmpty) {
      return;
    }
    final enteredtitled = titleeditingcontroller.text;
    final enterdamount = double.parse(amounteditingcontroller.text);
    if (enterdamount <= 0 || enteredtitled.isEmpty || _selecteddate == null) {
      return;
    }
    widget.addTx(enteredtitled, enterdamount, _selecteddate);
    Navigator.of(context).pop();
  }

  void _presentdatepicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickeddate) {
      if (pickeddate == null) {
        return;
      }
      setState(() {
        _selecteddate = pickeddate;
      });
    });
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
                onSubmitted: (_) => _submitted(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amounteditingcontroller,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitted(),
              ),
              Container(
                height: 80,
                child: Row(
                  children: [
                    Expanded(
                        child: Text(_selecteddate == null
                            ? 'No Date Chosen!'
                            : 'picked date: ${DateFormat.yMd().format(_selecteddate)}')),
                    TextButton(
                        onPressed: _presentdatepicker,
                        child: Text(
                          'Choose Date',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: _submitted,
                child: Text(
                  'Add Transaction',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
