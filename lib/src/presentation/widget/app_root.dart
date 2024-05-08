import 'package:flutter/material.dart';
import 'package:flutter_scroll_app/src/assets/assets.gen.dart';
import 'package:flutter_scroll_app/src/assets/fonts.gen.dart';
import 'package:flutter_scroll_app/src/presentation/injection_module.dart';
import 'package:flutter_scroll_app/src/presentation/bloc/details/details_cubit.dart';
import 'package:flutter_scroll_app/src/presentation/bloc/overview/overview_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scroll_app/src/presentation/scroll_app_router.dart';
import 'package:get_it/get_it.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OverviewCubit>(
          create: (_) => serviceLocator(),
        ),
        BlocProvider<DetailsCubit>(
          create: (_) => serviceLocator(),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          fontFamily: FontFamily.archivoBlack,
        ),
        routerConfig: GetIt.instance.get<ScrollAppRouter>().config(),
      ),
    );
  }
}
