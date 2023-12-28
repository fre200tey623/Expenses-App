import 'dart:math';

import 'package:expenses_project/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './form.dart';
import './transaction_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  final transaction = [];

  void addTransaction(String title, double value) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now());

    setState(() {
      transaction.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Despesas Pessoais"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: const Card(
              elevation: 5,
              color: Colors.deepPurple,
              child: Text("Grafico"),
            ),
          ), 
          transaction.length == 0 ? Container(child: Expanded(child: Center(child: const Text("Nenhuma transação cadastrada!")))) :
          Transaction_List(transaction: transaction.cast<Transaction>())
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add),
        onPressed: () => {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            backgroundColor: Colors.transparent,
            builder: (BuildContext context) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: FormWidget( changeTransaction: addTransaction
                    ),
              );
            },
          )
        },
      ),
    );
  }
}
