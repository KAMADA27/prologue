extension StringUtils on String {
  String digitsOnly() {
    String actual = this;
    return actual.replaceAll(RegExp(r'([^0-9])'), '');
  }
}
