import 'package:expenses_project/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Add this import statement

class CardWidget extends StatefulWidget {
  final List<Transaction> recentTransaction;
  const CardWidget({super.key, required this.recentTransaction});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {

  List<Map<String,Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      List<Transaction> recentTransaction = widget.recentTransaction;
      for (var i = 0; i < recentTransaction.length; i++) {
        bool sameDay = recentTransaction[i].date.day == weekDay.day;
        bool sameMonth = recentTransaction[i].date.month == weekDay.month;
        bool sameYear = recentTransaction[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += recentTransaction[i].value;
        }
      }

      print(DateFormat.E().format(weekDay)[0]);
      print(totalSum);

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    });
  }

  
  final array = ['a', 'b', 'c', 'd', 'e', 'f', 'g'];

  @override
  Widget build(BuildContext context) {
    print(groupedTransactions);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Padding(
        padding: EdgeInsets.only(top: 8),
        child: Card(
          elevation: 5,
          color: Theme.of(context).colorScheme.primary,
          child: Expanded(
            child: Padding(
              
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: array.map((e) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(e, style: TextStyle(color: Colors.white, fontSize: 16)),
                        SizedBox(height: 4),
                        Container(
                          height: 56,
                          width: 12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(e, style: TextStyle(color: Colors.white, fontSize: 16)),
                      ],
                    )).toList(),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
