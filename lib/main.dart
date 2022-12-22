import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'routes/routes.dart';
import 'views/home_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Exchange App",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: Routes.instance.onGenerateRoute,
        initialRoute: "/home",
      ),
    );
  }
}
