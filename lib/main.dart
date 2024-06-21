import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:texi_website/screen/PrivacyPolicyScreen.dart';
import 'package:texi_website/screen/TermAndConditionScreen.dart';
import 'package:url_strategy/url_strategy.dart';
import '../screen/DashboardScreen.dart';
import '../utils/extension/common.dart';
import '../utils/extension/int_extensions.dart';
import '../utils/extension/string_extensions.dart';
import 'dart:html';
import 'model/BuilderResponse.dart';

BuilderResponse builderResponse = BuilderResponse();

PageRouteAnimation? pageRouteAnimationGlobal;
Duration pageRouteTransitionDurationGlobal = 400.milliseconds;
final navigatorKey = GlobalKey<NavigatorState>();

get getContext => navigatorKey.currentState?.overlay?.context;

Future<String> loadBuilderData() async {
  return await rootBundle.loadString('assets/builder.json');
}

Future<BuilderResponse> loadContent() async {
  String jsonString = await loadBuilderData();
  final jsonResponse = json.decode(jsonString);
  return BuilderResponse.fromJson(jsonResponse);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  builderResponse = await loadContent();

  setPathUrlStrategy();

  runApp(MyApp());
  handleAppReload();
}

void handleAppReload() {
  window.onMessage.listen((event) {
    if (event.data['type'] == 'refresh') {
      showDialog(
        context: navigatorKey.currentContext!,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Confirm Refresh'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('This action will reload the page.'),
                SizedBox(height: 10),
                Text(
                  'Are you sure you want to proceed?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Reload the entire app with hash-based URL
                  final String baseUrl = window.location.href.split('#')[0];
                  window.location.assign('$baseUrl#/dashboard');
                  window.location.reload();
                },
                child: Text('Yes'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Cancel the refresh action
                },
                child: Text('No'),
              ),
            ],
          );
        },
      );
    }
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   builder: (context, child) {
    //     return ScrollConfiguration(
    //       behavior: ScrollConfiguration.of(context).copyWith(
    //         dragDevices: {
    //           PointerDeviceKind.mouse,
    //           PointerDeviceKind.touch,
    //         },
    //       ),
    //       child: child!,
    //     );
    //   },
    //   navigatorKey: navigatorKey,
    //   title: builderResponse.appName.validate(),
    //   theme: ThemeData(
    //     fontFamily: GoogleFonts.poppins().fontFamily,
    //     visualDensity: VisualDensity.adaptivePlatformDensity,
    //   ),
    //   // initialRoute: DashboardScreen.route,
    //   // routes: {
    //   //   DashboardScreen.route: (context) => DashboardScreen(),
    //   //   PrivacyPolicyScreen.route: (context) => PrivacyPolicyScreen(),
    //   //   TermAndConditionScreen.route: (context) => TermAndConditionScreen(),
    //   // },
    //   home: DashboardScreen(),
    // );
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
            },
          ),
          child: child!,
        );
      },
      title: builderResponse.appName.validate(),
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerDelegate: FluroRouterDelegate(),
      routeInformationParser: FluroRouteInformationParser(),
    );
  }
}

class FluroRouterDelegate extends RouterDelegate<String>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<String> {
  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: (route, result) {
        return true;
      },
      pages: [
        MaterialPage(child: DashboardScreen(), key: ValueKey('dashboard')),
        // Add more MaterialPage widgets for other routes as needed
      ],
    );
  }

  @override
  Future<void> setNewRoutePath(String configuration) async {}
}

class FluroRouteInformationParser extends RouteInformationParser<String> {
  @override
  Future<String> parseRouteInformation(
      RouteInformation routeInformation) async {
    return routeInformation.location ?? '/';
  }

  @override
  RouteInformation restoreRouteInformation(String configuration) {
    return RouteInformation(location: configuration);
  }
}
