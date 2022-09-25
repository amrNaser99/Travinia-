import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travinia/core/app/bloc/app_cubit.dart';
import 'package:travinia/core/app/bloc/app_state.dart';
import 'package:travinia/core/di/injection.dart';
import 'package:travinia/core/utils/app_themes.dart';
import 'package:travinia/core/utils/routes.dart';
import 'package:travinia/presentation/auth/bloc/auth_cubit.dart';
import 'package:travinia/presentation/explore/bloc/explore_cubit.dart';
import 'package:travinia/presentation/home/home_screen.dart';
import 'package:travinia/presentation/main/main_screen.dart';

class TraviniaApp extends StatelessWidget {
  const TraviniaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 667),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<AppCubit>(
                create: (context) => sl<AppCubit>(),
              ),
              BlocProvider<AuthCubit>(
                create: (context) => sl<AuthCubit>(),
              ),
              BlocProvider<ExploreCubit>(
                create: (context) => sl<ExploreCubit>(),
              ),
            ],
            child: BlocBuilder<AppCubit, AppStates>(
              builder: (context, state) {
                return MaterialApp(
                  title: 'Travinia',
                  debugShowCheckedModeBanner: false,
                  // theme: AppThemes.lightTheme,
                  theme: AppThemes.darkTheme,
                  routes: Routes.routes,

                  // initialRoute: Routes.home,
                  home: MainScreen(),

                  // initialRoute: Routes.onBoarding,
                );
              },
            ),
          );
        });
  }
}
