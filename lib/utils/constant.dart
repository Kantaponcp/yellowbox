import 'package:flutter/material.dart';
import 'package:yellowbox/models/generator.dart';


var authority = '13.229.114.195:50001';
var apiKey = 'IKeK26vMpQ9DJFJBE4nVuRspL7xNhpIT6O1+jIFpD4U=';

AISettingGen aiSettingGen = new AISettingGen();

String catValGen = '';
String catValVali = '';
String catValTest = '';
final questions = ['Q1', 'Q2', 'Q3', 'Q4'];
String questionVal = '';

String orgName = '';

bool value1 = true;
bool value2 = true;
bool value3 = false;
bool value4 = false;

List values = [
  true,
  true,
  false,
  false,
];

List loadedData = [];

Map<String, dynamic> responseJson = {};