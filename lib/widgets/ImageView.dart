import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:test_app/common/constants.dart';
import 'package:test_app/common/styles.dart';

class ZoomableImageView extends StatelessWidget {
  ZoomableImageView({
    required this.file,
    required this.isCardView,
    required this.profilePhotoViewController,
    required this.cardPhotoViewController,
    this.isPhotoEditingDoneForProfile = false,
    this.isPhotoEditingDoneForCard = false,
    this.repaintKey,
    this.repaintKeyForCard,
    super.key,
  });
  GlobalKey? repaintKey;
  GlobalKey? repaintKeyForCard;
  bool isPhotoEditingDoneForProfile;
  bool isPhotoEditingDoneForCard;
  Color borderColor = grey;
  File? file;
  bool isCardView;
  PhotoViewController profilePhotoViewController;
  PhotoViewController cardPhotoViewController;

  Widget _buildBody(BuildContext context) {
    return _buildImageShape(context);
    // return Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
    //   child: Center(
    //     child: Container(
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.all(
    //           Radius.circular(isCardView ? 0.0 : 150),
    //         ),
    //         border: Border.all(
    //           color: borderColor,
    //           width: isCardView ? 10.0 : 4.0,
    //         ),
    //       ),
    //       child: ,
    //     ),
    //   ),
    // );
  }
  /* void _handleRotationUpdate(DragUpdateDetails details) {
     setState(() {
       _currentRotation += details.delta.dx / 100; // Adjust sensitivity as needed
     });
   }*/

  Widget _buildImageShape(BuildContext context) {
    return IndexedStack(
      index: isCardView ? 0 : 1,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.65,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(0),
                ),
                border: Border.all(
                  color: borderColor,
                  width: 10.0,
                ),
              ),
              child: RepaintBoundary(
                key: repaintKeyForCard,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: PhotoView(
                    controller: cardPhotoViewController,
                    imageProvider: FileImage(
                      file!,
                    ),
                    enableRotation: true,
                    wantKeepAlive: true,
                  ),
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(200),
                ),
                border: Border.all(
                  color: borderColor,
                  width: 4.0,
                ),
              ),
              child: RepaintBoundary(
                key: repaintKey,
                child: CircleAvatar(
                  radius: 150,
                  child: ClipOval(
                    child: PhotoView(
                      controller: profilePhotoViewController,
                      imageProvider: FileImage(
                        file!,
                      ),
                      enableRotation: true,
                      wantKeepAlive: true,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
    if (isCardView) {
      return RepaintBoundary(
        key: repaintKeyForCard,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0.0),
          child: PhotoView(
            controller: cardPhotoViewController,
            imageProvider: FileImage(
              file!,
            ),
            enableRotation: true,
            wantKeepAlive: true,
          ),
        ),
      );
    }
    return RepaintBoundary(
      key: repaintKey,
      child: CircleAvatar(
        radius: 120,
        child: ClipOval(
          child: PhotoView(
            controller: profilePhotoViewController,
            imageProvider: FileImage(
              file!,
            ),
            enableRotation: true,
            wantKeepAlive: true,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isPhotoEditingDoneForProfile && isCardView == false) {
      borderColor = pink;
    }
    if (isPhotoEditingDoneForCard && isCardView) {
      borderColor = pink;
    }
    return Column(
      children: [
        Expanded(child: _buildBody(context)),
        Text(
          _getPhotoAdjustText(),
          style: pinkText10,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          _getPhotoDoneStatusText(),
          style: greyText12,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  String _getPhotoAdjustText() {
    if (isPhotoEditingDoneForProfile && isCardView == false) {
      return strPhotoAdjustDoneText;
    }
    if (isPhotoEditingDoneForCard && isCardView) {
      return strPhotoAdjustDoneText;
    }

    return strPhotoAdjustText;
  }

  String _getPhotoDoneStatusText() {
    if (isPhotoEditingDoneForProfile && isCardView == false) {
      return strNextPhotoText;
    }
    if (isPhotoEditingDoneForCard && isCardView) {
      return strNextPhotoText;
    }
    return strPhotoAdjustText1;
  }
}
