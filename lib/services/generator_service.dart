import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yellowbox/models/generator.dart';
import 'package:yellowbox/utils/constant.dart';
import 'package:http/http.dart' as http;

class GeneratorService {

  Future<void> initiate() async {
    aiSettingGen = new AISettingGen(
      aiTitle: '',
      aiCat: ['Shelf Share', 'Shelf Layout', 'POP', 'Cluster'],
      aiCatValue: '',
      ssOrg: [orgName],
      ssOrgValue: orgName,
      ssCat: ['COLD_BEVERAGE', 'HOT_BEVERAGE'],
      ssCatValue: '',
      ssSKU: [],
      ssSKUValue: '',
      ssOutput: '',
    );
  }

  Future<String> ping() async {
    try {
      var url = Uri.http(
        authority,
        '/yellow-box/ping',
      );
      print(url);

      final res = await http.get(url, headers: {
        'accept': '*/*',
      }).timeout(
        Duration(seconds: 20),
      );

      if (res.statusCode == 200) {
        print('Ping Successfully');
        return res.body;
      } else {
        return 'error';
      }
    } catch (ex) {
      return 'error';
    }
  }

  Future getSKU(String group) async {
    try {

    } catch (ex) {
      return 'error';
    }
  }

  List lists = [];

  static Future getSKUGroup(String group) async {
    var url = Uri.http(
      authority,
      '/yellow-box/secure/api/v1/aisetting/NESTLE/skus',
    );
    print(url);

    final response = await http.get(
      url,
      headers: {
        'accept': '*/*',
        'apikey': apiKey,
      },
    ).timeout(
      Duration(seconds: 20),
    );

    if (response.statusCode == 200) {
      print('Successfully, status code: ${response.statusCode.toString()}');
      print('Response Body: ' + response.body);
      final responseJson = json.decode(response.body);
      return responseJson.values.toList();

    } else {
      throw Exception('error');
    }
  }

}
