import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/parser.dart';
import '../utils/extension/loader_widget.dart';
import '../utils/extension/string_extensions.dart';
import '../utils/extension/widget_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/extension/context_extensions.dart';
import '../main.dart';
import 'Colors.dart';
import 'Images.dart';
import 'ResponsiveWidget.dart';
import 'extension/common.dart';
import 'extension/decorations.dart';

double mCommonPadding(BuildContext context) {
  return ResponsiveWidget.isSmallScreen(context) ? 16 : context.width() * 0.125;
}

double mCommonCardPadding(BuildContext context) {
  return ResponsiveWidget.isSmallScreen(context) ? 16 : 24;
}

int largeTextSize(BuildContext context) {
  return ResponsiveWidget.isSmallScreen(context) ? 35 : 60;
}

Widget dividerImageWidget() {
  //return Positioned(bottom: 0, left: 0, right: 0, child: Image.asset(divider_image, fit: BoxFit.cover, color: Colors.white));
  return Image.asset(divider_image, fit: BoxFit.cover);
}

String parseHtmlString(String? htmlString) {
  return parse(parse(htmlString).body!.text).documentElement!.text;
}

Widget customTextWidget({required String text, bool isWhiteText = false}) {
  final double largeTextSize = 24.0; // Define your desired text size

  return Stack(
    children: <Widget>[
      Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: largeTextSize,
          letterSpacing: 2,
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontWeight: FontWeight.bold,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 3
            ..color = isWhiteText
                ? Colors.orange.withOpacity(0.2)
                : Colors.orange.withOpacity(0.2), // <-- Border color
        ),
      ),
      Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: largeTextSize,
          letterSpacing: 2,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.poppins().fontFamily,
          color: isWhiteText
              ? Colors.black38
              : Colors.orange.withOpacity(0.1), // <-- Inner color
        ),
      ),
      Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: largeTextSize,
          letterSpacing: 2,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.poppins().fontFamily,
          color: isWhiteText ? Colors.white : Colors.black, // <-- Inner color
        ),
      ),
    ],
  ).paddingAll(2);
}

Widget commonCachedNetworkImage(String? url,
    {double? height,
    double? width,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    bool usePlaceholderIfUrlEmpty = true,
    double? radius,
    bool isCar = false}) {
  if (url != null && url.isEmpty) {
    return placeHolderWidget(
        height: height,
        width: width,
        fit: fit,
        alignment: alignment,
        radius: radius,
        isCar: isCar);
  } else if (url.validate().startsWith('http')) {
    return CachedNetworkImage(
      imageUrl: url!,
      height: height,
      width: width,
      fit: fit,
      alignment: alignment as Alignment? ?? Alignment.center,
      errorWidget: (_, s, d) {
        return placeHolderWidget(
            height: height,
            width: width,
            fit: fit,
            alignment: alignment,
            radius: radius,
            isCar: isCar);
      },
      placeholder: (_, s) {
        if (!usePlaceholderIfUrlEmpty) return SizedBox();
        return placeHolderWidget(
            height: height,
            width: width,
            fit: fit,
            alignment: alignment,
            radius: radius,
            isCar: isCar);
      },
    );
  } else {
    return Image.network(url!,
        height: height,
        width: width,
        fit: fit,
        alignment: alignment ?? Alignment.center);
  }
}

Widget placeHolderWidget(
    {double? height,
    double? width,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    double? radius,
    bool isCar = false}) {
  return Image.asset(isCar ? taxi_image : 'images/placeholder.jpg',
      height: height,
      width: width,
      fit: fit ?? BoxFit.cover,
      alignment: alignment ?? Alignment.center);
}

Widget loaderWidget() {
  return Loader(
    color: primaryColor,
    valueColor: AlwaysStoppedAnimation(Colors.white),
  );
}

Widget leftIconWidget(BuildContext context,
    {required int selectedIndex, Function()? onTap}) {
  return ResponsiveWidget.isSmallScreen(context)
      ? GestureDetector(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: radius(4)),
            padding: EdgeInsets.all(4),
            child: Icon(Icons.arrow_back_ios_new,
                size: 24,
                color: selectedIndex > 0 ? Colors.black : Colors.black12),
          ),
          onTap: onTap,
        ).paddingSymmetric(horizontal: 16)
      : Container(
          width: context.width() * 0.125,
          alignment: Alignment.centerRight,
          child: GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: radius(4)),
              padding: EdgeInsets.all(4),
              child: Icon(Icons.arrow_back_ios_new,
                  size: 24,
                  color: selectedIndex > 0 ? Colors.black : Colors.black12),
            ),
            onTap: onTap,
          ).paddingRight(30),
        );
}

Widget rightIconWidget(BuildContext context,
    {required int selectedIndex, required int lastIndex, Function()? onTap}) {
  return ResponsiveWidget.isSmallScreen(context)
      ? GestureDetector(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: radius(4)),
            padding: EdgeInsets.all(4),
            child: Icon(Icons.arrow_forward_ios_outlined,
                size: 24,
                color: selectedIndex < lastIndex
                    ? Colors.black87
                    : Colors.black12),
          ),
          onTap: onTap,
        ).paddingSymmetric(horizontal: 16)
      : Container(
          width: context.width() * 0.125,
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: radius(4)),
              padding: EdgeInsets.all(4),
              child: Icon(Icons.arrow_forward_ios_outlined,
                  size: 24,
                  color: selectedIndex < lastIndex
                      ? Colors.black87
                      : Colors.black12),
            ),
            onTap: onTap,
          ).paddingLeft(30),
        );
}

Future<void> commonLaunchUrl(String url, {bool forceWebView = false}) async {
  log(url);
  await launchUrl(Uri.parse(url)).catchError((e) {
    log(e);
    toast('Invalid URL: $url');
  });
}
