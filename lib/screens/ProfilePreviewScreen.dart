import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/common/constants.dart';
import 'package:test_app/common/styles.dart';

class ProfilePreviewScreen extends StatelessWidget {
  const ProfilePreviewScreen({
    this.isPreviewForCard = false,
    this.uint8list,
    super.key,
  });
  final bool isPreviewForCard;
  final Uint8List? uint8list;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: isPreviewForCard ? Colors.transparent : pink,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.transparent,
            height: 0,
          ),
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            _getTitle(),
            const Spacer(),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: SvgPicture.asset(
                'assets/ic_clear.svg',
                color: isPreviewForCard ? pink : black,
                fit: BoxFit.cover,
                width: 22,
                height: 22,
              ),
            ),
          ],
        ),
      ),
      body: _buildViewForLanscape(context),
    );
  }
  Widget _buildViewForLanscape(BuildContext context){
    if(MediaQuery.of(context).orientation == Orientation.landscape){
      return SingleChildScrollView(
        child: Column(
          children: [
            _buildView(context),

          ],
        ),
      );
    }
    return Column(
      children: [
        _buildView(context),
        if(isPreviewForCard == false && MediaQuery.of(context).orientation == Orientation.portrait)
          Expanded(child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 10),
            decoration: const BoxDecoration(
              color: Colors.black,

              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),

              ),
            ),
            child: Image.asset('assets/preview.png',
              fit: BoxFit.fill,
            ),
          ))
      ],
    );

  }
  Widget _buildBottomView(BuildContext context){

    if(isPreviewForCard == false && MediaQuery.of(context).orientation == Orientation.portrait){
      return  Expanded(child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 10),
        decoration: const BoxDecoration(
          color: Colors.black,

          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),

          ),
        ),
        child: Image.asset('assets/preview.png',
          fit: BoxFit.fill,
        ),
      ));
    }
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        color: Colors.black,

        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),

        ),
      ),
      child: Image.asset('assets/preview.png',
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _getTitle() {
    if (isPreviewForCard) {
      return Text(
        strCardPhoto,
        style: pinkText14,
      );
    }
    return Text(
      strPreviewPhotoPlanning,
      style: blackText14Bold,
    );
  }

  Widget _buildView(BuildContext context) {
    if (isPreviewForCard) {
      return ListView.builder(
        itemCount: 6,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            color: pink,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 85,
                  width: 100,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(0),
                    ),
                    color: black,
                    border: Border.all(
                      color: white,
                      width: 4.0,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.memory(
                      uint8list!,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildlightContainer(200, 10),
                    _buildlightContainer(150, 10),
                    _buildlightContainer(
                        MediaQuery.of(context).size.width * 0.6, 10),
                    _buildlightContainer(
                        MediaQuery.of(context).size.width * 0.6, 10),
                    _buildlightContainer(
                        MediaQuery.of(context).size.width * 0.6, 10),
                  ],
                )
              ],
            ),
          );
        },
      );
    }
    return Column(
      children: [
        Container(

          color: pink,
          alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 20),
        width: MediaQuery.of(context).size.width,
          child: Container(
            padding: const EdgeInsets.all(5.0),
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(150),
              ),
              color: pink,
              border: Border.all(
                color: white,
                width: 4.0,
              ),
            ),
            child: ClipOval(
              child: Image.memory(
                uint8list!,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),


      ],
    );
  }

  Widget _buildlightContainer(double width, double height) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(6),
        ),
        color: black.withOpacity(0.1),
      ),
    );
  }
}
