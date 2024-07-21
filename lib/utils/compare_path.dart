import 'package:sundar_gutka/data/path_hindi.dart';
import 'package:sundar_gutka/data/path_punjabi.dart';

void main(List<String> args) {
  final PunjabiPath pBani = PunjabiPath();
  final HindiPath hBani = HindiPath();

  print("Punjabi japjiSahib       = ${countNewLine(PunjabiPath.japjiSahib)}  ${countNewLine(HindiPath.japjiSahib)}");
  print("Punjabi tavParsadSavaiye = ${countNewLine(PunjabiPath.tavParsadSavaiye)}  ${countNewLine(HindiPath.tavParsadSavaiye)}");
  print("Punjabi chaupaiSahib     = ${countNewLine(PunjabiPath.chaupaiSahib)}  ${countNewLine(HindiPath.chaupaiSahib)}");
  print("Punjabi anandSahib       = ${countNewLine(PunjabiPath.anandSahib)}  ${countNewLine(HindiPath.anandSahib)}");
  print("Punjabi kirtanSohila     = ${countNewLine(PunjabiPath.kirtanSohila)}  ${countNewLine(HindiPath.kirtanSohila)}");
  print("Punjabi ardas            = ${countNewLine(PunjabiPath.ardas)}  ${countNewLine(HindiPath.ardas)}");
  print("Punjabi sukhmaniSahib    = ${countNewLine(PunjabiPath.sukhmaniSahib)}  ${countNewLine(HindiPath.sukhmaniSahib)}");
  print("Punjabi rehrasSahib      = ${countNewLine(PunjabiPath.rehrasSahib)}  ${countNewLine(HindiPath.rehrasSahib)}");
  print("Punjabi jaapSahib        = ${countNewLine(PunjabiPath.jaapSahib)}  ${countNewLine(HindiPath.jaapSahib)}");

}
String countNewLine(String str) {
  int result = 0;
  int len = str.length;

  for (int i = 0; i<len; i++) {
    if (str[i] == '\n') result++;
  }
  return result.toString();
}
