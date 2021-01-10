import 'package:flutter/material.dart';

class EditText extends StatefulWidget {
  final String hint;
  final String emptyMessage;
  final TextInputType inputType;
  final bool obscureText;
  final int maxLength;
  final bool hideLengthIndicator;
  final bool unlimitedLines;

  EditText(
      {Key key,
      this.hideLengthIndicator = true,
      this.hint,
      this.maxLength = 100,
      this.unlimitedLines = false,
      this.emptyMessage = "Campo precisa ser preeenchido!",
      this.inputType = TextInputType.text,
      this.obscureText = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TextFormField(
        maxLines: widget.unlimitedLines ? null : 1,
        maxLength: widget.maxLength,
        buildCounter: (BuildContext context,
                {int currentLength, int maxLength, bool isFocused}) =>
            (widget.hideLengthIndicator
                ? null
                : Text("$currentLength/$maxLength")),
        keyboardType: widget.inputType,
        obscureText: widget.obscureText == null ? false : widget.obscureText,
        decoration: InputDecoration(
          labelText: widget.hint,
        ),
        validator: (value) {
          if (value.isEmpty) {
            return widget.emptyMessage;
          }
          return null;
        },
      ),
    );
  }
}
