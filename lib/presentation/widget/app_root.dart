import 'package:flutter/material.dart';
import 'package:flutter_scroll_app/injection_module.dart';
import 'package:flutter_scroll_app/presentation/bloc/overview/overview_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scroll_app/shared/scroll_app_router.dart';
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
      ],
      child: MaterialApp.router(
        routerConfig: GetIt.instance.get<ScrollAppRouter>().config(),
        // home: Scaffold(
        //   appBar: AppBar(
        //     title: const Text('Sample page title'),
        //   ),
        //   body: const OverviewPage(),
        // ),
      ),
    );
  }
}
