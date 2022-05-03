import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yellowbox/assets/color.dart';
import 'package:yellowbox/assets/text_style.dart';

class BuildTextField extends StatelessWidget {
  BuildTextField(
      {required this.topic,
      required this.controller,
      this.onChange,
      this.hint,
      this.maxLine,
      this.focusNode,});

  final String topic;
  final TextEditingController controller;
  final void Function(String)? onChange;
  final String? hint;
  final int? maxLine;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 5),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              topic,
              style: FontCollection.body,
            ),
          ),
          Container(
            child: TextFormField(
              controller: controller,
              style: FontCollection.body,
              focusNode: focusNode,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: CollectionsColors.orange),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                hintText: 'hint',
                fillColor: CollectionsColors.orange,
                focusColor: CollectionsColors.orange,
              ),
              maxLines: maxLine,
              onChanged: onChange,
            ),
          ),
        ],
      ),
    );
  }
}

class BuildPlainTextField extends StatelessWidget {
  BuildPlainTextField({
    required this.controller,
    this.onChange,
    this.hint,
    this.maxLine,
    this.textInputType,
    this.focusNode,
    this.validator,
    this.textCapitalization,
  });

  final TextEditingController controller;
  final void Function(String)? onChange;
  final String? hint;
  final int? maxLine;
  final TextInputType? textInputType;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final TextCapitalization? textCapitalization;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: FontCollection.body,
      focusNode: focusNode,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: CollectionsColors.orange),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.grey)),
        hintText: 'hint text',
        fillColor: CollectionsColors.orange,
        focusColor: CollectionsColors.orange,
      ),
      validator: validator,
      keyboardType: textInputType,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      maxLines: maxLine,
      onChanged: onChange,
    );
  }
}
