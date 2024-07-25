
enum Language { hindi, english, punjabi }
enum FeedbackCategory { mistake, feedback ,other }
enum WhichScreen { sendFeedback, privacyPolicy,howToReportError, about  }

class SettingModel {
  final bool isPageView;
  final bool isShowBottomButtons;
  final int fontSize;
  final int fontWeight;
  final Language language;

  SettingModel({
    required this.fontSize,
    required this.fontWeight,
    required this.isPageView,
    required this.isShowBottomButtons,
    required this.language,
  });

  SettingModel copyWith({
    bool? isPageView,
    bool? isShowBottomButtons,
    int? fontSize,
    int? fontWeight,
    Language? language,
  }) {
    return SettingModel(
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      isPageView: isPageView ?? this.isPageView,
      isShowBottomButtons: isShowBottomButtons ?? this.isShowBottomButtons,
      language: language ?? this.language,
    );
  }
}
class UserFeedback {
  final FeedbackCategory category;
  final String errorString;
  final String userMessage;
  final DateTime timeStamp;

  UserFeedback(
    {
    required this.category,
     this.errorString = "",
    required this.userMessage,
    required this.timeStamp ,
    
  });

  Map<String, String> toMap() {
    return {
      'category': category.toString(),
      'errorString': errorString,
      'userMessage': userMessage,
      'timeStamp':timeStamp.toString()
    };
  }
}
