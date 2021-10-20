import 'package:prologue/forms/validators/validator.dart';

class InputMandatoryDelegate with Validator {
  @override
  String? validate({String? text = '', bool mandatory = false}) {
    if (text!.isEmpty) {
      return "Campo obrigatório";
    }
  }
}
