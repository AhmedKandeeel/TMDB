import 'package:flutter/material.dart';
import 'package:tmbd/app_router.dart';

void main() {
  runApp(TMDB(appRouter: AppRouter(),));
}

class TMDB extends StatelessWidget {
  final AppRouter appRouter;

  const TMDB({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,      
    );
  }
}
