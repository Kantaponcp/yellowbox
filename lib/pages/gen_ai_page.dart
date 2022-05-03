import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:yellowbox/assets/color.dart';
import 'package:yellowbox/assets/text_style.dart';
import 'package:yellowbox/models/generator.dart';
import 'package:yellowbox/models/generator.dart';
import 'package:yellowbox/services/generator_service.dart';
import 'package:yellowbox/utils/constant.dart';
import 'package:yellowbox/widgets/appbar_widget.dart';
import 'package:yellowbox/widgets/button_widget.dart';
import 'package:yellowbox/widgets/card_widget.dart';
import 'package:yellowbox/widgets/dropdown_widget.dart';
import 'package:yellowbox/widgets/generator_widget.dart';
import 'package:yellowbox/widgets/textfield_widget.dart';
import 'package:yellowbox/widgets/widgets.dart';

import '../widgets/button_widget.dart';
import 'gen_re_page.dart';

class GeneratorAIPage extends StatefulWidget {
  const GeneratorAIPage({Key? key}) : super(key: key);

  @override
  State<GeneratorAIPage> createState() => _GeneratorAIPageState();
}

class _GeneratorAIPageState extends State<GeneratorAIPage> {
  late double width;
  late double height;

  double bottomPadding = 0;
  double topPadding = 20;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    bool _checkbox = false;

    List<Mode> modes = [
      Mode(
        modeName: 'ตรวจสอบจำนวนป้ายโฆษณาส่งเสริมการขาย',
        modeDetail: 'POP',
      ),
      Mode(modeName: 'ตรวจสอบป้ายโฆษณาบริเวณสินค้า', modeDetail: 'SKU on POP'),
      Mode(modeName: 'ตรวจสอบบรรจุภัณฑ์', modeDetail: 'Container'),
      Mode(
          modeName: 'ตรวจสอบป้ายโฆษณาบริเวณบรรจุภัณฑ์',
          modeDetail: 'SKU on Container'),
    ];

    final TextEditingController pCat = TextEditingController();

    final catChecker = aiSettingGen.aiCatValue;

