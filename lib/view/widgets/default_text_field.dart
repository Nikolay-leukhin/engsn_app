// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:


import '../utils/colors.dart';

class DefaultTextField extends StatefulWidget {
  const DefaultTextField({
    Key? key,
    required this.controller,
    required this.keyboardType,
    this.height = 80,
    this.width = double.infinity,
    this.padding = const EdgeInsets.all(10),
    this.maxLines = 1,
    this.hintText = '',
    this.obscureText = false,
    this.icon,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType keyboardType;
  final double height;
  final double width;
  final EdgeInsets padding;
  final int? maxLines;
  final String hintText;
  final bool obscureText;
  final IconData? icon;

  @override
  State<DefaultTextField> createState() => _BaseTextFormFieldState();
}

class _BaseTextFormFieldState extends State<DefaultTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Padding(
        padding: widget.padding,
        child: TextFormField(
          maxLines: widget.maxLines,
          keyboardType: widget.keyboardType,
          autofocus: false,
          obscureText: widget.obscureText,
          textAlignVertical: TextAlignVertical.bottom,
          style: TextStyle(color: Colors.grey),
          decoration: InputDecoration(
            prefixIcon: Icon(widget.icon, color: Colors.grey,),
            hintStyle: TextStyle(
              color: Colors.grey
            ),
            fillColor: Colors.grey.withAlpha(10),
            filled: true,
            hintText: widget.hintText,
            label: widget.controller.text != '' ? Text(widget.hintText) : null,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide:  BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide:  BorderSide(
                color: AppColors.blue,
              ),
            ),
          ),

          onChanged: (String value) {
            setState(() {});
          },
          controller: widget.controller,
        ),
      ),
    );
  }
}

