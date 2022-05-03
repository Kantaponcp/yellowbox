import 'package:flutter/material.dart';
import 'package:yellowbox/assets/text_style.dart';
import 'package:yellowbox/utils/constant.dart';
import 'package:yellowbox/widgets/appbar_widget.dart';
import 'package:yellowbox/widgets/button_widget.dart';
import 'package:yellowbox/widgets/card_widget.dart';
import 'package:yellowbox/widgets/dropdown_widget.dart';
import 'package:yellowbox/widgets/textfield_widget.dart';
import 'package:yellowbox/widgets/widgets.dart';

class TestOverallPage extends StatefulWidget {
  const TestOverallPage({Key? key}) : super(key: key);

  @override
  State<TestOverallPage> createState() => _TestOverallPageState();
}

class _TestOverallPageState extends State<TestOverallPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    TextEditingController aiCode = TextEditingController();
    TextEditingController reCode = TextEditingController();
    TextEditingController input = TextEditingController();

    return Scaffold(
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.3),
        child: Column(
          children: [
            buildMainTitle(topic: 'Overall Test'),
            BuildCard(
              children: [
                BuildSection(
                  topic: 'AI Setting',
                  child: Column(
                    children: [
                      BuildDropdown(
                        topic: 'หมวดหมู่',
                        list: aiSettingGen.aiCat,
                        value: catValTest,
                        onChanged: (value) {},
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: BuildPlainTextField(
                          controller: aiCode,
                          hint: 'AI Setting code',
                          maxLine: 6,
                          onChange: (_) {},
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: BuildSection(
                    topic: 'รูปภาพ',
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: BuildSmallButton(
                                    text: 'เลือกรูปภาพ',
                                    onPressed: () {},
                                    width: width * 0.5,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: BuildSecondButton(
                                    text: 'อัปโหลดรูปภาพ',
                                    onPressed: () {},
                                    width: width * 0.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'รูปภาพที่เลือก',
                            style: FontCollection.body,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            BuildCard(
              children: [
                BuildSection(
                  topic: 'Rule Engine',
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: BuildPlainTextField(
                          controller: reCode,
                          hint: 'Rule Engine code',
                          maxLine: 6,
                          onChange: (_) {},
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: BuildSection(
                    topic: 'Input',
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          child: BuildPlainTextField(
                            controller: input,
                            hint: 'AI Setting code',
                            maxLine: 6,
                            onChange: (_) {},
                          ),
                        ),
                        BuildButton(
                          text: 'ตรวจสอบ',
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
          ],
        ),
      )
    );
  }
}
