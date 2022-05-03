import 'dart:convert';

import 'package:yellowbox/pages/gen_ai_page.dart';

class AISettingGen {
  String aiTitle;
  List<String> aiCat = [];
  String aiCatValue = '';

  //SS
  List<String> ssOrg = [];
  String ssOrgValue = '';
  List<String> ssCat = [];
  String ssCatValue = '';
  List ssSKU = [];
  List<String> ssSKULists = [];
  String ssSKUValue = '';
  String ssOutput = '';

  // //SL
  // List slOrg = [];
  // String slOrgValue = '';
  // List slCat = [];
  // String slCatValue = '';
  // List slSKU = [];
  // String slSKUValue = '';
  // String slOutput = '';
  // //POP
  // List<Mode> mode = [];
  // List modeValue = [];

  AISettingGen({
    this.aiTitle = '',
    this.aiCat = const [],
    this.aiCatValue = '',
    this.ssOrg = const [],
    this.ssOrgValue = '',
    this.ssCat = const [],
    this.ssCatValue = '',
    this.ssSKU = const [],
    this.ssSKULists = const [],
    this.ssSKUValue = '',
    this.ssOutput = '',
    // this.slOrg = const [],
    // this.slOrgValue = '',
    // this.slCat = const [],
    // this.slCatValue = '',
    // this.slSKU = const [],
    // this.slSKUValue = '',
    // this.slOutput = '',
    // this.mode = const [],
    // this.modeValue = const [],
  });

  factory AISettingGen.fromJson(Map<String, Object?> json) {
    return AISettingGen(
      aiTitle: json['aiTitle'] as String,
      aiCat: json['aiCat'] as List<String>,
      aiCatValue: json['aiCatValue'] as String,
      ssOrg: json['ssOrg'] as List<String>,
      ssOrgValue: json['ssOrgValue'] as String,
      ssCat: json['ssCat'] as List<String>,
      ssCatValue: json['ssCatValue'] as String,
      ssSKU: json['ssSKU'] as List,
      ssSKULists: json['ssSKULists'] as List<String>,
      ssSKUValue: json['ssSKUValue'] as String,
      ssOutput: json['ssOutput'] as String,
    );
  }

  Map<String, Object?> toJson() => {
        'aiTitle': aiTitle,
        'aiCat': aiCat,
        'aiCatValue': ssCatValue,
        'ssOrg': ssOrg,
        'ssOrgValue': ssOrgValue,
        'ssCat': ssCat,
        'ssCatValue': ssCatValue,
        'ssSKU': ssSKU,
        'ssSKULists': ssSKULists,
        'ssSKUValue': ssSKUValue,
        'ssOutput': ssOutput,
      };
}

class SKULists {
  final String skuTran;
  final String skuName;

  const SKULists({
    required this.skuTran,
    required this.skuName,
  });

  // factory SKULists.fromJson(Map<String, dynamic> json) => SKULists(
  //       skuTran: json["skuTran"],
  //       skuName: json["skuName"],
  //     );

}
