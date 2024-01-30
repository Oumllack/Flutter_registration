import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_pt/ui/pages/my_name.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 150,
        title: const Text(
          'Аккаунт',
          style: TextStyle(
              color: Color(0xFF4C4C4C),
              fontSize: 17,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFF6F6F6),
        elevation: 0.3,
        leading: const Row(
          children: [
            Icon(
              (Icons.arrow_back_ios_new_rounded),
              color: Color(0xFF0098EE),
            ),
            Text(
              'Мой аккаунт',
              style: TextStyle(
                color: Color(0xFF0098EE),
              ),
            )
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
          child: Column(
            children: [
              const _PhotoWidget(),
              const SizedBox(height: 16),
              const Text(
                'apollo@gmail.com',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF7D7D7D),
                ),
              ),
              const SizedBox(height: 24),
              ProfileDetailsButton(
                title: 'Имя',
                hasBorder: true,
                onPressed: () {},
              ),
              Container(
                height: 1,
                color: const Color(0xFFC6C6C8),
              ),
              ProfileDetailsButton(
                title: 'Фамилия',
                onPressed: () {},
              ),
              Container(
                height: 1,
                color: const Color(0xFFC6C6C8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PhotoWidget extends StatelessWidget {
  const _PhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Uint8List? bytes;

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        final ImagePicker picker = ImagePicker();
        showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoActionSheet(
            title: Text('Title'),
            actions: [
              CupertinoActionSheetAction(
                onPressed: () async {
                  await picker.pickImage(source: ImageSource.camera).then(
                      (value) async => bytes = await value?.readAsBytes());
                },
                child: Text('Камера'),
              ),
              CupertinoActionSheetAction(
                onPressed: () async {
                  await picker.pickImage(source: ImageSource.gallery).then(
                      (value) async => bytes = await value?.readAsBytes());
                },
                child: Text('Gallery'),
              )
            ],
            cancelButton: CupertinoActionSheetAction(
              onPressed: () => Navigator.pop(context),
              child: Text('Close'),
            ),
          ),
        );
      },
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: bytes != null
                ? MemoryImage(bytes) as ImageProvider
                : AssetImage('assets/images/icon.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class ProfileDetailsButton extends StatefulWidget {
  const ProfileDetailsButton({
    super.key,
    required this.title,
    this.endText = 'Настроить',
    this.hasBorder = false,
    required this.onPressed,
  });

  final bool hasBorder;
  final String title;
  final String endText;
  final VoidCallback onPressed;

  @override
  State<ProfileDetailsButton> createState() => _ProfileDetailsButtonState();
}

class _ProfileDetailsButtonState extends State<ProfileDetailsButton> {
  late String endText = widget.endText;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      color: Colors.white,
      onPressed: () async {
        final newName = await Navigator.push<String>(
          context,
          MaterialPageRoute(
            builder: (context) => MyName(
              hintText: widget.title,
            ),
          ),
        );
        setState(() {
          endText = newName ?? '';
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: widget.hasBorder
              ? const BorderRadius.only(
                  topLeft: Radius.circular(13),
                  topRight: Radius.circular(13),
                )
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF4C4C4C),
              ),
            ),
            const Spacer(),
            Text(
              endText,
              style: TextStyle(
                color: endText == 'Настроить'
                    ? const Color(0xFFC6C6C8)
                    : const Color(0xFF7d7d7d),
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
              color: Color(0xFFC6C6C8),
            ),
          ],
        ),
      ),
    );
  }
}
