import 'dart:math';

import 'package:expenses_project/models/transaction.dart';
import 'package:flutter/material.dart';
import './input.dart';

class FormWidget extends StatefulWidget {
  final Function(String, double) changeTransaction;
  FormWidget({super.key, required this.changeTransaction});

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  String title = '';
  String value = '';

  void setTitle(String title) {
    setState(() {
      this.title = title;
    });
  }

  void setValue(String value) {
    setState(() {
      this.value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.transparent,
              ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Center(
                child: Icon(size: 48, color: Colors.black, Icons.minimize),
              ),
            ),
            Expanded(
              child: Form(
                child: Column(
                  children: [
                    SizedBox(
                      height: 24,
                    ),
                    InputWidget(
                        name: 'Titulo',
                        type: null,
                        onInputChanged: (String value) {
                          setTitle(value);
                        }),
                    SizedBox(
                      height: 16,
                    ),
                    InputWidget(
                        name: 'Valor',
                        type: 'money',
                        onInputChanged: (String value) {
                          setValue(value);
                        }),
                    SizedBox(
                      height: 56,
                    ),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 48),
                            backgroundColor: Colors.deepPurple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                          onPressed: () => {
                                widget.changeTransaction(
                                    title, double.parse(value)),
                                Navigator.pop(context)
                              },
                          child: Text('Confirmar')),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
