import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_project/routes/app_routes.dart';
class RouteProject extends StatelessWidget {
  const RouteProject ({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(300, 800),
      builder: (context,state){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.intitlRoute,
          onGenerateRoute: AppRoutes.generateRoute,
        );
      },
    );
  }
}
