// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:excel/excel.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthcare_app_flutter/features/patient/pages/patient_home_page.dart';
import 'package:healthcare_app_flutter/routes/app_route.dart';
import 'package:healthcare_app_flutter/routes/route_guard.dart';
import 'package:healthcare_app_flutter/widgets/button_with_border.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'dart:developer' as dev;
import 'package:healthcare_app_client/healthcare_app_client.dart';

import 'dependency/app_dependency.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.

late Client client;

late SessionManager sessionManager;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  client = Client(
    'http://${Platform.isAndroid ? "10.0.2.2" : "localhost"}:8080/',
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();

  sessionManager = SessionManager(
    caller: client.modules.auth,
  );

  await sessionManager.initialize();
  // sessionManager.a
  runApp(
    ProviderScope(
      overrides: [
        AppDependency.clientProvider.overrideWithValue(client),
        AppDependency.sessionManagerProvider.overrideWithValue(sessionManager),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    sessionManager.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  Future addExcetFrom() async {
    ByteData data =
        await rootBundle.load("assets/Drug_Sample_WorldWideData_Org.xlsx");
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);

    for (var table in excel.tables.keys) {
      for (var i = 9; i < excel.tables[table]!.rows.length; i++) {
        if (excel.tables[table]!.rows[i][1]?.value != null) {
          await client.medicine.addMedicine(
            Medicine(
              idCode: excel.tables[table]!.rows[i][0]?.value,
              // category: excel.tables[table]!.rows[i][1]?.value.toString(),
              // subCategory: excel.tables[table]!.rows[i][2]?.value.toString(),
              image: excel.tables[table]!.rows[i][1]?.value.toString(),
              name: excel.tables[table]!.rows[i][2]?.value
                  .toString()
                  .toLowerCase(),
              manufactures: excel.tables[table]!.rows[i][3]?.value.toString(),
              medicineType: excel.tables[table]!.rows[i][5]?.value.toString(),
              packaging: excel.tables[table]!.rows[i][13]?.value.toString(),
              pack_info: excel.tables[table]!.rows[i][14]?.value.toString(),
              description: excel.tables[table]!.rows[i][9]?.value.toString(),
              introduction: excel.tables[table]!.rows[i][7]?.value.toString(),
              useOf: excel.tables[table]!.rows[i][25]?.value.toString(),
              benefits: excel.tables[table]!.rows[i][8]?.value.toString(),
              howToUse: excel.tables[table]!.rows[i][10]?.value.toString(),
              safetyAdvise: excel.tables[table]!.rows[i][11]?.value.toString(),
              ingredients: excel.tables[table]!.rows[i][4]?.value.toString(),
              manufactureAddress:
                  excel.tables[table]!.rows[i][33]?.value.toString(),
              countryOfOrigin:
                  excel.tables[table]!.rows[i][34]?.value.toString(),
              category: excel.tables[table]!.rows[i][23]?.value.toString(),
//OTC or Prescription
              // idCode: excel.tables[table]!.rows[i][0]?.value,
              // category: excel.tables[table]!.rows[i][1]?.value.toString(),
              // subCategory: excel.tables[table]!.rows[i][2]?.value.toString(),
              // image: excel.tables[table]!.rows[i][4]?.value.toString(),
              // name: excel.tables[table]!.rows[i][5]?.value
              //     .toString()
              //     .toLowerCase(),
              // manufactures: excel.tables[table]!.rows[i][6]?.value.toString(),
              // packaging: excel.tables[table]!.rows[i][7]?.value.toString(),
              // pack_info: excel.tables[table]!.rows[i][8]?.value.toString(),
              // description: excel.tables[table]!.rows[i][14]?.value.toString(),
              // introduction:
              //     excel.tables[table]!.rows[i][17]?.value.toString(),
              // useOf: excel.tables[table]!.rows[i][18]?.value.toString(),
              // benefits: excel.tables[table]!.rows[i][19]?.value.toString(),
              // howToUse: excel.tables[table]!.rows[i][21]?.value.toString(),
              // safetyAdvise:
              //     excel.tables[table]!.rows[i][23]?.value.toString(),
              // ingredients: excel.tables[table]!.rows[i][25]?.value.toString(),
              // manufactureAddress:
              //     excel.tables[table]!.rows[i][27]?.value.toString(),
              // countryOfOrigin:
              //     excel.tables[table]!.rows[i][29]?.value.toString(),
              // medicineType: excel.tables[table]!.rows[i][3]?.value.toString()
              // // images: [],
              // name: excel.tables[table]!.rows[i][1]?.value
              //         .toString()
              //         .toLowerCase() ??
              //     '',
              // therapeuticArea:
              //     excel.tables[table]!.rows[i][2]?.value.toString(),
              // activeSubstance:
              //     excel.tables[table]!.rows[i][0]?.value.toString(),
              // atcCode: excel.tables[table]!.rows[i][8]?.value.toString(),
              // generic: excel.tables[table]!.rows[i][10]?.value.toString(),
              // condition: excel.tables[table]!.rows[i][24]?.value.toString(),
              // description: excel.tables[table]!.rows[i][29]?.value.toString(),
            ),
          );
          dev.log("index : $i");
        }

        await Future.delayed(const Duration(milliseconds: 500));
      }
    }
  }

  @override
  void didChangeDependencies() async {
    // await addExcetFrom();
    /* Your blah blah code here */

    // ByteData data = await rootBundle.load(
    //     "assets/Medicines_output_european_public_assessment_reports.xlsx");
    // var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    // var excel = Excel.decodeBytes(bytes);

    // for (var table in excel.tables.keys) {
    //   for (var i = 9; i < excel.tables[table]!.rows.length; i++) {
    //     // print(excel.tables[table]!.rows[i][1]?.value);
    //     // print(excel.tables[table]!.rows[i][2]?.value);

    //     // print(excel.tables[table]!.rows[i][4]?.value);
    //     // print(excel.tables[table]!.rows[i][8]?.value);
    //     // print(excel.tables[table]!.rows[i][10]?.value);
    //     // print(excel.tables[table]!.rows[i][24]?.value);
    //     // print(excel.tables[table]!.rows[i][25]?.value);
    //     // print(excel.tables[table]!.rows[i][29]?.value);

    // if (i < 200) {
    // if (excel.tables[table]!.rows[i][1]?.value != null) {
    //   await client.medicine.addMedicine(
    //     Medicine(
    //       images: [],
    //       name: excel.tables[table]!.rows[i][1]?.value.toString().toLowerCase() ?? '',
    //       therapeuticArea:
    //           excel.tables[table]!.rows[i][2]?.value.toString(),
    //       activeSubstance:
    //           excel.tables[table]!.rows[i][4]?.value.toString(),
    //       atcCode: excel.tables[table]!.rows[i][8]?.value.toString(),
    //       generic: excel.tables[table]!.rows[i][10]?.value.toString(),
    //       condition: excel.tables[table]!.rows[i][24]?.value.toString(),
    //       description: excel.tables[table]!.rows[i][29]?.value.toString(),
    //     ),
    //   );
    // }

    // await Future.delayed(const Duration(milliseconds: 500));
    // }
    // }
    //   // for (var row in excel.tables[table]!.rows) {
    //   //   print(row[1]?.value);
    //   //   print(row[3]?.value);
    //   //   print(row[8]?.value);
    //   //   print(row[9]?.value);
    //   // }
    // }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final _appRouter = ref.watch(AppDependency.routeProvider);

    return PlatformApp.router(
      localizationsDelegates: <LocalizationsDelegate<dynamic>>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      // routeInformationParser: _appRouter.,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      title: 'Serverpod Demo',
      material: (context, platform) => MaterialAppRouterData(
        themeMode: ThemeMode.dark,
        theme: FlexThemeData.light(
          scheme: FlexScheme.tealM3,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
          blendLevel: 9,
          tabBarStyle: null,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 10,
            blendOnColors: false,
            useM2StyleDividerInM3: true,
          ),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          useMaterial3: true,
          swapLegacyOnMaterial3: true,
          // To use the playground font, add GoogleFonts package and uncomment
          // fontFamily: GoogleFonts.notoSans().fontFamily,
        ),
        darkTheme: FlexThemeData.dark(
          scheme: FlexScheme.tealM3,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
          blendLevel: 15,
          tabBarStyle: null,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 20,
            useM2StyleDividerInM3: true,
          ),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          useMaterial3: true,
          swapLegacyOnMaterial3: true,
          // To use the Playground font, add GoogleFonts package and uncomment
          // fontFamily: GoogleFonts.notoSans().fontFamily,
        ),
      ),
      cupertino: (context, platform) => CupertinoAppRouterData(
          theme: CupertinoThemeData(
        primaryColor: FlexColor.tealM3DarkPrimary,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: FlexColor.darkScaffoldBackground,
      )),
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,

      // home: sessionManager.isSignedIn ? const HomePage() : const SignInPage(),
    );
  }
}

Future<void> checkUser(int userId, Ref ref) async {
  final router = ref.watch(AppDependency.routeProvider);

  if (await client.patient.currentPatient() == null) {
    if (await client.doctor.currentDoctor() == null) {
      router.push(const SetupRoute());
    } else {
      // router.push(const HomeRoute());
    }
  } else {
    // router.push(const HomeRoute());
  }
}
