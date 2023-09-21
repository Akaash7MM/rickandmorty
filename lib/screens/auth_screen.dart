import 'package:flutter/material.dart';

import 'main_drawer.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  void _navigateIfAuthorized(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const MainDrawer()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("This is the Auth Screen"),
            ElevatedButton(
                onPressed: () => _navigateIfAuthorized(context),
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).colorScheme.surfaceVariant),
                child: const Text("Goto Characters/Favourite Screen"))
          ],
        ),
      ),
    );
  }
}
