import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthcare_app_client/healthcare_app_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.

var client = Client(
  'http://${Platform.isAndroid ? "10.0.2.2" : "localhost"}:8080/',
  authenticationKeyManager: FlutterAuthenticationKeyManager(),
)..connectivityMonitor = FlutterConnectivityMonitor();

late SessionManager sessionManager;

void main() async {
  sessionManager = SessionManager(
    caller: client.modules.auth,
  );

  sessionManager.initialize();
  // sessionManager.a
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    sessionManager.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serverpod Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: sessionManager.isSignedIn ? const HomePage() : const SignInPage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: GestureDetector(
              onTap: () async {
                final patient = Patient(
                    name: sessionManager.signedInUser!.userName,
                    age: 12,
                    createdAt: DateTime.now(),
                    gender: "male",
                    userId: sessionManager.signedInUser!.id!,
                    weight: "12",
                    height: "12");
                final data = await client.patient.getPatient();

                print(data.length);
                print(data[0]?.name ?? "hjhjxjwxbhw");
                // // await client.example.hello("hi");
              },
              child: const Text(
                "Cick me",
              ))),
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
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
