import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchField extends StatelessWidget {
  final TextEditingController searchController;
  final FocusNode focusNode;
  final VoidCallback onTap;

  const SearchField({
    super.key,
    required this.searchController,
    required this.focusNode,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        focusNode: focusNode,
        controller: searchController,
        textInputAction: TextInputAction.search,
        decoration: const InputDecoration(
          prefixIcon: Icon(FontAwesomeIcons.magnifyingGlass),
          border: OutlineInputBorder(),
          labelText: 'Search',
        ),
        onChanged: (value) {
          onTap();
        },
      ),
    );
  }
}
