class PopUpDate {
  final int userPress;
  final int userCancel;

  PopUpDate({
    required this.userPress,
    required this.userCancel,
  });

  factory PopUpDate.fromJson(Map<String, dynamic> json) {
    return PopUpDate(
      userPress: json["userPress"] != null ? json["userPress"] : "",
      userCancel: json["userCancel"] != null ? json["userCancel"] : "",
    );
  }
}
