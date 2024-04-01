import 'package:flutter/material.dart';
import 'package:test_app/common/constants.dart';
import 'package:test_app/common/styles.dart';
import 'package:test_app/widgets/AppBarWidget.dart';
import 'package:test_app/widgets/RoundButton.dart';

class ContactNumberScreen extends StatefulWidget {
  const ContactNumberScreen({Key? key}) : super(key: key);

  @override
  _ContactNumberScreenState createState() => _ContactNumberScreenState();
}

class _ContactNumberScreenState extends State<ContactNumberScreen> {
  double? btnOpacity = 0.5;
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 16,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          title: AppBarView(
            showSkip: false,
            title: strNumber,
            onTapSkip: () {},
          )),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: pink, // Border color
                  width: 1.0, // Border width
                ),
                borderRadius: BorderRadius.circular(20), // Border radius
              ),
              child: TextFormField(
                autofocus: true,
                controller: _controller,
                cursorColor: pink,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  counterText: '',
                  suffixIcon: _controller.text.isEmpty
                      ? null
                      : InkWell(
                          onTap: () {
                            _controller.text = '';
                            setState(() {});
                          },
                          child: Image.asset('assets/ic_clear.png')),
                  contentPadding: const EdgeInsets.all(10.0),
                  border: InputBorder.none,
                  // Remove the default underline border
                ),
                maxLength: 20,
                onChanged: (val) {
                  if (val.length >= 8) {
                    btnOpacity = 1.0;
                    setState(() {});
                  } else {
                    btnOpacity = 0.5;
                    setState(() {});
                  }
                },
              ),
            ),
            Expanded(child: Container()),
            RoundButton(
                btnOpacity: btnOpacity,
                bgColor: pink,
                btnTextStyle: whiteText14,
                btnText: strSave,
                onTap: () {
                  if (_controller.text.toString().length >= 8) {
                    Navigator.pop(context, {
                      'Number': _controller.text.toString(),
                    });
                  }
                })
          ],
        ),
      ),
    );
  }
}
