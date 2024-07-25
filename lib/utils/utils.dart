import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sundar_gutka/data/model.dart';
import 'package:sundar_gutka/data/path_map.dart';

abstract class Util {
  const Util();

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
