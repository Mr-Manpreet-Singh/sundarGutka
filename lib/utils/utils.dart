import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sundar_gutka/data/model.dart';
import 'package:sundar_gutka/data/path_map.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class Util {
  const Util();

  static Future<void> openEmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'manpreetwork100@gmail.com',
      query: _encodeQueryParameters(<String, String>{
        'subject': 'Mail Regarding Gutka Sahib App',
        'body': 'I would like to tell you that the app...',
      }),
    );

    if (!await launchUrl(params)) {
      throw Exception('Could not launch email');
    }
  }

  static  void launchURL(String url) async {
    Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  static String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  static Future<bool> hasInternetConnection(context) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty;
      // ignore: unused_catch_clause
    } on SocketException catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("Failed: Check Internet and Try Again"),
            backgroundColor: Colors.red[400],
          ),
        );
      }
      return false;
    }
  }

  static String sampleText(Language lang) {
    switch (lang) {
      case Language.hindi:
        return "जपजी साहिब";
      case Language.english:
        return "Japji Sahib";
      default:
        return "ਜਪੁਜੀ ਸਾਹਿਬ";
    }
  }

  static Map<String, String> mapOfPathOfSelectedLanguage(Language lang) {
    switch (lang) {
      case Language.hindi:
        return fullPathHindi;
      case Language.english:
        return fullPathEnglish;
      default:
        return fullPathPunjabi;
    }
  }

  static List<String> splitByEmptyLinesAndMaxLength(String inputString) {
    final lines = inputString.split('\n');
    final result = <String>[];
    var currentChunk = '';

    for (var line in lines) {
      if (line.isEmpty) {
        if (currentChunk.isNotEmpty) {
          result.add('$currentChunk\n');
          currentChunk = '';
        }
      } else {
        currentChunk += '$line\n';
      }
    }

    if (currentChunk.isNotEmpty) {
      result.add(currentChunk);
    }

    return mergeChunks(result);
  }

  static List<String> mergeChunks(List<String> chunks) {
    const maxMergeLength = 300;
    final result = <String>[];
    var currentChunk = '';

    for (var chunk in chunks) {
      if (currentChunk.length + chunk.length <= maxMergeLength) {
        currentChunk += chunk;
      } else {
        result.add(currentChunk);
        currentChunk = chunk;
      }
    }

    if (currentChunk.isNotEmpty) {
      result.add(currentChunk);
    }

    return result;
  }
}
