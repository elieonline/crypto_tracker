extension CapitalizeFirst on String {
  String capitalizeFirst() {
    return this[0].toUpperCase() + substring(1);
  }

  String reArrangeDOB(String pattern, [String newPattern = "-"]) {
    return split(pattern).reversed.join(newPattern);
  }

  String obscuredMail() {
    var newString = '';
    final List<String> emailList = split("");
    for (var i = 0; i < emailList.length; i++) {
      if (i != 0 && emailList[i] != '@' && i < indexOf('.')) {
        emailList[i] = '*';
        newString = emailList.join();
      }
    }
    return newString;
  }

  String formatPhoneNumber() {
    if (startsWith('0')) {
      return '+234${substring(1)}';
    } else if (startsWith('234')) {
      return '+$this';
    } else if (length == 10) {
      return '+234$this';
    } else {
      return this; // Return the original string if it doesn't match
    }
  }
}
