import 'package:flutter/material.dart';
import 'package:yellowbox/assets/color.dart';
import 'package:yellowbox/assets/text_style.dart';

class BuildDropdown extends StatelessWidget {
  BuildDropdown({required this.topic, required this.value, required this.list, required this.onChanged});

  final String topic;
  final String value;
  final List<String> list;
  final void Function(String?)? onChanged;

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
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                iconSize: 25,
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: CollectionsColors.navy,
                ),
                isExpanded: true,
                value: value.isEmpty ? list.first : value,
                style: FontCollection.body,
                onChanged: onChanged,
                hint: Text(
                  'Test',
                  style: TextStyle(
                    color: CollectionsColors.grey,
                  ),
                ),
                items: list.map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: FontCollection.body,
                    ),
                  ),
                ).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BuildPlainDropdown extends StatelessWidget {
  BuildPlainDropdown({required this.value, required this.list, required this.onChanged, this.hint});

  final String value;
  final List<String> list;
  final void Function(String?)? onChanged;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 5),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            iconSize: 25,
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: CollectionsColors.navy,
            ),
            isExpanded: true,
            value: value.isEmpty ? list.first : value,
            style: FontCollection.body,
            onChanged: onChanged,
            hint: Text(
              hint!,
              style: TextStyle(
                color: CollectionsColors.grey,
              ),
            ),
            items: list.map((item) => DropdownMenuItem<String>(
              value: item,
              child: Row(
                children: [
                  Text(
                    item,
                    style: FontCollection.body,
                  ),
                ],
              ),
            ),
            ).toList(),
          ),
        ),
      ),
    );
  }
}
