import 'package:flutter/material.dart';
import 'package:yellowbox/assets/text_style.dart';
import 'package:yellowbox/utils/constant.dart';
import 'package:yellowbox/widgets/appbar_widget.dart';
import 'package:yellowbox/widgets/button_widget.dart';
import 'package:yellowbox/widgets/card_widget.dart';
import 'package:yellowbox/widgets/dropdown_widget.dart';
import 'package:yellowbox/widgets/textfield_widget.dart';
import 'package:yellowbox/widgets/widgets.dart';

class ValidatorREPage extends StatefulWidget {
  const ValidatorREPage({Key? key}) : super(key: key);

  @override
  State<ValidatorREPage> createState() => _ValidatorREPageState();
}

class _ValidatorREPageState extends State<ValidatorREPage> {


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
            buildMainTitle(topic: 'Rule Engine Validator'),
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
                  topic: 'Rule Engine',
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: BuildPlainTextField(
                          controller: aiCode,
                          maxLine: 4,
                          onChange: (_) {},
                        ),
                      ),
                      BuildButton(
                        text: 'ตรวจสอบ', onPressed: () {}, width: width,),
                    ],
                  ),
                )
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


