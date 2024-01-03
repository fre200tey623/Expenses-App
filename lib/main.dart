import 'dart:math';
import './card.dart';
import 'package:expenses_project/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './form.dart';
import './transaction_list.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeData tema = ThemeData();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: MyHomePage(),
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.deepPurple,
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final transaction = [];
  bool error = false;

  void addTransaction(String title, double value) {
    if (title.isEmpty || value <= 0) {
      return;
    }

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
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Despesas Pessoais"),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: FormWidget(
                        changeTransaction: addTransaction, error: error),
                  );
                },
              );
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CardWidget(),
          SizedBox(height: 12),
          transaction.isEmpty
              ? Container(
                  child: const Expanded(
                      child:
                          Center(child: Text("Nenhuma transação cadastrada!"))))
              : Transaction_List(transaction: transaction.cast<Transaction>())
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
                child:
                    FormWidget(changeTransaction: addTransaction, error: error),
              );
            },
          ),
        },
      ),
    );
  }
}
