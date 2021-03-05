import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/chart.dart';
import 'package:personal_expenses/widgets/new_transaction.dart';
import 'package:personal_expenses/widgets/transaction_list.dart';

import 'models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(fontFamily: 'OpenSans',
          fontWeight: FontWeight.bold,
          fontSize: 18)
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
            fontWeight: FontWeight.bold
          ))
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final List<Transaction> _usertransactions = [
  ];
  
  List<Transaction> get _recentTransaction{
    return _usertransactions.where((element){
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addnewtransaction(String title, double amount, DateTime choosendate) {
    final newTx = Transaction(
        title: title,
        id: DateTime.now().toString(),
        amount: amount,
        date: choosendate);
    setState(() {
      _usertransactions.add(newTx);
    });
  }
  void _deleteTransaction(String id){
    setState(() {
      _usertransactions.removeWhere((element) => element.id == id);
    });

  }
  void _startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: New_Transaction(_addnewtransaction ),
            onTap: () { },
            behavior: HitTestBehavior.opaque,
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _startNewTransaction(context);
              })
        ],
        title: Text('Personal Expenses'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(_recentTransaction),
            TransactionList(transactions: _usertransactions, deleteTx: _deleteTransaction,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _startNewTransaction(context);
        },
      ),
    );
  }
}
