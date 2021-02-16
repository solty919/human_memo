import 'dart:io';

import 'package:flutter/material.dart';
import 'package:human_memo/profile/profile_view_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _BackImage(),
        _Icon(),
      ],
    );
  }
}

class _BackImage extends StatelessWidget {
  void _onTap(BuildContext context) async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      return;
    }
    final model = context.read<ProfileViewModel>();
    model.setBackImage(Image.file(
      File(pickedFile.path),
      fit: BoxFit.fitWidth,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context),
      child: SizedBox(
          width: double.infinity,
          height: 128,
          child: context.select<ProfileViewModel, Image>(
              (model) => model.person.backImage)),
    );
  }
}

class _Icon extends StatelessWidget {
  void _onTap(BuildContext context) async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      return;
    }
    final model = context.read<ProfileViewModel>();
    model.setImage(Image.file(File(pickedFile.path)));
  }

  @override
  Widget build(BuildContext context) {
    final _image = context.select<ProfileViewModel, Image>((model) {
      return model.person.image;
    });
    return GestureDetector(
        onTap: () => _onTap(context),
        child: _image == null ? _noImage(context) : _hasImage(context));
  }

  Widget _hasImage(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: context.select<ProfileViewModel, Image>((model) {
              return model.person.image;
            }).image,
            fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: Theme.of(context).scaffoldBackgroundColor,
          width: 3.0,
        ),
      ),
    );
  }

  Widget _noImage(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
            color: Theme.of(context).scaffoldBackgroundColor,
            width: 3.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 3,
              offset: Offset(0, 2),
            ),
          ]),
      child: Icon(
        Icons.account_box,
        size: 50,
      ),
    );
  }
}
