import 'package:flutter/material.dart';
import 'package:yellowbox/assets/color.dart';
import 'package:yellowbox/assets/text_style.dart';
import 'package:yellowbox/widgets/appbar_widget.dart';
import 'package:yellowbox/widgets/button_widget.dart';
import 'package:yellowbox/widgets/card_widget.dart';
import 'package:yellowbox/widgets/dropdown_widget.dart';
import 'package:yellowbox/widgets/textfield_widget.dart';
import 'package:yellowbox/widgets/widgets.dart';

class GeneratorREPage extends StatefulWidget {
  const GeneratorREPage({Key? key}) : super(key: key);

  @override
  State<GeneratorREPage> createState() => _GeneratorREPageState();
}

class _GeneratorREPageState extends State<GeneratorREPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    String question = '';
    String condition = '';

    List<String> listQuestions = ['Test1', 'Test2','Test3', 'Test4',];
    List<String> listConditions = ['Test1', 'Test2','Test3', 'Test4',];

    TextEditingController sku = TextEditingController();
    TextEditingController conditionNum = TextEditingController();

    return Scaffold(
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.3),
        child: Column(
          children: [
            buildMainTitle(topic: 'Rule Engine Generator'),
            BuildCard(
              children: [
                BuildSection(
                  topic: 'เลือกคำถาม',
                  child: Column(
                    children: [
                      BuildDropdown(
                        topic: 'เลือกคำถาม',
                        value: question,
                        list: listQuestions,
                        onChanged: (_) {},
                      ),
                      BuildButton(
                        text: 'เลือก',
                        onPressed: () {},
                        width: width,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            BuildCard(
              children: [
                BuildSection(
                  topic: 'ผลิตภัณฑ์',
                  child: BuildTextField(
                    topic: 'ชื่อผลิตภัณฑ์',
                    controller: sku,
                    hint: 'กรุณากรอกชื่อผลิตภัณฑ์',
                    onChange: (_) {},
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: BuildSection(
                    topic: 'เงื่อนไข',
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Flexible(
                                flex: 2,
                                child: BuildDropdown(
                                  topic: 'เงื่อนไข',
                                  value: condition,
                                  list: listConditions,
                                  onChanged: (_) {},
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: BuildTextField(
                                    topic: 'จำนวน',
                                    controller: conditionNum,
                                    hint: 'กรอกจำนวน',
                                    onChange: (_) {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        showSKU(
                          topic: 'เงื่อนไขทั้งหมด',
                          isSS: false,
                        ),
                        BuildButton(
                          text: 'สร้าง',
                          onPressed: () {},
                          width: width,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            buildOutput(result: 'result'),
            buildRunButton(context),
          ],
        ),
      ),
    );
  }
}


