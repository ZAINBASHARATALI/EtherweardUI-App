import 'dart:io';

import 'package:ethelweard95/utils/colors.dart';
import 'package:ethelweard95/utils/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ImagesPickerWidget extends StatefulWidget {
  ImagesPickerWidget({super.key});

  @override
  State<ImagesPickerWidget> createState() => _ImagesPickerWidgetState();
}

class _ImagesPickerWidgetState extends State<ImagesPickerWidget> {
  List<File?> imagesFiles = [];

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
                Row(
                  children: List.generate(
                      imagesFiles.length,
                      (index) => ImageItem(
                            imagePath: imagesFiles[index],
                          )),
                ),
                if (imagesFiles.length < 5)
                  InkWell(
                    onTap: () {
                      pickedImage().then((value) {
                        if (value != null) {
                          setState(() {
                            imagesFiles.add(value);
                          });
                        }
                      });
                    },
                    child: Container(
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
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              '  ${imagesFiles.length}/5 Photo',
              style: context.regular12.copyWith(color: AppColors.black.withOpacity(0.6)),
            ),
          ),
        ],
      ),
    );
  }

  Future<File?> pickedImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return null;
      final temporaryImage = File(image.path);
      return temporaryImage;
    } on PlatformException catch (e) {
      print('Failed to pick Image: $e');
    }
  }
}

class ImageItem extends StatelessWidget {
  final File? imagePath;
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
          image: FileImage(imagePath ?? File('')),
        ),
      ),
    );
  }
}
