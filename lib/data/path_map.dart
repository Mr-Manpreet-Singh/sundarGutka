
import 'package:sundar_gutka/data/path_english.dart';
import 'package:sundar_gutka/data/path_hindi.dart';
import 'package:sundar_gutka/data/path_punjabi.dart';

// const String regSxpressionString =
//     "॥.{1,3}॥";
// ||at start and exd + any 1 or to or 3 charactes in between
// crt+ shift L  for multi selection


const List<String> pathList = [
  "Japji Sahib",
  "Jaap Sahib",
  "Tav-Parsad Savaiye",
  "Chaupai Sahib",
  "Anand Sahib",
  "Rehras Sahib",
  "Kirtan Sohila",
  "Ardas",
  "Sukhmani Sahib",
];

const Map<String, String> fullPathPunjabi = {
  "Japji Sahib": PunjabiPath.japjiSahib,
  "Tav-Parsad Savaiye": PunjabiPath.tavParsadSavaiye,
  "Chaupai Sahib": PunjabiPath.chaupaiSahib,
  "Anand Sahib": PunjabiPath.anandSahib,
  "Kirtan Sohila": PunjabiPath.kirtanSohila,
  "Ardas": PunjabiPath.ardas,
  "Sukhmani Sahib": PunjabiPath.sukhmaniSahib,
  "Rehras Sahib": PunjabiPath.rehrasSahib,
  "Jaap Sahib": PunjabiPath.jaapSahib,
};
const Map<String, String> fullPathHindi = {
  "Japji Sahib": HindiPath.japjiSahib,
  "Tav-Parsad Savaiye": HindiPath.tavParsadSavaiye,
  "Chaupai Sahib": HindiPath.chaupaiSahib,
  "Anand Sahib": HindiPath.anandSahib,
  "Kirtan Sohila": HindiPath.kirtanSohila,
  "Ardas": HindiPath.ardas,
  "Sukhmani Sahib": HindiPath.sukhmaniSahib,
  "Rehras Sahib": HindiPath.rehrasSahib,
  "Jaap Sahib": HindiPath.jaapSahib,
};
const Map<String, String> fullPathEnglish = {
  "Japji Sahib": EnglishPath.japjiSahib,
  "Tav-Parsad Savaiye": EnglishPath.tavParsadSavaiye,
  "Chaupai Sahib": EnglishPath.chaupaiSahib,
  "Anand Sahib": EnglishPath.anandSahib,
  "Kirtan Sohila": EnglishPath.kirtanSohila,
  "Ardas": EnglishPath.ardas,
  "Sukhmani Sahib": EnglishPath.sukhmaniSahib,
  "Rehras Sahib": EnglishPath.rehrasSahib,
  "Jaap Sahib": EnglishPath.jaapSahib,
};

// enum PathList {
//   japjiSahib,
//   tavParsadSavaiye,
//   chaupaiSahib,
//   anandSahib,
//   kirtanSohila,
//   jaapSahib,
//   rehrasSahib,
//   sukhmaniSahib,
//   ardas,
// }

