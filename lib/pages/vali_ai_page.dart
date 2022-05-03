import 'package:flutter/material.dart';
import 'package:yellowbox/utils/constant.dart';
import 'package:yellowbox/widgets/appbar_widget.dart';
import 'package:yellowbox/widgets/button_widget.dart';
import 'package:yellowbox/widgets/card_widget.dart';
import 'package:yellowbox/widgets/dropdown_widget.dart';
import 'package:yellowbox/widgets/textfield_widget.dart';
import 'package:yellowbox/widgets/widgets.dart';

class ValidatorAIPage extends StatefulWidget {
  const ValidatorAIPage({Key? key}) : super(key: key);

  @override
  State<ValidatorAIPage> createState() => _ValidatorAIPageState();
}

class _ValidatorAIPageState extends State<ValidatorAIPage> {

  TextEditingController aiCode = TextEditingController();

  late double width;
  late double height;

  bool isVisible = false;
  bool isTrue = false;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.3),
        child: Column(
          children: [
            buildMainTitle(topic: 'AI Setting Validator'),
            Visibility(
              visible: isVisible,
              child: isTrue ? Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: buildTrueNoti(),
              ) :
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: buildFalseNoti(),
              ),
            ),
            BuildCard(
              children: [
                BuildSection(
                  topic: 'AI Setting',
                  child: Column(
                    children: [
                      BuildDropdown(
                        topic: 'หมวดหมู่',
                        value: catValVali,
                        list: aiSettingGen.aiCat,
                        onChanged: (value) => setState(() => catValVali = value!),
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
                      BuildButton(
                        text: 'ตรวจสอบ',
                        onPressed: () {},
                        width: width,
                      ),
                    ],
                  ),
                )
              ],
            ),
            buildRunButton(context),
          ],
        ),
      ),
    );
  }
}
