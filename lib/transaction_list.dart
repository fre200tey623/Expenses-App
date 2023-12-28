import 'package:flutter/material.dart';
import './models/transaction.dart';
import 'package:intl/intl.dart'; // Import the intl package

class Transaction_List extends StatefulWidget {
  List<Transaction> transaction;
  Transaction_List({super.key, required this.transaction});

  @override
  State<Transaction_List> createState() => _Transaction_ListState();
}

class _Transaction_ListState extends State<Transaction_List> {
  

  @override
  Widget build(BuildContext context) {
    return Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: widget.transaction.length,
              itemBuilder: (ctx, index) {
                final tr = widget.transaction[index];
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.paid,
                                color: Colors.yellow,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                'R\$ ${tr.value.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color(0xFF424242),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                tr.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w500,
                                  ),
                                  

                                  DateFormat('d MMM y') // Use the DateFormat class from the intl package
                                      .format(tr.date)
                                      .toString()), // Replace DateFormt with DateFormat
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
  }
}