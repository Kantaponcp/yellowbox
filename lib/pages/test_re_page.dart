import 'package:flutter/material.dart';
import 'package:yellowbox/utils/constant.dart';
import 'package:yellowbox/widgets/appbar_widget.dart';
import 'package:yellowbox/widgets/button_widget.dart';
import 'package:yellowbox/widgets/card_widget.dart';
import 'package:yellowbox/widgets/dropdown_widget.dart';
import 'package:yellowbox/widgets/textfield_widget.dart';
import 'package:yellowbox/widgets/widgets.dart';

class TestREPage extends StatefulWidget {
  const TestREPage({Key? key}) : super(key: key);

  @override
  State<TestREPage> createState() => _TestREPageState();
}

class _TestREPageState extends State<TestREPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    TextEditingController reCode = TextEditingController();
    TextEditingController input = TextEditingController();

    return Scaffold(
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.3),
        child: Column(
          children: [
            buildMainTitle(topic: 'Rule Engine Test'),
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
      ),
    );
  }
}