// const Map<PathList, String> pathListMap = {
//   PathList.japjiSahib: "Japji Sahib",
//   PathList.tavParsadSavaiye: "Tav-Parsad Savaiye",
//   PathList.chaupaiSahib: "Chaupai Sahib",
//   PathList.anandSahib: "Anand Sahib",
//   PathList.kirtanSohila: "Kirtan Sohila",
//   PathList.ardas: "Ardas",
//   PathList.sukhmaniSahib: "Sukhmani Sahib",
//   PathList.rehrasSahib: "Rehras Sahib",
//   PathList.jaapSahib: "Jaap Sahib",
// };
// const Map<PathList, String> fullPathPunjabi = {
//   PathList.japjiSahib: PunjabiPath.japjiSahib,
//   PathList.tavParsadSavaiye: PunjabiPath.tavParsadSavaiye,
//   PathList.chaupaiSahib: PunjabiPath.chaupaiSahib,
//   PathList.anandSahib: PunjabiPath.anandSahib,
//   PathList.kirtanSohila: PunjabiPath.kirtanSohila,
//   PathList.ardas: PunjabiPath.ardas,
//   PathList.sukhmaniSahib: PunjabiPath.sukhmaniSahib,
//   PathList.rehrasSahib: PunjabiPath.rehrasSahib,
//   PathList.jaapSahib: PunjabiPath.jaapSahib,
// };
// const Map<PathList, String> fullPathHindi = {
//   PathList.japjiSahib: HindiPath.japjiSahib,
//   PathList.tavParsadSavaiye: HindiPath.tavParsadSavaiye,
//   PathList.chaupaiSahib: HindiPath.chaupaiSahib,
//   PathList.anandSahib: HindiPath.anandSahib,
//   PathList.kirtanSohila: HindiPath.kirtanSohila,
//   PathList.ardas: HindiPath.ardas,
//   PathList.sukhmaniSahib: HindiPath.sukhmaniSahib,
//   PathList.rehrasSahib: HindiPath.rehrasSahib,
//   PathList.jaapSahib: HindiPath.jaapSahib,
// };
// const Map<PathList, String> fullPathEnglish = {
//   PathList.japjiSahib: EnglishPath.japjiSahib,
//   PathList.tavParsadSavaiye: EnglishPath.tavParsadSavaiye,
//   PathList.chaupaiSahib: EnglishPath.chaupaiSahib,
//   PathList.anandSahib: EnglishPath.anandSahib,
//   PathList.kirtanSohila: EnglishPath.kirtanSohila,
//   PathList.ardas: EnglishPath.ardas,
//   PathList.sukhmaniSahib: EnglishPath.sukhmaniSahib,
//   PathList.rehrasSahib: EnglishPath.rehrasSahib,
//   PathList.jaapSahib: EnglishPath.jaapSahib,
// };



// const Map<String, Map<Language, String>> fullPath = {
//   "Japji Sahib": {
//     Language.punjabi: PunjabiPath.japjiSahib,
//     Language.hindi: HindiPath.japjiSahib,
//     Language.english: EnglishPath.japjiSahib,
//   },
//   "Tav-Parsad Savaiye": {
//     Language.punjabi: PunjabiPath.tavParsadSavaiye,
//     Language.hindi: HindiPath.tavParsadSavaiye,
//     Language.english: EnglishPath.tavParsadSavaiye,
//   },
//   "Chaupai Sahib": {
//     Language.punjabi: PunjabiPath.chaupaiSahib,
//     Language.hindi: HindiPath.chaupaiSahib,
//     Language.english: EnglishPath.chaupaiSahib,
//   },
//   "Anand Sahib": {
//     Language.punjabi: PunjabiPath.anandSahib,
//     Language.hindi: HindiPath.anandSahib,
//     Language.english: EnglishPath.anandSahib,
//   },
//   "Kirtan Sohila": {
//     Language.punjabi: PunjabiPath.kirtanSohila,
//     Language.hindi: HindiPath.kirtanSohila,
//     Language.english: EnglishPath.kirtanSohila,
//   },
//   "Ardas": {
//     Language.punjabi: PunjabiPath.ardas,
//     Language.hindi: HindiPath.ardas,
//     Language.english: EnglishPath.ardas,
//   },
//   "Sukhmani Sahib": {
//     Language.punjabi: PunjabiPath.sukhmaniSahib,
//     Language.hindi: HindiPath.sukhmaniSahib,
//     Language.english: EnglishPath.sukhmaniSahib,
//   },
//   "Rehras Sahib": {
//     Language.punjabi: PunjabiPath.rehrasSahib,
//     Language.hindi: HindiPath.rehrasSahib,
//     Language.english: EnglishPath.rehrasSahib,
//   },
//   "Jaap Sahib": {
//     Language.punjabi: PunjabiPath.jaapSahib,
//     Language.hindi: HindiPath.jaapSahib,
//     Language.english: EnglishPath.jaapSahib,
//   },
// };