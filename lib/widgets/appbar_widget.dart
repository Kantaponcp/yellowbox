import 'package:flutter/material.dart';
import 'package:yellowbox/assets/color.dart';
import 'package:yellowbox/assets/text_style.dart';
import 'package:yellowbox/pages/gen_ai_page.dart';
import 'package:yellowbox/pages/gen_re_page.dart';
import 'package:yellowbox/pages/home_page.dart';
import 'package:yellowbox/pages/login_page.dart';
import 'package:yellowbox/pages/question_vali_page.dart';
import 'package:yellowbox/pages/test_ai_page.dart';
import 'package:yellowbox/pages/test_overall_page.dart';
import 'package:yellowbox/pages/test_re_page.dart';
import 'package:yellowbox/pages/vali_ai_page.dart';
import 'package:yellowbox/pages/vali_re_page.dart';
import 'package:yellowbox/utils/constant.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget({Key? key})
      : preferredSize = Size.fromHeight(80),
        super(key: key);

  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      flexibleSpace: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.only(left: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: CollectionsColors.grey.withOpacity(0.3),
                  blurRadius: 10,
                  offset: Offset(0, 0),
                ),
              ],
              color: Colors.white,
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => HomePage(org: 'PLUS'),
                  ),
                );
              },
              child: Icon(
                Icons.home,
                color: CollectionsColors.orange,
              ),
            ),
          ),
          Container(
            height: height,
            child: Row(
              children: [
                buildPopupMenu(
                  menuText: 'Generator',
                  children: [
                    popupMenuItem(text: "AI Setting", value: 1),
                    popupMenuItem(
                      text: "Rule Engine",
                      value: 2,
                    ),
                    popupMenuItem(
                        text: "Question Setting", value: 3, enabled: false),
                  ],
                  onSelected: (value) {
                    if (value == 1) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => GeneratorAIPage(),
                        ),
                      );
                    } else if (value == 2) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => GeneratorREPage(),
                        ),
                      );
                    } else {}
                  },
                ),
                buildPopupMenu(
                  menuText: 'Validator',
                  children: [
                    popupMenuItem(text: "AI Setting", value: 1),
                    popupMenuItem(
                      text: "Rule Engine",
                      value: 2,
                    ),
                    popupMenuItem(
                        text: "Question Setting", value: 3, enabled: false),
                  ],
                  onSelected: (value) {
                    if (value == 1) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => ValidatorAIPage(),
                        ),
                      );
                    } else if (value == 2) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => ValidatorREPage(),
                        ),
                      );
                    } else {}
                  },
                ),
                buildPopupMenu(
                  menuText: 'Test',
                  children: [
                    popupMenuItem(text: "AI Setting", value: 1),
                    popupMenuItem(text: "Rule Engine", value: 2),
                    popupMenuItem(text: "Overall", value: 3),
                  ],
                  onSelected: (value) {
                    if (value == 1) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => TestAIPage(),
                        ),
                      );
                    } else if (value == 2) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => TestREPage(),
                        ),
                      );
                    } else {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => TestOverallPage(),
                        ),
                      );
                    }
                  },
                ),
                buildPopupMenu(
                  menuText: 'Template',
                  children: [
                    popupMenuItem(text: "Validator", value: 1),
                    popupMenuItem(text: "Diff", value: 2, enabled: false),
                  ],
                  onSelected: (value) {
                    if (value == 1) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => TemplateValidatorPage(),
                        ),
                      );
                    } else {}
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            margin: EdgeInsets.only(right: 40),
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: CollectionsColors.grey.withOpacity(0.3),
                  blurRadius: 10,
                  offset: Offset(0, 0),
                ),
              ],
              color: Colors.white,
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(
                      orgName,
                      style: TextStyle(
                        fontFamily: Poppins,
                        fontWeight: FontWeight.w600,
                        fontSize: regularSize,
                        color: CollectionsColors.orange,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.logout,
                    color: CollectionsColors.orange,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPopupMenu({
    required String menuText,
    required List<PopupMenuEntry> children,
    required void Function(dynamic) onSelected,
    bool? enabled,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: PopupMenuButton(
        enabled: enabled == null ? true : enabled,
        onSelected: onSelected,
        offset: Offset(0.0, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            menuText,
            style: enabled == null
                ? FontCollection.navbar
                : FontCollection.disNavbar,
          ),
        ),
        itemBuilder: (context) => children,
      ),
    );
  }

  PopupMenuItem popupMenuItem(
      {required String text, required int value, bool? enabled}) {
    return PopupMenuItem(
      enabled: enabled == null ? true : enabled,
      value: value,
      child: Text(
        text,
        style:
            enabled == null ? FontCollection.navbar : FontCollection.disNavbar,
      ),
    );
  }
}
