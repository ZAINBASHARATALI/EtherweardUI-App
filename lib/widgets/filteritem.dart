// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ethelweard95/utils/context.dart';
import 'package:flutter/material.dart';

import 'package:ethelweard95/utils/colors.dart';

class FilterItem extends StatelessWidget {
  final String title;
  const FilterItem({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.white),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 4.5),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      alignment: Alignment.center,
      child: Text(title, style: context.regular12),
    );
  }
}
