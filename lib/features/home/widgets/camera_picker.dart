import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraPicker extends StatelessWidget {
  const CameraPicker({super.key});

  Future<void> _openCamera(BuildContext context) async {
    final picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      // TODO: handle picked image (search by image)
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openCamera(context),
      child: const Icon(Icons.camera_alt_outlined, size: 24, color: Color(0xFF555555)),
    );
  }
}
