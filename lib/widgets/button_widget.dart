import 'package:flutter/material.dart';
import 'package:yellowbox/assets/color.dart';
import 'package:yellowbox/assets/text_style.dart';

class BuildButton extends StatelessWidget {
  BuildButton(
      {required this.text,
      required this.onPressed,
      required this.width,
      this.radius,
      this.paddingOrNot,
      this.marginTopOrNot});

  final String text;
  final void Function() onPressed;
  final double width;
  final double? radius;
  final bool? paddingOrNot;
  final bool? marginTopOrNot;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: marginTopOrNot == null ? 30 : 0),
      padding: EdgeInsets.symmetric(
          vertical: paddingOrNot == null
              ? 20
              : paddingOrNot == true
                  ? 0
                  : 0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(width, 50),
          primary: CollectionsColors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius == null ? 10 : radius!),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: FontCollection.buttonText,
        ),
      ),
    );
  }
}

class BuildSmallButton extends StatelessWidget {
  BuildSmallButton({
    required this.text,
    required this.onPressed,
    required this.width,
    this.radius,
  });

  final String text;
  final void Function() onPressed;
  final double width;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(width, 50),
          primary: CollectionsColors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius == null ? 10 : radius!),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: FontCollection.buttonText,
        ),
      ),
    );
  }
}

class BuildSecondButton extends StatelessWidget {
  BuildSecondButton({
    required this.text,
    required this.onPressed,
    required this.width,
    this.radius,
  });

  final String text;
  final void Function() onPressed;
  final double width;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(width, 50),
          primary: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: CollectionsColors.orange, width: 2),
            borderRadius: BorderRadius.circular(radius == null ? 10 : radius!),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: FontCollection.orangeButtonText,
        ),
      ),
    );
  }
}
