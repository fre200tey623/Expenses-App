import 'dart:math';
import 'package:expenses_project/models/expenses_model.dart';
import 'package:provider/provider.dart';

import './card.dart';
import 'package:expenses_project/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './form.dart';
import './transaction_list.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => ExpensesModel(),child: MyApp(),));
}

class MyApp extends StatelessWidget {
  final ThemeData tema = ThemeData();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  
  @override
  Widget build(BuildContext context) {
    return Consumer <ExpensesModel>(builder: (context, value, child) => Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Despesas Pessoais"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: CardWidget(recentTransaction: []),
          ),
          const SizedBox(height: 12),
          value.transaction.isEmpty
              ? Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Nenhuma transação cadastrada!"),
                    const SizedBox(height: 8),
                    SizedBox(width: 120,height: 120,child: Image.asset("assets/piggy-bank.png"))
                  ],
                ),
              )
              : Transaction_List(transaction: value.transaction.cast<Transaction>())
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
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child:
                    FormWidget(),
              );
            },
          ),
        },
      ),
    ));
  }
}
