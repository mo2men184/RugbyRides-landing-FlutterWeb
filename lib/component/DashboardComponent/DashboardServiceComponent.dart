import 'package:flutter/material.dart';
import 'package:texi_website/main.dart';
import 'package:texi_website/utils/extension/context_extensions.dart';
import 'package:texi_website/utils/extension/int_extensions.dart';
import 'package:texi_website/utils/extension/string_extensions.dart';
import 'package:texi_website/utils/extension/widget_extensions.dart';

import '../../utils/Common.dart';
import '../../utils/ResponsiveWidget.dart';
import '../../utils/extension/text_styles.dart';

class DashboardServiceComponent extends StatefulWidget {
  @override
  DashboardServiceComponentState createState() =>
      DashboardServiceComponentState();
}

class DashboardServiceComponentState extends State<DashboardServiceComponent> {
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
    Widget infoWidget() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customTextWidget(text: 'Our Mission'),
          16.height,
          Text(
            builderResponse.ourMission!.description.validate(),
            style: primaryTextStyle(),
            textAlign: TextAlign.justify,
          )
        ],
      );
    }

    return Container(
      child: builderResponse.ourMission != null
          ? Container(
              margin: EdgeInsets.symmetric(
                  vertical: ResponsiveWidget.isSmallScreen(context) ? 50 : 100,
                  horizontal: mCommonPadding(context)),
              child: ResponsiveWidget.isSmallScreen(context)
                  ? Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            builderResponse.ourMission!.image.validate(),
                            fit: BoxFit.cover,
                            height: context.height() * 0.25,
                            width: context.height() * 0.25,
                          ),
                        ),
                        30.height,
                        infoWidget(),
                      ],
                    )
                  : Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            builderResponse.ourMission!.image.validate(),
                            fit: BoxFit.cover,
                            height: context.height() * 0.6,
                            width: context.height() * 0.6,
                          ),
                        ),
                        50.width,
                        infoWidget().expand(),
                      ],
                    ),
            )
          : SizedBox(),
    );
  }
}
