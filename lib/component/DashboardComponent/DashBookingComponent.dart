import 'package:flutter/material.dart';
import '../../main.dart';
import '../../utils/extension/context_extensions.dart';
import '../../utils/extension/int_extensions.dart';
import '../../utils/extension/string_extensions.dart';
import '../../utils/extension/widget_extensions.dart';
import '../../utils/Common.dart';
import '../../utils/Images.dart';
import '../../utils/extension/text_styles.dart';

class DashBookingComponent extends StatefulWidget {
  @override
  DashBookingComponentState createState() => DashBookingComponentState();
}

class DashBookingComponentState extends State<DashBookingComponent> {
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
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            bg_image,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          constraints: BoxConstraints(minHeight: context.height()),
          padding: EdgeInsets.symmetric(
              vertical: context.height() * 0.35,
              horizontal: mCommonPadding(context)),
          width: context.width(),
          alignment: Alignment.topLeft,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                builderResponse.companyName.validate(),
                style: boldTextStyle(
                        size: largeTextSize(context) - 7,
                        color: Colors.white,
                        height: 1.4)
                    .copyWith(shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(-1, 1),
                    blurRadius: 5,
                  )
                ]),
              ),
              16.height,
              Row(
                children: [
                  Image.asset(play_store, height: 45).onTap(() {
                    commonLaunchUrl(builderResponse.playStoreLink.validate());
                  }),
                  20.width,
                  Image.asset(app_store, height: 45).onTap(() {
                    commonLaunchUrl(builderResponse.appStoreLink.validate());
                  }),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
