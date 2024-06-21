import 'dart:async';

import 'package:flutter/material.dart';
import '../../main.dart';
import '../../utils/ResponsiveWidget.dart';
import '../../utils/extension/context_extensions.dart';
import '../../utils/extension/int_extensions.dart';
import '../../utils/extension/list_extensions.dart';
import '../../utils/extension/string_extensions.dart';
import '../../utils/extension/widget_extensions.dart';

import '../../model/BuilderResponse.dart';
import '../../utils/Common.dart';
import '../../utils/Images.dart';
import '../../utils/extension/text_styles.dart';

class DashTestimonialComponent extends StatefulWidget {
  @override
  DashTestimonialComponentState createState() => DashTestimonialComponentState();
}

class DashTestimonialComponentState extends State<DashTestimonialComponent> {
  PageController _controller = PageController();
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  int _selectedIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    /*_timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_selectedIndex < builderResponse.clientTestimonials.validate().length-1) {
        _selectedIndex++;
      } else {
        _selectedIndex = 0;
      }

      _controller.animateToPage(
        _selectedIndex,
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeIn,
      );
    });*/
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget description(ClientTestimonial model) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(model.name.validate(), style: primaryTextStyle(size: 24, color: Colors.white), maxLines: 1),
          /* 16.height,
          Text('Central Accounts Strategist', style: primaryTextStyle(color: Colors.white), maxLines: 1),*/
          24.height,
          Text(model.description.validate(), style: primaryTextStyle(color: Colors.white70, height: 1.8), maxLines: 5),
          24.height,
          Text('- ${model.type.validate()}', style: secondaryTextStyle(weight: FontWeight.w600, size: 20), maxLines: 1),
        ],
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: ResponsiveWidget.isSmallScreen(context) ? 50 : 100, horizontal: 0),
      width: context.width(),
      color: Colors.grey.withOpacity(0.1),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customTextWidget(text: 'What They Say?').paddingSymmetric(horizontal: mCommonPadding(context)),
          8.height,
          Text('Client testimonials', style: primaryTextStyle(size: 20), textAlign: TextAlign.center).paddingSymmetric(horizontal: mCommonPadding(context)),
          ResponsiveWidget.isSmallScreen(context) ? 30.height : 50.height,
          SizedBox(
            height: 450,
            child: Row(
              children: [
                leftIconWidget(context, selectedIndex: _selectedIndex, onTap: () {
                  _controller.previousPage(duration: _kDuration, curve: _kCurve);
                }),
                PageView.builder(
                  controller: _controller,
                  itemCount: builderResponse.clientTestimonials.validate().length,
                  itemBuilder: (context, index) {
                    ClientTestimonial mData = builderResponse.clientTestimonials.validate()[index];
                    return ResponsiveWidget.isSmallScreen(context)
                        ? Container(
                            height: 450,
                            width: context.width(),
                            color: Colors.black,
                            padding: EdgeInsets.all(16),
                            margin: EdgeInsets.symmetric(vertical: 50),
                            child: Row(
                              children: [
                                description(mData).expand(),
                                8.width,
                                commonCachedNetworkImage(mData.profileImage.validate(), height: 80, width: 80, fit: BoxFit.cover).cornerRadiusWithClipRRect(40),
                              ],
                            ),
                          )
                        : Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              Container(
                                  height: 450,
                                  width: context.width(),
                                  color: Colors.black,
                                  padding: EdgeInsets.fromLTRB(mCommonCardPadding(context), mCommonCardPadding(context), context.width() * 0.4, mCommonCardPadding(context)),
                                  margin: EdgeInsets.symmetric(vertical: 70),
                                  child: description(mData)),
                              Positioned(
                                right: 24,
                                left: context.width() * 0.5,
                                child: Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    Container(
                                      height: 450,
                                      decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: AssetImage(profile_border))),
                                      padding: EdgeInsets.all(ResponsiveWidget.isSmallScreen(context) ? 16 : 25),
                                      child: CircleAvatar(backgroundImage: AssetImage(mData.profileImage.validate()),radius: 200),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                  },
                  onPageChanged: (value) {
                    _selectedIndex = value;
                    setState(() {});
                  },
                ).expand(),
                rightIconWidget(context, selectedIndex: _selectedIndex, lastIndex: builderResponse.clientTestimonials.validate().length-1, onTap: () {
                  _controller.nextPage(duration: _kDuration, curve: _kCurve);
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
