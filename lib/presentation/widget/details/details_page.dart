import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scroll_app/presentation/constants/app_constants.dart';
import 'package:flutter_scroll_app/presentation/bloc/details/details_cubit.dart';
import 'package:flutter_scroll_app/presentation/bloc/details/details_status.dart';
import 'package:flutter_scroll_app/presentation/widget/common/error_widget.dart';

@RoutePage()
class DetailsPage extends StatefulWidget {
  const DetailsPage({required this.objectNumber, super.key});

  final String objectNumber;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    context.read<DetailsCubit>().getObjectDetails(widget.objectNumber);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (context, state) {
          switch (state.status) {
            case DetailsStatus.initial:
            case DetailsStatus.loading:
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: CircularProgressIndicator()),
                ],
              );
            case DetailsStatus.loaded:
              return ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: AppConstants.webContentMaxWidth,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.network(
                          state.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(state.title),
                            const SizedBox(height: 40),
                            Text(state.description),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            case DetailsStatus.error:
              return const ErrorPageContent();
          }
        },
      ),
    );
  }
}
