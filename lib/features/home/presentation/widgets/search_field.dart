import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchField extends StatelessWidget {
  final TextEditingController searchController;
  final FocusNode focusNode;
  final String? labelText;
  final TextInputType? keyboardType;

  const SearchField({
    super.key,
    required this.searchController,
    this.labelText,
    this.keyboardType,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        focusNode: focusNode,
        controller: searchController,
        textInputAction: TextInputAction.search,
        keyboardType: keyboardType ?? TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: const Icon(FontAwesomeIcons.magnifyingGlass),
          border: const OutlineInputBorder(),
          labelText: labelText ?? 'Search',
        ),
      ),
    );
  }
}
