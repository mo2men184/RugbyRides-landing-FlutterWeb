import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:texi_website/utils/extension/string_extensions.dart';
import '../main.dart';
import '../component/DashboardComponent/DashHeaderComponent.dart';
import '../utils/Common.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  static const String route = '/privacyPolicy';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 100),
        child: DashHeaderComponent(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: mCommonPadding(context),vertical: 16),
        child: HtmlWidget(builderResponse.privacyPolicy.validate()),
      ),
    );
  }
}