import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/auth.dart';
import 'package:shop/view/products_overview_screen.dart';

import 'auth_screen.dart';

class AuthOrHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);
    return FutureBuilder(
      future: auth.tryAutoLogin(),
      // ignore: missing_return
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.error != null) {
          Center(
            child: Text('Ocorreu um erro!'),
          );
        } else {
          return auth.isAuth ? ProductOverviewScreen() : AuthScreen();
        }
      },
    );
  }
}
