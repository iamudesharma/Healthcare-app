import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

import '../main.dart';
import '../routes/app_route.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    // await client.chemists.getChemistsGeo();

    super.didChangeDependencies();
  }

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
            AutoRouter.of(context).push(const SetupRoute());
          },
        ),
      ),
    );
  }
}