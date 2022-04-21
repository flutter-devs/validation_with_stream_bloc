import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final Color color;
  final bool isBorder;
  final List<TextInputFormatter>? inputFormatters;
  final bool isObscureText;
  final Color labelColor;
  final String labelText;
  final String hintText;
  final TextStyle? labelStyle;
  final TextInputType textInputType;
  final int? maxLength;
  final int? maxLines;
  final ValueSetter<String>? onChange;
  final TextEditingController? textEditingController;

  CustomTextField({
    this.color = Colors.white,
    this.inputFormatters,
    this.isObscureText = false,
    this.labelColor = Colors.black,
    this.labelText = '',
    this.hintText = '',
    this.labelStyle,
    this.textInputType = TextInputType.text,
    this.maxLength,
    this.maxLines = 1,
    this.isBorder = true,
    this.onChange,
    this.textEditingController,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextStyle _labelStyle;

  @override
  Widget build(BuildContext context) {
    _labelStyle = widget.labelStyle ??
        const TextStyle(
          color: Colors.black38,
          fontSize: 14,
          height: 0.5,
        );

    return Container(
      decoration: BoxDecoration(
        border: widget.isBorder
            ? Border.all(color: Colors.black, width: 1.0)
            : null,
        color: widget.color,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 8,
      ),
      child: TextField(
        controller: widget.textEditingController,
        inputFormatters: widget.inputFormatters,
        onChanged: widget.onChange,
        obscureText: widget.isObscureText,
        maxLength: widget.maxLength,
        maxLines: widget.maxLines,
        style: const TextStyle(fontSize: 20),
        textAlign: TextAlign.start,
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
          counterText: '',
          labelText: widget.labelText,
          border: InputBorder.none,
          labelStyle: _labelStyle,
          hintText: widget.hintText,
          hintStyle: _labelStyle,
        ),
      ),
    );
  }
}
