import 'package:flutter/material.dart';
import 'package:yellowbox/assets/color.dart';
import 'package:yellowbox/assets/text_style.dart';
import 'package:yellowbox/widgets/appbar_widget.dart';
import 'package:yellowbox/widgets/button_widget.dart';
import 'package:yellowbox/widgets/card_widget.dart';
import 'package:yellowbox/widgets/widgets.dart';

class TemplateValidatorPage extends StatefulWidget {
  const TemplateValidatorPage({Key? key}) : super(key: key);

  @override
  State<TemplateValidatorPage> createState() => _TemplateValidatorPageState();
}

class _TemplateValidatorPageState extends State<TemplateValidatorPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.3),
        child: Column(
          children: [
            buildMainTitle(topic: 'Question Template Validator'),
            BuildCard(
              children: [
                BuildSection(
                  topic: 'อัปโหลดไฟล์',
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        width: width,
                        height: height * 0.5,
                        decoration: BoxDecoration(
                          border: Border.all(color: CollectionsColors.grey),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: dragWord(),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: new Container(
                                        margin: const EdgeInsets.only(
                                            left: 10.0, right: 20.0),
                                        child: Divider(
                                          color: CollectionsColors.grey,
                                          height: 36,
                                        )),
                                  ),
                                  Text(
                                    "หรือ",
                                    style: FontCollection.disBody,
                                  ),
                                  Expanded(
                                    child: new Container(
                                      margin: const EdgeInsets.only(
                                          left: 20.0, right: 10.0),
                                      child: Divider(
                                        color: CollectionsColors.grey,
                                        height: 36,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            BuildSmallButton(
                              text: 'เลือกไฟล์',
                              onPressed: () {},
                              width: width * 0.1,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Template ที่อัปโหลด',
                          style: FontCollection.orangeBody,
                        ),
                      ),
                      BuildButton(
                        text: 'ตรวจสอบ',
                        onPressed: () {},
                        width: width,
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget dragWord() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Icon(
            Icons.file_upload,
            color: CollectionsColors.grey,
          ),
        ),
        Text(
          'ลากและวางไฟล์ตรงนี้',
          style: FontCollection.disBody,
        ),
      ],
    );
  }
}
