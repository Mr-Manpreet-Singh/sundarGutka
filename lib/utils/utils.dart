import 'package:flutter/material.dart';
import 'package:sundar_gutka/data/model.dart';
import 'package:sundar_gutka/data/path_map.dart';

const String appTitle = "Sikh Gutka Sahib";

// Colors
// const Color myBackgroundColor = Color(0xFFffc14d);
const Color myBackgroundColor = Color.fromARGB(255, 219, 187, 126);
// const Color myBackgroundColorDark = Color.fromARGB(255, 255, 128, 0);
const Color myBackgroundColorDark = Colors.black87;
const Color myActionColor = Colors.black87;
const Color myActionColorLight = Colors.black12;
const Color myScrollbarThumbColor = myBackgroundColor;

//Text Styles
const TextStyle myF18TextStyle = TextStyle(fontSize: 18);
const TextStyle myF16TextStyle = TextStyle(fontSize: 16);
const TextStyle myF22TextStyle = TextStyle(fontSize: 22);
const TextStyle myF14TextStyle = TextStyle(fontSize: 14);
const TextStyle gotextTextStyle =
    TextStyle(fontSize: 19, color: myActionColor, fontWeight: FontWeight.w500);

// Utility Functions
String sampleText(Language lang) {
  switch (lang) {
    case Language.hindi:
      return "जपजी साहिब";
    case Language.english:
      return "Japji Sahib";
    default:
      return "ਜਪੁਜੀ ਸਾਹਿਬ";
  }
}

Map<String, String> mapOfPathOfSelectedLanguage(Language lang) {
  switch (lang) {
    case Language.hindi:
      return fullPathHindi;
    case Language.english:
      return fullPathEnglish;
    default:
      return fullPathPunjabi;
  }
}
// Map<PathList, String> mapOfPathOfSelectedLanguage(Language lang) {
//   switch (lang) {
//     case Language.hindi:
//       return fullPathHindi;
//     case Language.english:
//       return fullPathEnglish;
//     default:
//       return fullPathPunjabi;
//   }
// }

List<String> splitByEmptyLinesAndMaxLength(String inputString, int length) {
  final lines = inputString.split('\n');
  final result = <String>[];
  var currentChunk = '';

  for (var line in lines) {
    if (line.isEmpty) {
      if (currentChunk.isNotEmpty) {
        result.add(currentChunk);
        currentChunk = '';
      }
    } else {
      currentChunk += '$line\n';
    }
  }

  if (currentChunk.isNotEmpty) {
    result.add(currentChunk);
  }

  return mergeChunks(result, length);
}

List<String> mergeChunks(List<String> chunks, int length) {
  final result = <String>[];
  var currentChunk = '';

  for (var chunk in chunks) {
    if (currentChunk.length + chunk.length <= 350) {
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


// List<String> splitStringToLimitedParts(String input) {
//   const int splitLength = 350;
//   final parts = input.split('\t\t');
//   final result = <String>[];
//   var currentPart = '';
//   var currentPartLength = 0; // Track the current part length including '\n'

//   for (final part in parts) {
//     final partLength = part
//         .replaceAll('\n', '@')
//         .length; // Replace '\n' with a single character for accurate length calculation
//     if (currentPartLength + partLength < splitLength) {
//       currentPart += (currentPart.isEmpty ? '' : '\t\t\t') + part;
//       currentPartLength += partLength +
//           (part.contains('\n') ? 25 : 0); // Add 15 only if part contains '\n'
//     } else {
//       result.add(currentPart);
//       currentPart = part;
//       currentPartLength = partLength;
//     }
//   }

//   // Add the last remaining part (if any)
//   if (currentPart.isNotEmpty) {
//     result.add(currentPart);
//   }

//   return result;
// }

// String convertListToStringWithNewlines(List<String> path) {
//   if (path.isEmpty) {
//     return '';
//   }
//   final buffer = StringBuffer();
//   for (var i = 0; i < path.length; i++) {
//     buffer.write(path[i]);
//     if (i < path.length - 1) {
//       buffer.write('\n\n\n');
//     }
//   }
//   return buffer.toString();
// }
