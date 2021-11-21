import 'dart:convert';

class LinkModel {
  final String linkManual;
  final String nameManual;
  LinkModel({
    required this.linkManual,
    required this.nameManual,
  });

  LinkModel copyWith({
    String? linkManual,
    String? nameManual,
  }) {
    return LinkModel(
      linkManual: linkManual ?? this.linkManual,
      nameManual: nameManual ?? this.nameManual,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'link-manual': linkManual,
      'nameManual': nameManual,
    };
  }

  factory LinkModel.fromMap(Map<String, dynamic> map) {
    return LinkModel(
      linkManual: map['link-manual'],
      nameManual: map['nameManual'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LinkModel.fromJson(String source) =>
      LinkModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'LinkModel(linkManual: $linkManual, nameManual: $nameManual)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LinkModel &&
        other.linkManual == linkManual &&
        other.nameManual == nameManual;
  }

  @override
  int get hashCode => linkManual.hashCode ^ nameManual.hashCode;
}
