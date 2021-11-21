// ignore: file_names
import 'dart:convert';

class ActivityModel {
  final String link1;
  ActivityModel({
    required this.link1,
  });

  ActivityModel copyWith({
    String? link1,
  }) {
    return ActivityModel(
      link1: link1 ?? this.link1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'link1': link1,
    };
  }

  factory ActivityModel.fromMap(Map<String, dynamic> map) {
    return ActivityModel(
      link1: map['link1'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ActivityModel.fromJson(String source) => ActivityModel.fromMap(json.decode(source));

  @override
  String toString() => 'ActivityModel(link1: $link1)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ActivityModel &&
      other.link1 == link1;
  }

  @override
  int get hashCode => link1.hashCode;
}
