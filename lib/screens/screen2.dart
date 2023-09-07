// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:field_suggestion/field_suggestion.dart';
import 'package:flutter/material.dart';

import 'package:ethelweard95/utils/colors.dart';
import 'package:ethelweard95/utils/context.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      //height: context.height * 0.75,
      width: context.width,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const ImagesPickerWidget(),
            Text(
              'Tag Location',
              style: context.bold16,
            ),
            const LocationTagWidget(),
            // TextFieldWidget(
            //   hintText: 'Enter Location',
            //   suffixIcon: Icon(
            //     Icons.search,
            //     color: AppColors.black.withOpacity(0.4),
            //   ),
            // ),
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
  static const List<String> cities = [
    'Amsterdam',
    'Munich',
    'Bavaria',
    'Stutgard'
  ];

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
                hintStyle: context.regular14
                    .copyWith(color: AppColors.black.withOpacity(0.6)),
              ),
            ),
          ),
          suffixIcon ?? const SizedBox.shrink()
        ],
      ),
    );
  }
}

class ImagesPickerWidget extends StatelessWidget {
  const ImagesPickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25, bottom: 10),
      height: context.height * 0.16 + 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(0),
              scrollDirection: Axis.horizontal,
              children: [
                const ImageItem(
                  imagePath: 'assets/stars.jpg',
                ),
                const ImageItem(
                  imagePath: 'assets/stars.jpg',
                ),
                const ImageItem(
                  imagePath: 'assets/stars.jpg',
                ),
                Container(
                  height: context.height * 0.16,
                  width: context.height * 0.09,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.lightGrey,
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.add,
                    color: AppColors.black.withOpacity(0.4),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              '  2/5 Photo',
              style: context.regular12
                  .copyWith(color: AppColors.black.withOpacity(0.6)),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageItem extends StatelessWidget {
  final String imagePath;
  const ImageItem({Key? key, required this.imagePath}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      height: context.height * 0.16,
      width: context.height * 0.16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.black,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imagePath),
        ),
      ),
    );
  }
}
