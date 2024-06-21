import 'package:flutter/material.dart';
import '../../main.dart';
import '../../utils/ResponsiveWidget.dart';
import '../../utils/extension/context_extensions.dart';
import '../../utils/extension/int_extensions.dart';
import '../../utils/extension/string_extensions.dart';
import '../../utils/extension/widget_extensions.dart';

import '../../utils/Common.dart';
import '../../utils/Images.dart';
import '../../utils/extension/text_styles.dart';

class DashDowloadComponent extends StatefulWidget {
  @override
  DashDowloadComponentState createState() => DashDowloadComponentState();
}

class DashDowloadComponentState extends State<DashDowloadComponent> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    Widget downloadDetail() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          customTextWidget(text: 'Download Now!'),
          8.height,
          Text('${builderResponse.appName.validate()} App',
              style: primaryTextStyle(size: 20), textAlign: TextAlign.center),
          30.height,
          Row(
            children: [
              Image.asset(play_store, height: 45).onTap(() {
                commonLaunchUrl(builderResponse.playStoreLink.validate());
              }),
              30.width,
              Image.asset(app_store, height: 45).onTap(() {
                commonLaunchUrl(builderResponse.appStoreLink.validate());
              }),
            ],
          ),
        ],
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(
          vertical: 50, horizontal: mCommonPadding(context)),
      width: context.width(),
      child: ResponsiveWidget.isSmallScreen(context)
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                downloadDetail(),
                // Image.asset(builderResponse.appSsImage.validate(), fit: BoxFit.fill),
              ],
            )
          : Row(
              children: [
                downloadDetail(),
                // Image.asset(builderResponse.appSsImage.validate(), fit: BoxFit.fill).expand(),
              ],
            ),
    );
  }
}
