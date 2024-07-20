
enum Language { hindi, english, punjabi }


class SettingModel {
  final bool isPageView;
  final int fontSize;
  final int fontWeight;
  final Language language;

  SettingModel({
    required this.fontSize,
    required this.fontWeight,
    required this.isPageView,
    required this.language,
  });

  SettingModel copyWith({
    bool? isPageView,
    int? fontSize,
    int? fontWeight,
    Language? language, // Now explicitly includes Language
  }) {
    return SettingModel(
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      isPageView: isPageView ?? this.isPageView,
      language: language ?? this.language, // Update with new language if provided
    );
  }

   
}
