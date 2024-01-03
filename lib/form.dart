import 'dart:math';

import 'package:expenses_project/models/transaction.dart';
import 'package:flutter/material.dart';
import 'components/input.dart';

class FormWidget extends StatefulWidget {
  final Function(String, double) changeTransaction;
  bool error;

  FormWidget({super.key, required this.changeTransaction, required this.error});

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

  void setError(bool error) {
    setState(() {
      widget.error = error;
    });
    print('Valor do error dentro do widget->' + error.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
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
                  setError(false);
                  Navigator.pop(context);
                },
                child: const Center(
                  child: Icon(size: 48, color: Colors.black, Icons.minimize),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 24),
                      InputWidget(
                          name: 'Titulo',
                          type: null,
                          onInputChanged: (String value) {
                            setTitle(value);
                          }),
                      SizedBox(height: 16),
                      InputWidget(
                          name: 'Valor',
                          type: 'money',
                          onInputChanged: (String value) {
                            setValue(value);
                          }),
                      SizedBox(height: 16),
                      widget.error == true
                          ? Text(
                              style: TextStyle(color: Colors.red),
                              "Os campos não podem ser vazios")
                          : Container(),
                      SizedBox(height: 56),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 48),
                              backgroundColor: Theme.of(context).colorScheme.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                            ),
                            onPressed: () => {
                                  widget.changeTransaction(title,
                                      value == '' ? 0 : double.parse(value)),
                                  if (title == '' || value == '')
                                    {
                                      setError(true),
                                    }
                                  else
                                    {
                                      setError(false),
                                      Navigator.pop(context),
                                    }
                                  //Navigator.pop(context)
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
      ),
    );
  }
}
