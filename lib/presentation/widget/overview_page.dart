import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scroll_app/presentation/bloc/overview/overview_cubit.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({super.key});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<OverviewCubit, OverviewState>(
          builder: (context, state) {
            if (state is OverviewLoadingState) {
              return _LoadingIndicatorOverlay(controller: controller);
            }

            if (state is OverviewLoadedState) {
              return const _OverviewPageContent();
            }

            return _ErrorPageContent(
                errorMessage: (state as OverviewErrorState).errorMessage);
          },
        ),
      ],
    );
  }
}

class _LoadingIndicatorOverlay extends StatelessWidget {
  const _LoadingIndicatorOverlay({required this.controller});

  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        value: controller.value,
        semanticsLabel: 'Loading indicator',
      ),
    );
  }
}

class _ErrorPageContent extends StatelessWidget {
  const _ErrorPageContent({required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorMessage),
    );
  }
}

class _OverviewPageContent extends StatelessWidget {
  const _OverviewPageContent();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
