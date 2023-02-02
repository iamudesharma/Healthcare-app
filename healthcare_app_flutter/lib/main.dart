// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:auto_route/auto_route.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthcare_app_flutter/routes/app_route.dart';
import 'package:healthcare_app_flutter/routes/route_guard.dart';
import 'package:healthcare_app_flutter/widgets/button_with_border.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

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
    'http://localhost:8080/',
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
      child: MyApp(),
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

  @override
  void didChangeDependencies() async {
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

    //     if (i < 200) {
    //       if (excel.tables[table]!.rows[i][1]?.value != null) {
    //         await client.medicine.addMedicine(
    //           Medicine(
    //             images: [],
    //             name: excel.tables[table]!.rows[i][1]?.value.toString() ?? '',
    //             therapeuticArea:
    //                 excel.tables[table]!.rows[i][2]?.value.toString(),
    //             activeSubstance:
    //                 excel.tables[table]!.rows[i][4]?.value.toString(),
    //             atcCode: excel.tables[table]!.rows[i][8]?.value.toString(),
    //             generic: excel.tables[table]!.rows[i][10]?.value.toString(),
    //             condition: excel.tables[table]!.rows[i][24]?.value.toString(),
    //             description: excel.tables[table]!.rows[i][29]?.value.toString(),
    //           ),
    //         );
    //       }

    //       await Future.delayed(const Duration(milliseconds: 500));
    //     }
    //   }
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

    return MaterialApp.router(
      // routeInformationParser: _appRouter.,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      title: 'Serverpod Demo',
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
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,

      // home: sessionManager.isSignedIn ? const HomePage() : const SignInPage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FutureBuilder<List<Medicine?>>(
              future: client.medicine.getMedicines(),
              builder: (context, snap) {
                if (snap.hasData) {
                  return ListView.builder(
                    itemCount: snap.data!.length,
                    itemBuilder: (context, index) {
                      return Text(snap.data![index]!.name);
                    },
                  );
                }
                return GestureDetector(
                    onTap: () async {},
                    child: const Text(
                      "Home Page",
                    ));
              })),
    );
  }
}

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in'),
      ),
      body: Center(
        child: SignInWithEmailButton(
          caller: sessionManager.caller,
          onSignedIn: () {
            AutoRouter.of(context).push(SetupRoute());
          },
        ),
      ),
    );
  }
}

class SetupPage extends StatefulWidget {
  const SetupPage({super.key});

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  int? _selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              "Choose One of the following",
              style: Theme.of(context).textTheme.headlineSmall,
            )),
            const SizedBox(
              height: 50,
            ),
            const SizedBox(
              height: 10,
            ),
            ...List.generate(3, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 7.0),
                child: ButtonWithBorder(
                  borderColor: index == _selected
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).textTheme.headlineSmall!.color!,
                  onTap: () {
                    setState(() {
                      _selected = index;
                    });
                  },
                  title: _titele[index],
                ),
              );
            }),
            const SizedBox(
              height: 50,
            ),
            _selected == null
                ? const SizedBox.shrink()
                : ElevatedButton(
                    child: const Text("Save"),
                    onPressed: () {
                      AutoRouter.of(context).push(const HomeRoute());
                    },
                  )
          ],
        ),
      ),
    );
  }

  final List _titele = [
    "Medical Shop",
    "Patient",
    "Doctor",
  ];
}

void CheckUser(int userId, BuildContext context) async {
  final router = AutoRouter.of(context);
  if (await client.patient.currentPatient() == null) {
    if (await client.doctor.currentDoctor() == null) {
      // if (await client.m.currentMedicalShop()==null) {

      //   AutoRouter.of(context).push(const SetupRoute());
    } else {
      router.push(const HomeRoute());
    }
  } else {
    router.push(const HomeRoute());
  }
}
