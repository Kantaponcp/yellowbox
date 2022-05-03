import 'package:flutter/material.dart';
import 'package:yellowbox/assets/color.dart';
import 'package:yellowbox/assets/text_style.dart';

class BuildCard extends StatelessWidget {
  BuildCard({required this.children, this.optionalChild});

  final List<Widget> children;
  final Widget? optionalChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            color: CollectionsColors.black.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      margin: EdgeInsets.only(bottom: 50),
      child: Column(
        children: children,
      ),
    );
  }
}

class BuildSection extends StatelessWidget {
  BuildSection(
      {required this.topic,
      required this.child,
      this.icon,
      this.onPressed,
      this.noPadding});

  final String topic;
  final Widget child;
  final IconData? icon;
  final VoidCallback? onPressed;
  final bool? noPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    topic,
                    style: FontCollection.orangeTitle,
                  ),
                ),
                icon == null
                    ? SizedBox.shrink()
                    : InkWell(
                        onTap: onPressed,
                        child: Icon(
                          icon,
                          color: CollectionsColors.orange,
                        ),
                      ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: noPadding == null
                    ? 40
                    : noPadding == true
                        ? 0
                        : 40),
            child: child,
          ),
        ],
      ),
    );
  }
}
