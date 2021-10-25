class StringUtils {
  static String digitsOnly(String string) {
    if (string.isEmpty) throw Exception("String must not be null or empty.");
    return string.replaceAll(RegExp(r'([^0-9])'), '');
  }
}
