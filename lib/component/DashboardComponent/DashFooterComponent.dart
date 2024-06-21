import 'package:flutter/material.dart';
import '../../main.dart';
import '../../screen/PrivacyPolicyScreen.dart';
import '../../utils/extension/context_extensions.dart';
import '../../utils/extension/int_extensions.dart';
import '../../utils/extension/string_extensions.dart';
import '../../utils/extension/widget_extensions.dart';

import '../../screen/TermAndConditionScreen.dart';
import '../../utils/Common.dart';
import '../../utils/Images.dart';
import '../../utils/extension/text_styles.dart';

class DashFooterComponent extends StatefulWidget {
  @override
  DashFooterComponentState createState() => DashFooterComponentState();
}

class DashFooterComponentState extends State<DashFooterComponent> {
  bool isMore = false;

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

  TextStyle valueTextStyle() {
    return primaryTextStyle(color: Colors.grey, size: 14, height: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            footer_image,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              vertical: 70, horizontal: mCommonPadding(context)),
          color: Colors.black87,
          width: context.width(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Wrap(
                spacing: 16,
                runSpacing: 30,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('About',
                            style: boldTextStyle(color: Colors.white)),
                        SizedBox(height: 16),
                        if (builderResponse.siteDescription
                            .validate()
                            .isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${builderResponse.siteDescription}',
                                  style: valueTextStyle(),
                                  textAlign: TextAlign.start,
                                  maxLines: isMore ? null : 5),
                              /*16.height,
                              GestureDetector(
                                onTap: () {
                                  isMore = !isMore;
                                  setState(() {});
                                },
                                child: Text(isMore ? 'READ  LESS' : 'READ  MORE', style: primaryTextStyle(size: 10, color: Colors.white)),
                              )*/
                            ],
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Links',
                            style: boldTextStyle(color: Colors.white)),
                        SizedBox(height: 16),
                        Text('Help And Support', style: valueTextStyle())
                            .onTap(() {
                              commonLaunchUrl(
                                  builderResponse.helpAndSupportUrl.validate());
                            })
                            .paddingBottom(8)
                            .visible(builderResponse.helpAndSupportUrl
                                .validate()
                                .isNotEmpty),
                        Text('Privacy Policy', style: valueTextStyle())
                            .onTap(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PrivacyPolicyScreen(),
                            ),
                          );
                        }).paddingBottom(8),
                        Text('Terms and conditions', style: valueTextStyle())
                            .onTap(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TermAndConditionScreen(),
                            ),
                          );
                        }).paddingBottom(8),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 220,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Contact',
                            style: boldTextStyle(color: Colors.white)),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Image.asset(ic_email,
                                fit: BoxFit.cover,
                                height: 20,
                                width: 20,
                                color: Colors.white),
                            SizedBox(width: 12),
                            Text(builderResponse.contactEmail.validate(),
                                    style: valueTextStyle())
                                .expand(),
                          ],
                        ).paddingBottom(8).visible(
                            builderResponse.contactEmail.validate().isNotEmpty),
                        Row(
                          children: [
                            Icon(Icons.call, color: Colors.white, size: 20),
                            SizedBox(width: 12),
                            Text(builderResponse.contactNumber.validate(),
                                    style: valueTextStyle())
                                .expand(),
                          ],
                        ).paddingBottom(8).visible(builderResponse.contactNumber
                            .validate()
                            .isNotEmpty),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        if (builderResponse.twitterUrl.validate().isNotEmpty)
                          Image.asset(ic_twitter,
                                  fit: BoxFit.cover,
                                  height: 30,
                                  width: 30,
                                  color: Colors.white)
                              .onTap(() {
                            commonLaunchUrl(
                                builderResponse.twitterUrl.validate());
                          }),
                        if (builderResponse.facebookUrl.validate().isNotEmpty)
                          Image.asset(ic_faceBook,
                                  fit: BoxFit.cover,
                                  height: 30,
                                  width: 30,
                                  color: Colors.white)
                              .onTap(() {
                            commonLaunchUrl(
                                builderResponse.facebookUrl.validate());
                          }),
                        if (builderResponse.instagramUrl.validate().isNotEmpty)
                          Image.asset(ic_instagram,
                                  fit: BoxFit.cover,
                                  height: 30,
                                  width: 30,
                                  color: Colors.white)
                              .onTap(() {
                            commonLaunchUrl(
                                builderResponse.instagramUrl.validate());
                          }),
                        if (builderResponse.linkedInUrl.validate().isNotEmpty)
                          Image.asset(ic_linkedIn,
                                  fit: BoxFit.cover,
                                  height: 30,
                                  width: 30,
                                  color: Colors.white)
                              .onTap(() {
                            commonLaunchUrl(
                                builderResponse.linkedInUrl.validate());
                          }),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Divider(color: Colors.white24),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(app_logo_white,
                          height: 75,
                          width: 230,
                          fit: BoxFit.cover,
                          color: Colors.white),
                      SizedBox(width: 16),
                      // Text(
                      //   builderResponse.appName.validate(),
                      //   style: boldTextStyle(color: Colors.white),
                      // ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Terms of Use',
                              style:
                                  boldTextStyle(color: Colors.grey, size: 12))
                          .onTap(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TermAndConditionScreen(),
                          ),
                        );
                      }),
                      SizedBox(width: 16),
                      Text('Privacy Policy',
                              style:
                                  boldTextStyle(color: Colors.grey, size: 12))
                          .onTap(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PrivacyPolicyScreen(),
                          ),
                        );
                      })
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(builderResponse.copyrightText.validate(),
                      style: primaryTextStyle(color: Colors.grey, size: 12))
                  .center(),
            ],
          ),
        ),
      ],
    );
  }
}
