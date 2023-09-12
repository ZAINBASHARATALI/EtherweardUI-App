// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:field_suggestion/field_suggestion.dart';
import 'package:flutter/material.dart';

import 'package:ethelweard95/utils/colors.dart';
import 'package:ethelweard95/utils/context.dart';

import '../widgets/ImagesPickerWidget.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: MediaQuery.viewInsetsOf(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Share Your Journey',
                      style: context.bold24.copyWith(color: AppColors.black),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.close),
                    )
                  ],
                ),
                ImagesPickerWidget(),
                Text(
                  'Tag Location',
                  style: context.bold16,
                ),
                const LocationTagWidget(),
                Text(
                  'Describe',
                  style: context.bold16,
                ),
                const TextFieldWidget(
                  hintText: 'Type your text here...',
                  lines: 5,
                  height: null,
                  maxLength: 120,
                ),
                const Row(
                  children: [
                    HashTag(),
                    HashTag(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HashTag extends StatelessWidget {
  const HashTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.black.withOpacity(0.4), width: 0.5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '#hashtag',
            style: context.regular12.copyWith(
              color: AppColors.black.withOpacity(0.4),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Icon(
              Icons.close,
              color: AppColors.black.withOpacity(0.4),
              size: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class LocationTagWidget extends StatelessWidget {
  const LocationTagWidget({super.key});
  static const List<String> cities = ['Amsterdam', 'Munich', 'Bavaria', 'Stutgard'];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 3),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: FieldSuggestion(
        textController: TextEditingController(),
        suggestions: cities,
        search: (item, input) {
          return item.toString().toLowerCase().contains(input.toLowerCase());
        },
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              cities[index],
              style: context.regular12.copyWith(color: AppColors.black),
            ),
          );
        },
        inputDecoration: const InputDecoration(
          hintText: 'Enter Location', // optional
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final double? height;
  final int? lines;
  final int? maxLength;
  final Icon? suffixIcon;
  const TextFieldWidget({
    Key? key,
    required this.hintText,
    this.height = 50,
    this.maxLength,
    this.lines = 1,
    this.suffixIcon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 3),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      height: height,
      width: context.width,
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              maxLength: maxLength,
              maxLines: lines,
              minLines: lines,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: context.regular14.copyWith(color: AppColors.black.withOpacity(0.6)),
              ),
            ),
          ),
          suffixIcon ?? const SizedBox.shrink()
        ],
      ),
    );
  }
}
