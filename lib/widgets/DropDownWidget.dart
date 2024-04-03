import 'package:flutter/material.dart';
import 'package:test_app/common/styles.dart';

class DropDownView extends StatelessWidget {
  const DropDownView({
    this.showDocsOptions,
    this.selectedValue = '',
    this.showDropArrow = true,
    this.hintText = 'Type',
    this.icon = Icons.arrow_drop_down,
    this.iconColor = const Color(0xFF6E6E73),
    super.key,
  });

  final Function()? showDocsOptions;
  final String selectedValue;
  final bool showDropArrow;
  final String hintText;
  final IconData? icon;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: 52,
      decoration:
          selectedValue.isEmpty ? outlineBorder : outlineBorderWithPinkBg,
      child: _buildChildWidgetView(context),
    );
  }

  Widget _buildChildWidgetView(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      highlightColor: black.withOpacity(0.95),
      onTap: showDocsOptions,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: _buildViewWithValue()),
            if (showDropArrow)
              Icon(
                icon,
                color: iconColor,
              )
          ],
        ),
      ),
    );
  }

  Widget _buildViewWithValue() {
    if (selectedValue.isEmpty) {
      return Text(
        hintText,
        style: greyText14FF,
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hintText,
          style: greyText10FF,
        ),
        Text(
          selectedValue,
          overflow: TextOverflow.ellipsis,
          style: whiteText12,
        ),
      ],
    );
  }
}
