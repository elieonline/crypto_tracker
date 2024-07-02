// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../core/utils/custom_icons.dart';
import 'formfield.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    this.searchController,
    this.hintText,
  });
  final TextEditingController? searchController;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return AppFormField(
      controller: searchController,
      hintText: hintText ?? 'Search for coins',
      borderRadius: 5,
      marginBottom: 0,
      constraints: const BoxConstraints(minHeight: 50, maxHeight: 50),
      contentPadding: const EdgeInsets.symmetric(vertical: 10),
      prefixIcon: const Icon(BIcons.search_normal, size: 18),
    );
  }
}
