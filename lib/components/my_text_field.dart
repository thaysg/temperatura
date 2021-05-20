import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String label;
  final String suffix;
  final String hint;
  final TextEditingController c;
  final Function f;

  const MyTextField(
      {Key key, this.label, this.suffix, this.hint, this.c, this.f})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: TextField(
          textAlign: TextAlign.center,
          controller: c,
          onChanged: f,
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            suffixText: suffix,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          keyboardType: TextInputType.numberWithOptions(
            decimal: true,
          ),
        ),
      ),
    );
  }
}
