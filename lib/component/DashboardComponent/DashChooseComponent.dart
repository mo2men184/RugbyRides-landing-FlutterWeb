import 'package:flutter/material.dart';
import '../../main.dart';
import '../../model/BuilderResponse.dart';
import '../../utils/Images.dart';
import '../../utils/extension/context_extensions.dart';
import '../../utils/extension/decorations.dart';
import '../../utils/extension/int_extensions.dart';
import '../../utils/extension/list_extensions.dart';
import '../../utils/extension/string_extensions.dart';
import '../../utils/extension/text_styles.dart';
import '../../utils/extension/widget_extensions.dart';

import '../../utils/Common.dart';
import '../../utils/ResponsiveWidget.dart';

class DashChooseComponent extends StatefulWidget {
  @override
  DashChooseComponentState createState() => DashChooseComponentState();
}

class DashChooseComponentState extends State<DashChooseComponent> {
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
    Widget _detailWidget(WhyChooseUs model) {
      return Container(
        width: context.width() * 0.23,
        decoration:
            boxDecorationWithRoundedCorners(backgroundColor: Colors.white54),
        padding: EdgeInsets.all(mCommonCardPadding(context)),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black12, width: 3)),
              child: Image.asset(model.image.validate(), height: 50, width: 50),
            ),
            SizedBox(height: 24),
            Text(model.title.validate(),
                style: boldTextStyle(color: Colors.white, size: 20),
                textAlign: TextAlign.center),
            SizedBox(height: 24),
            Text(model.subtitle.validate(),
                style: primaryTextStyle(color: Colors.white70, height: 1.8),
                textAlign: TextAlign.center,
                maxLines: model.isMore ? null : 3),
            SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                model.isMore = !model.isMore;
                setState(() {});
              },
              child: Text(model.isMore ? 'READ  LESS' : 'READ  MORE',
                  style: boldTextStyle(size: 10, color: Colors.white)),
            )
          ],
        ),
      );
    }

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            choose_us_bg,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          constraints:
              BoxConstraints(minHeight: context.height() - kToolbarHeight),
          padding: EdgeInsets.symmetric(
              vertical: 50, horizontal: mCommonPadding(context)),
          width: context.width(),
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customTextWidget(text: 'Why Choose Us', isWhiteText: true),
              8.height,
              // Text('Benefit list',
              //     style: primaryTextStyle(size: 20, color: Colors.white),
              //     textAlign: TextAlign.center),
              SizedBox(
                  height: ResponsiveWidget.isSmallScreen(context) ? 30 : 50),
              ResponsiveWidget.isSmallScreen(context)
                  ? ListView(
                      shrinkWrap: true,
                      children:
                          builderResponse.whyChooseUs.validate().map((mData) {
                        return _detailWidget(mData).paddingBottom(24);
                      }).toList(),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:
                          builderResponse.whyChooseUs.validate().map((mData) {
                        return _detailWidget(mData);
                      }).toList(),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