    return Scaffold(
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.3),
        child: Column(
          children: [
            buildMainTitle(topic: 'AI Setting Generator'),
            BuildCard(
              children: [
                BuildSection(
                  topic: 'เลือกหมวดหมู่',
                  child: Column(
                    children: [
                      BuildDropdown(
                        topic: 'หมวดหมู่',
                        value: aiSettingGen.aiCatValue,
                        list: aiSettingGen.aiCat,
                        onChanged: (value) =>
                            setState(() => aiSettingGen.aiCatValue = value!),
                      ),
                      BuildButton(
                          text: 'เลือก', onPressed: () {}, width: width),
                    ],
                  ),
                ),
              ],
            ),
            if (catChecker == 'Shelf Share' || catChecker.isEmpty) ...[
              BuildCard(
                children: [
                  BuildSection(
                    topic: 'องค์กรภายใน',
                    child: Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: BuildPlainDropdown(
                        value: aiSettingGen.ssOrgValue,
                        list: aiSettingGen.ssOrg,
                        hint: 'กรุณาเลือกองค์กรภายใน',
                        onChanged: (_) => {},
                      ),
                    ),
                  ),
                  BuildSection(
                    topic: 'ผลิตภัณฑ์',
                    child: Column(
                      children: [
                        BuildTextField(
                          topic: 'หมวดหมู่',
                          controller: pCat,
                          onChange: (_) => {},
                        ),
                        buildSKU(
                          'ชื่อผลิตภัณฑ์',
                        ),
                        showSKU(
                          topic: 'ผลิตภัณฑ์ทั้งหมด',
                          isSS: true,
                        ),
                        BuildButton(
                            text: 'เลือก', onPressed: () {}, width: width),
                      ],
                    ),
                  ),
                ],
              ),
            ] else if (catChecker == 'POP') ...[
              BuildCard(
                children: [
                  BuildSection(
                    topic: 'โหมด',
                    child: Column(
                      children: [
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: CollectionsColors.orange,
                          dense: true,
                          title: Text(
                            'เลือกทั้งหมด',
                            style: FontCollection.body,
                          ),
                          value: _checkbox,
                          selected: _checkbox,
                          onChanged: (bool? _value) {
                            setState(() {
                              _checkbox = _value!;

                              print(_value.toString());
                              print('clicked');
                              print(_checkbox.toString());
                            });
                          },
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return modeList(
                                text: modes[index].modeName.toString(),
                                detailText: modes[index].modeDetail.toString(),
                                value: values[index],
                              );
                            },
                            itemCount: modes.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Divider(
                      thickness: 1,
                      color: CollectionsColors.navy,
                    ),
                  ),
                  BuildSection(
                    topic: 'องค์กรภายใน',
                    child: Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: BuildPlainDropdown(
                        value: orgName,
                        list: aiSettingGen.ssOrg,
                        hint: 'กรุณาเลือกองค์กรภายใน',
                        onChanged: (_) => {},
                      ),
                    ),
                  ),
                  BuildSection(
                    topic: 'ผลิตภัณฑ์',
                    child: Column(
                      children: [
                        BuildTextField(
                          topic: 'หมวดหมู่',
                          controller: pCat,
                          onChange: (_) => {},
                        ),
                        buildSKU(
                          'ชื่อผลิตภัณฑ์',
                        ),
                        showSKU(
                          topic: 'ผลิตภัณฑ์ทั้งหมด',
                          isSS: false,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Divider(
                      thickness: 1,
                      color: CollectionsColors.navy,
                    ),
                  ),
                  BuildSection(
                    topic: 'บรรจุภัณฑ์',
                    child: Column(
                      children: [
                        BuildTextField(
                          topic: 'หมวดหมู่',
                          controller: pCat,
                          onChange: (_) => {},
                        ),
                        buildSKU(
                          'ชื่อบรรจุภัณฑ์',
                        ),
                        showSKU(
                          topic: 'บรรจุภัณฑ์ทั้งหมด',
                          isSS: false,
                        ),
                        BuildButton(
                            text: 'เลือก', onPressed: () {}, width: width),
                      ],
                    ),
                  ),
                ],
              ),
            ] else if (catChecker == 'Shelf Layout') ...[
              BuildCard(
                children: [
                  BuildSection(
                    topic: 'องค์กรภายใน',
                    child: Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: BuildPlainDropdown(
                        value: orgName,
                        list: aiSettingGen.ssOrg,
                        hint: 'กรุณาเลือกองค์กรภายใน',
                        onChanged: (_) => {},
                      ),
                    ),
                  ),
                  BuildSection(
                    topic: 'ผลิตภัณฑ์',
                    child: Column(
                      children: [
                        BuildTextField(
                          topic: 'หมวดหมู่',
                          controller: pCat,
                          onChange: (_) => {},
                        ),
                        buildSKU(
                          'ชื่อผลิตภัณฑ์',
                        ),
                        showSKU(topic: 'ผลิตภัณฑ์ทั้งหมด', isSS: false),
                        BuildButton(
                            text: 'เลือก', onPressed: () {}, width: width),
                      ],
                    ),
                  ),
                ],
              ),
            ] else ...[
              BuildCard(
                children: [
                  BuildSection(
                    topic: 'องค์กรภายใน',
                    child: Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: BuildPlainDropdown(
                        value: orgName,
                        list: aiSettingGen.ssOrg,
                        hint: 'กรุณาเลือกองค์กรภายใน',
                        onChanged: (_) => {},
                      ),
                    ),
                  ),
                  BuildSection(
                    topic: 'ผลิตภัณฑ์',
                    child: Column(
                      children: [
                        BuildTextField(
                          topic: 'หมวดหมู่',
                          controller: pCat,
                          onChange: (_) => {},
                        ),
                        buildSKU(
                          'ชื่อผลิตภัณฑ์',
                        ),
                        showSKU(
                          topic: 'ผลิตภัณฑ์ทั้งหมด',
                          isSS: false,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Divider(
                      thickness: 1,
                      color: CollectionsColors.navy,
                    ),
                  ),
                  BuildSection(
                    topic: 'บรรจุภัณฑ์',
                    child: Column(
                      children: [
                        BuildTextField(
                          topic: 'หมวดหมู่',
                          controller: pCat,
                          onChange: (_) => {},
                        ),
                        buildSKU(
                          'ชื่อบรรจุภัณฑ์',
                        ),
                        showSKU(
                          topic: 'บรรจุภัณฑ์ทั้งหมด',
                          isSS: false,
                        ),
                        BuildButton(
                            text: 'เลือก', onPressed: () {}, width: width),
                      ],
                    ),
                  ),
                ],
              ),
            ],
            BuildCard(
              children: [
                BuildSection(
                  noPadding: true,
                  topic: 'Shelf Share',
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: ExpansionTile(
                        backgroundColor: CollectionsColors.background,
                        iconColor: CollectionsColors.navy,
                        maintainState: false,
                        title: Text(
                          'COLD_BEVERAGE',
                          style: FontCollection.boldBody,
                        ),
                        childrenPadding: EdgeInsets.symmetric(horizontal: 40),
                        children: [
                          buildPOPMode(),
                          showSKU(topic: 'ผลิตภัณฑ์ทั้งหมด', isSS: false),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            BuildCard(
              children: [
                BuildSection(
                  topic: 'ผลลัพธ์',
                  icon: Icons.content_copy,
                  onPressed: () {},
                  child: Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(top: topPadding),
                    child: Text(
                      responseJson.values.toString(),
                      style: FontCollection.output,
                    ),
                  ),
                ),
              ],
            ),
            Container(
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
            ),
          ],
        ),
      ),
    );
  }

  TextEditingController sku = TextEditingController();

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: FontCollection.body,
        ),
      );

  Widget buildSKU(String topic) {
    return Container(
      padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              topic,
              style: FontCollection.body,
            ),
          ),
          Container(
            width: width,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.only(right: 20),
                    // child:
                    // TypeAheadField(
                    //   hideSuggestionsOnKeyboardHide: false,
                    //   textFieldConfiguration: TextFieldConfiguration(
                    //     decoration: InputDecoration(
                    //       border: OutlineInputBorder(),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderRadius: BorderRadius.all(Radius.circular(10)),
                    //         borderSide:
                    //             BorderSide(color: CollectionsColors.orange),
                    //       ),
                    //       enabledBorder: OutlineInputBorder(
                    //           borderRadius:
                    //               BorderRadius.all(Radius.circular(10)),
                    //           borderSide: BorderSide(color: Colors.grey)),
                    //       hintText: 'กรุณาพิมพ์ชื่อผลิตภัณฑ์',
                    //     ),
                    //   ),
                    //   suggestionsCallback: (suggestion) {
                    //     _controller.text = suggestion['name'];
                    //   },
                    //   //     (suggession) {
                    //   //   return GeneratorService.getSKUGroup('NESTLE');
                    //   // },
                    //   itemBuilder: (context, String text) {
                    //     return ListTile(
                    //       title: Text(responseJson.values.toString()),
                    //     );
                    //   },
                    //   noItemsFoundBuilder: (context) => Container(
                    //     height: 100,
                    //     child: Center(
                    //       child: Text(
                    //         'No Users Found.',
                    //         style: TextStyle(fontSize: 24),
                    //       ),
                    //     ),
                    //   ),
                    //   onSuggestionSelected: (SKULists? suggestion) {
                    //     final sku = suggestion!;
                    //
                    //     ScaffoldMessenger.of(context)
                    //       ..removeCurrentSnackBar()
                    //       ..showSnackBar(SnackBar(
                    //         content: Text('Selected user: ${sku.skuTran}'),
                    //       ));
                    //   },
                    // ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: BuildSmallButton(
                    text: 'เพิ่ม',
                    onPressed: () {},
                    width: width,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget modeList({
    required String text,
    required String detailText,
    required bool value,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: CheckboxListTile(
        // shape: RoundedRectangleBorder(
        //     borderRadius: ),
        activeColor: CollectionsColors.orange,
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          text,
          style: FontCollection.body,
        ),
        subtitle: Text(
          detailText,
          style: FontCollection.disDetail,
        ),
        selected: value,
        value: value,
        onChanged: (_value) {
          setState(() {
            value = _value!;
          });
        },
      ),
    );
  }
}

Widget buildPOPMode() {
  return Container(
    child: Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(bottom: 10),
          child: subTitleText(text: 'โหมด'),
        ),
        Divider(
          thickness: 1,
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(bottom: 10),
          child: bodyText(text: 'ตรวจสอบจำนวนป้ายโฆษณาส่งเสริมการขาย'),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(bottom: 10),
          child: bodyText(text: 'ตรวจสอบป้ายโฆษณาบริเวณสินค้า'),
        ),
      ],
    ),
  );
}

class Mode {
  Mode({required this.modeName, required this.modeDetail});

  final String modeName;
  final String modeDetail;
}
