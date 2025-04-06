import 'package:equatable/equatable.dart';

class AzkarModel extends Equatable {
  final String? category;
  final String? count;
  final String? description;
  final String? reference;
  final String? content;

  const AzkarModel({
    this.category,
    this.count,
    this.description,
    this.reference,
    this.content,
  });

  factory AzkarModel.fromJson(Map<String, dynamic> json) => AzkarModel(
    category: json['category'] as String?,
    count: json['count'] as String?,
    description: json['description'] as String?,
    reference: json['reference'] as String?,
    content: json['content'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'category': category,
    'count': count,
    'description': description,
    'reference': reference,
    'content': content,
  };

  @override
  List<Object?> get props {
    return [category, count, description, reference, content];
  }
}
