import 'dart:math';
import 'package:expenses_project/models/expenses_model.dart';
import 'package:expenses_project/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/input.dart';

class FormWidget extends StatefulWidget {
  FormWidget({super.key});

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ExpensesModel>(
      builder: (context, value, child) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Icon(Icons.minimize, size: 48),
                      const SizedBox(height: 16),
                      const Text("Adicionar nova despesa",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08),
                      InputWidget(
                          name: 'Título',
                          type: 'text',
                          onInputChanged: value.setTitle),
                      const SizedBox(height: 16),
                      InputWidget(
                          name: 'Valor',
                          type: 'money',
                          onInputChanged: value.setValue),
                      const SizedBox(height: 16),
                      value.error == true
                          ? const Text(
                              style: TextStyle(color: Colors.red),
                              "Os campos não podem ser vazios")
                          : Container(),
                      const SizedBox(height: 48),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 4,
                              minimumSize: const Size(double.infinity, 56),
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              value.newTransaction(value.title, value.value);
                              Navigator.pop(context);
                            },
                            child: const Text('Confirmar')),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
