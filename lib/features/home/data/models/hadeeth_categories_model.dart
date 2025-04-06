import 'package:equatable/equatable.dart';

class HadeethCategorieshModel extends Equatable {
  final String? id;
  final String? title;
  final String? hadeethsCount;
  final dynamic parentId;

  const HadeethCategorieshModel({
    this.id,
    this.title,
    this.hadeethsCount,
    this.parentId,
  });

  factory HadeethCategorieshModel.fromJson(Map<String, dynamic> json) =>
      HadeethCategorieshModel(
        id: json['id'] as String?,
        title: json['title'] as String?,
        hadeethsCount: json['hadeeths_count'] as String?,
        parentId: json['parent_id'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'hadeeths_count': hadeethsCount,
    'parent_id': parentId,
  };

  @override
  List<Object?> get props => [id, title, hadeethsCount, parentId];
}
