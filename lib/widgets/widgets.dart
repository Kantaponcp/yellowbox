import 'package:flutter/material.dart';
import 'package:yellowbox/assets/color.dart';
import 'package:yellowbox/assets/text_style.dart';
import 'package:yellowbox/utils/constant.dart';

import 'button_widget.dart';
import 'card_widget.dart';

Widget showSKU({required String topic, required bool isSS}) {
  return isSS
      ? Container(
          padding: EdgeInsets.only(top: 20, bottom: 5),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  topic,
                  style: FontCollection.subTitle,
                ),
              ),
              Divider(thickness: 1,),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 20),
                    padding: EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Category',
                            style: FontCollection.body,
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 0),
                          child: Wrap(
                            spacing: 6.0,
                            runSpacing: 6.0,
                            children: List<Widget>.generate(3, (int index) {
                              return skuItem();
                            }),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: 2,
              ),
            ],
          ),
        )
      : Container(
          padding: EdgeInsets.only(top: 20, bottom: 5),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  topic,
                  style: FontCollection.subTitle,
                ),
              ),
              Divider(thickness: 1,),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 0),
                child: Wrap(
                  spacing: 6.0,
                  runSpacing: 6.0,
                  children: List<Widget>.generate(3, (int index) {
                    return skuItem();
                  }),
                ),
              ),
            ],
          ),
        );
}

Widget skuItem() {
  return Chip(
    padding: EdgeInsets.only(left: 10),
    deleteIconColor: CollectionsColors.white,
    backgroundColor: CollectionsColors.navy,
    label: Text(
      'กาแฟ',
      style: FontCollection.whiteBody,
    ),
    onDeleted: () {},
  );
}

Widget buildOutput({required String result}) {
  return BuildCard(
    children: [
      BuildSection(
        topic: 'ผลลัพธ์',
        icon: Icons.content_copy,
        onPressed: () {},
        child: Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(top: 20),
          child: Text(
            result,
            style: FontCollection.output,
          ),
        ),
      ),
    ],
  );
}

Widget buildRunButton(BuildContext context) {
  double width = MediaQuery.of(context).size.width;

  return Container(
    width: width,
    padding: EdgeInsets.only(bottom: 30),
    child: Row(
      children: [
        Flexible(
          flex: 5,
          child: BuildButton(
              text: 'Run AI Setting',
              onPressed: () {},
              width: width,
              marginTopOrNot: false),
        ),
        Spacer(
          flex: 1,
        ),
        Flexible(
          flex: 5,
          child: BuildButton(
            text: 'Run Overall',
            onPressed: () {},
            width: width,
            marginTopOrNot: false,
          ),
        ),
      ],
    ),
  );
}

Widget buildMainTitle({required String topic}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 40),
    alignment: Alignment.center,
    child: Text(
      topic,
      style: FontCollection.mainTitle,
    ),
  );
}

Widget buildDivider() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Divider(
      thickness: 1,
      color: CollectionsColors.navy,
    ),
  );
}

Widget buildTrueNoti() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: CollectionsColors.green,
    ),
    padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
    child: Row(
      children: [
        Icon(Icons.done, color: CollectionsColors.white,),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text('ข้อมูลถูกต้อง', style: FontCollection.whiteBody,),
        ),
      ],
    ),
  );
}

Widget buildFalseNoti() {
  return Column(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: CollectionsColors.red,
        ),
        padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.close, color: CollectionsColors.white,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('ข้อมูลไม่ถูกต้อง', style: FontCollection.whiteBody,),
            ),
          ],
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: CollectionsColors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: CollectionsColors.grey.withOpacity(0.3),
            ),
          ]
        ),
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(20),
        child: Text('error', style: FontCollection.redDetail,),
      ),
    ],
  );
}