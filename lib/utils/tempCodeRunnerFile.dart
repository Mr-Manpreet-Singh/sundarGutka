import 'package:sundar_gutka/data/path_hindi.dart';
import 'package:sundar_gutka/data/path_punjabi.dart';

void main(List<String> args) {
  final PunjabiPath pBani = PunjabiPath();
  final HindiPath hBani = HindiPath();

  print("Punjabi Hindi japjiSahib       = ${countNewLine(PunjabiPath.japjiSahib)} ${countNewLine(HindiPath.japjiSahib)}");
  print("Punjabi Hindi tavParsadSavaiye = ${countNewLine(PunjabiPath.tavParsadSavaiye)} ${countNewLine(HindiPath.tavParsadSavaiye)}");
  print("Punjabi Hindi chaupaiSahib     = ${countNewLine(PunjabiPath.chaupaiSahib)} ${countNewLine(HindiPath.chaupaiSahib)}");
  print("Punjabi Hindi anandSahib       = ${countNewLine(PunjabiPath.anandSahib)} ${countNewLine(HindiPath.anandSahib)}");
  print("Punjabi Hindi kirtanSohila     = ${countNewLine(PunjabiPath.kirtanSohila)} ${countNewLine(HindiPath.kirtanSohila)}");
  print("Punjabi Hindi ardas            = ${countNewLine(PunjabiPath.ardas)} ${countNewLine(HindiPath.ardas)}");
  print("Punjabi Hindi sukhmaniSahib    = ${countNewLine(PunjabiPath.sukhmaniSahib)} ${countNewLine(HindiPath.sukhmaniSahib)}");
  print("Punjabi Hindi rehrasSahib      = ${countNewLine(PunjabiPath.rehrasSahib)} ${countNewLine(HindiPath.rehrasSahib)}");
  print("Punjabi Hindi jaapSahib        = ${countNewLine(PunjabiPath.jaapSahib)} ${countNewLine(HindiPath.jaapSahib)}");

}
String countNewLine(String str) {
  int result = 0;
  int len = str.length;

  for (int i = 0; i<len; i++) {
    if (str[i] == '\n') result++;
  }
  return result.toString();
}
