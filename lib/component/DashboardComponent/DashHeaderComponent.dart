import '../../main.dart';
import '../../utils/ResponsiveWidget.dart';
import '../../utils/extension/string_extensions.dart';

import '../../screen/DashboardScreen.dart';
import '../../utils/Common.dart';
import '../../utils/extension/int_extensions.dart';
import '../../utils/extension/text_styles.dart';
import '../../utils/extension/widget_extensions.dart';
import 'package:flutter/material.dart';
import '../../utils/Images.dart';

class DashHeaderComponent extends StatefulWidget {
  static String tag = '/DashboardHeaderComponent';

  @override
  DashHeaderComponentState createState() => DashHeaderComponentState();
}

class DashHeaderComponentState extends State<DashHeaderComponent> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: kToolbarHeight + 40,
        padding: EdgeInsets.symmetric(
            horizontal: mCommonPadding(context), vertical: 0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Colors.black,
              Colors.black87,
              Colors.black45,
              Colors.transparent
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.asset(app_logo_white, width: 370, height: 120)
                    .cornerRadiusWithClipRRect(8)
                    .onTap(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DashboardScreen(),
                    ),
                  );
                }),
                // 10.width,
                // Text(builderResponse.appName.validate(), style: boldTextStyle(color: Colors.white, size: 20)),
              ],
            ),
          ],
        ));
  }
}
