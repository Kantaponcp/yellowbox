
import 'package:flutter/material.dart';
import 'package:yellowbox/assets/text_style.dart';

class CustomTab extends StatelessWidget {
  CustomTab({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(this.text, style: FontCollection.body,),
    );
  }
}
