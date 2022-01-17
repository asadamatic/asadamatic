import 'package:flutter/material.dart';

const port = '8000';
const localHost = '127.0.0.1';
const remoteHostUrl = 'https://g77mwi.deta.dev/';
const localHostAndroid = '10.0.2.2';
const localHostUrl = 'http://$localHost:$port/';
const localHostUrlAndroid = 'http://$localHostAndroid:$port/';
const localHostWebSocketUrl = 'ws://$localHost:$port/';
const remoteHosWebSocketUrl = 'ws://g77mwi.deta.dev/';
const localHostWebSocketUrlAndroid = 'ws://$localHostAndroid:$port/';

String appTitle = 'Asad Hameed - Flutter Developer';

RegExp emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

List<String> descriptions = [
  "Bolt Grocery lets you create grocery lists, so you never forget an item! ",
  'Productivity Simplified with daily todo app!',
  'Keep up to date with weather conditions with Weather by Legacy'
];
List<String> os = ['Android', 'Ios'];
List<List<String>> socialIcons = [
  ['assets/github.png', 'https://github.com/asadamatic'],
  [
    'assets/stack-overflow.png',
    'https://stackoverflow.com/users/10285344/asad-hameed'
  ],
  ['assets/linkedin.png', 'https://www.linkedin.com/in/asadamatic']
];
List<String> appLogoIcons = [
  'assets/boltgrocery/icon.png',
  'assets/dailytodo/icon.png',
  'assets/legacyweather/icon.png'
];

List<String> packages = ['firestore_search', 'file_case', 'dialogs'];

Color shimmerBaseColor = Colors.grey[200]!;
Color shimmerHighlightColor = Colors.grey[400]!;

// Color packageNameColor = const Color(0xFF1967d2);

List<String> tools = [
  'Flutter',
  'FastAPI',
  'Python',
  'Java',
  'JavaFx',
  'SQLite',
  'MySQL',
  'Firebase',
  'Android',
  'C++',
  'Selenium',
];





