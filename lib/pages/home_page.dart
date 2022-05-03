import 'package:flutter/material.dart';
import 'package:yellowbox/assets/color.dart';
import 'package:yellowbox/assets/text_style.dart';
import 'package:yellowbox/pages/gen_ai_page.dart';
import 'package:yellowbox/pages/question_vali_page.dart';
import 'package:yellowbox/pages/test_ai_page.dart';
import 'package:yellowbox/pages/test_overall_page.dart';
import 'package:yellowbox/pages/test_re_page.dart';
import 'package:yellowbox/pages/vali_ai_page.dart';
import 'package:yellowbox/pages/vali_re_page.dart';
import 'package:yellowbox/widgets/appbar_widget.dart';
import 'gen_re_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.org}) : super(key: key);
  final String org;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: CollectionsColors.background,
      appBar: AppBarWidget(),
      body: Container(
        width: width,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            menuBlock(
              'Generator',
              [
                menu(
                  text: 'AI Setting',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => GeneratorAIPage(),
                      ),
                    );
                  },
                ),
                menu(
                  text: 'Rule Engine',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => GeneratorREPage(),
                      ),
                    );
                  },
                ),
                // menu(
                //   text: 'Question Setting',
                //   onPressed: () {},
                // ),
              ],
            ),
            menuBlock(
              'Validator',
              [
                menu(
                  text: 'AI Setting',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ValidatorAIPage(),
                      ),
                    );
                  },
                ),
                menu(
                  text: 'Rule Engine',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ValidatorREPage(),
                      ),
                    );
                  },
                ),
                // menu(
                //   text: 'Question Setting',
                //   onPressed: () {},
                // ),
              ],
            ),
            menuBlock(
              'Test',
              [
                menu(
                  text: 'AI Setting',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TestAIPage(),
                      ),
                    );
                  },
                ),
                menu(
                  text: 'Rule Engine',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TestREPage(),
                      ),
                    );
                  },
                ),
                menu(
                  text: 'Overall',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TestOverallPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
            menuBlock(
              'Template',
              [
                menu(
                  text: 'Template Validator',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TemplateValidatorPage(),
                      ),
                    );
                  },
                ),
                // menu(
                //   text: 'Template diff',
                //   onPressed: () {},
                // ),
              ],
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget menuBlock(String text, List<Widget> children) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.fromLTRB(10, 30, 10, 30),
      height: height,
      width: (width / 4) - 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: Offset(0,2),
            color: CollectionsColors.black.withOpacity(0.1),
            blurRadius: 30,
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        children: [
          IntrinsicHeight(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: Row(
                children: [
                  Container(
                    width: 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: CollectionsColors.orange,
                        boxShadow: [
                          BoxShadow(
                            color: CollectionsColors.black.withOpacity(0.1),
                            blurRadius: 10,
                          ),
                        ]),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      text,
                      style: FontCollection.mainTitle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: children,
            ),
          ),
        ],
      ),
    );
  }

  Widget menu({required String text, required VoidCallback onPressed}) {
    double width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.fromLTRB(30, 0, 20, 30),
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: width,
        height: 80,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(color: CollectionsColors.grey, blurRadius: 10),
          ],
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: FontCollection.body,
            ),
            Icon(
              Icons.keyboard_arrow_right,
              color: CollectionsColors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
