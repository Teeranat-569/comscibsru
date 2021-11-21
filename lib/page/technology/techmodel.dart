import 'dart:convert';

class TechModel {
  final String nameTitle;
  final String linkTitle;
  final String conclu;
  TechModel({
    required this.nameTitle,
    required this.linkTitle,
    required this.conclu,
  });

  TechModel copyWith({
    String? nameTitle,
    String? linkTitle, 
    String? conclu,
  }) {
    return TechModel(
      nameTitle: nameTitle ?? this.nameTitle,
      linkTitle: linkTitle ?? this.linkTitle,
      conclu: conclu ?? this.conclu,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nameTitle': nameTitle,
      'linkTitle': linkTitle,
      'conclu': conclu,
    };
  }

  factory TechModel.fromMap(Map<String, dynamic> map) {
    return TechModel(
      nameTitle: map['nameTitle'],
      linkTitle: map['linkTitle'],
      conclu: map['conclu'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TechModel.fromJson(String source) => TechModel.fromMap(json.decode(source));

  @override
  String toString() => 'TechModel(nameTitle: $nameTitle, linkTitle: $linkTitle, conclu: $conclu)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is TechModel &&
      other.nameTitle == nameTitle &&
      other.linkTitle == linkTitle &&
      other.conclu == conclu;
  }

  @override
  int get hashCode => nameTitle.hashCode ^ linkTitle.hashCode ^ conclu.hashCode;
}
