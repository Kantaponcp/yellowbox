import 'dart:html';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:yellowbox/assets/color.dart';
import 'package:yellowbox/assets/text_style.dart';
import 'package:yellowbox/pages/home_page.dart';
import 'package:yellowbox/services/generator_service.dart';
import 'package:yellowbox/utils/constant.dart';

import '../widgets/textfield_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Container(
          width: width * 0.6,
          height: height * 0.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: CollectionsColors.grey.withOpacity(0.5), blurRadius: 10),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 70, vertical: 70),
          child: Column(
            children: [
              Center(
                child: AutoSizeText(
                  'องค์กร',
                  style: FontCollection.mainTitle,
                ),
              ),
              Spacer(
                flex: 1,
              ),
              input(),
              Spacer(
                flex: 1,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(390, 50),
                  primary: CollectionsColors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  if(orgName.isNotEmpty) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => HomePage(org: orgName),
                      ),
                    );
                  }
                  GeneratorService().initiate();
                  GeneratorService().ping();
                  GeneratorService.getSKUGroup(orgName);
                  // GeneratorService.getSKUGroup('NESTLE');
                },
                child: Text(
                  'เลือก',
                  style: FontCollection.buttonText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextEditingController org = TextEditingController();

  Widget input() {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              'รหัสองค์กร',
              style: FontCollection.body,
            ),
          ),
          BuildPlainTextField(
            controller: org,
            onChange: (text) {
              setState(() {
                orgName = text.toUpperCase();
              });
            },
            textCapitalization: TextCapitalization.characters,
            validator: (text) {
              if(text!.isEmpty) {
                return 'กรุฯากรอกรหัสองค์กร';
              }
            },
          )
        ],
      ),
    );
  }


}
