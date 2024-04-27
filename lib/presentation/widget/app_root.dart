import 'package:flutter/material.dart';
import 'package:flutter_scroll_app/injection_module.dart';
import 'package:flutter_scroll_app/presentation/bloc/overview/overview_cubit.dart';
import 'package:flutter_scroll_app/presentation/widget/overview_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OverviewCubit>(
          create: (_) => serviceLocator(),
        ),
      ],
      child: const MaterialApp(
        home: OverviewPage(),
      ),
    );
  }
}
