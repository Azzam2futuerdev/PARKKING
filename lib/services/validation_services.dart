class ValidationService {

  String? IDValidator(String value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid ID number';
    }

    String pattern = r'^[0-9]*$';
    RegExp regExp = new RegExp(pattern);

    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid ID number';
    }

    return null;
  }

  String? licenseValidator(String value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid License Number';
    }

    String pattern = r'^[0-9]*$';
    RegExp regExp =  RegExp(pattern);

    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid License Number';
    }

    return null;
  }

  String? contactValidator(String value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid phone number';
    }

    if (value.length != 10) {
      return 'Please enter a valid phone number';
    }

    String pattern = r'^[0-9]*$';
    RegExp regExp = RegExp(pattern);

    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }

    return null;
  }

  String? nameValidator(String value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid name';
    }

    String pattern = r"^[A-Za-z\s]{1,}[\.]{0,1}[A-Za-z\s]{0,}$";
    RegExp regExp =  RegExp(pattern);

    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid name';
    }

    return null;
  }

}
