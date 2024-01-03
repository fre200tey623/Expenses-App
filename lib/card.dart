import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({super.key});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  final array = ['a', 'b', 'c', 'd', 'e', 'f', 'g'];

  @override
  Widget build(BuildContext context) {
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
                          height: 60,
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
