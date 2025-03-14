enum LangaugeType { english, arabic }

const String arabic = 'ar';
const String english = 'en';

extension LanguageTypeExtension on LangaugeType {
  String getValue() {
    switch (this) {
      case LangaugeType.english:
        return english;
      case LangaugeType.arabic:
        return arabic;
    }
  }
}
