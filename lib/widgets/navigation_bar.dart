import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          NavigationItem(title: 'Home'),
          NavigationItem(title: 'About'),
          NavigationItem(title: 'Contact'),
        ],
      ),
    );
  }
}


class NavigationItem extends StatelessWidget {

  final String title;

  const NavigationItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }
}