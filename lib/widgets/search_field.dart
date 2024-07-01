// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../core/utils/custom_icons.dart';
import 'formfield.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.searchController,
    this.hintText,
  });
  final TextEditingController searchController;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), boxShadow: [
        BoxShadow(
          offset: const Offset(0, 12.25),
          blurRadius: 39.2,
          color: const Color(0xFFBFBFBF).withOpacity(0.2),
        ),
      ]),
      child: AppFormField(
        controller: searchController,
        hintText: hintText ?? 'Search',
        borderRadius: 5,
        marginBottom: 0,
        suffixIcon: const Icon(BIcons.search_normal),
      ),
    );
  }
}
