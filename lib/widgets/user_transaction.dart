import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'transaction_list.dart';
import 'new_transaction.dart';

class User_Tracsaction extends StatefulWidget {
  @override
  _User_TracsactionState createState() => _User_TracsactionState();
}

class _User_TracsactionState extends State<User_Tracsaction> {
  final List<Transaction> _usertransactions = [
    Transaction(title: 'Book', id: 't1', amount: 152.55, date: DateTime.now()),
    Transaction(title: 'Pencil', id: 't2', amount: 150, date: DateTime.now()),
  ];

  void _addnewtransaction(String title, double amount){
    final newTx = Transaction(title: title, id: DateTime.now().toString(), amount: amount, date: DateTime.now());
  setState(() {
    _usertransactions.add(newTx);
  });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        New_Transaction(_addnewtransaction),
        TransactionList(transactions: _usertransactions)
      ],
    );
  }
}
