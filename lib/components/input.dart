import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String type;
  final String name;
  final Function(String) onInputChanged;
  const InputWidget({super.key, required this.type, required this.name, required this.onInputChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          onChanged:  (value) => onInputChanged(value),
          keyboardType:
              type == 'money' ? TextInputType.numberWithOptions( decimal: true) : TextInputType.text,
          decoration: InputDecoration(
            border: OutlineInputBorder( 
            ),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)),
            prefix: type == 'money' ? const Text('R\$') : null,
            label: Text(style: TextStyle(color: Theme.of(context).colorScheme.primary),name),
          ),
        ),
      ],
    );
  }
}
