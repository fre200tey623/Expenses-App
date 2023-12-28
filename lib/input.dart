import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  InputWidget({super.key, required this.name, required this.type, required this.onInputChanged});

  final String name;
  final String? type;
  final Function(String) onInputChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name),
        TextFormField(
          onChanged: onInputChanged,
          keyboardType:
              type == 'money' ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(
            prefix: type == 'money' ? const Text('R\$') : null,
          ),
        ),
      ],
    );
  }
}
