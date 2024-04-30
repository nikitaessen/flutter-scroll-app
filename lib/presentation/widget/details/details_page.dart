import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scroll_app/presentation/app_constants.dart';
import 'package:flutter_scroll_app/presentation/bloc/details/details_cubit.dart';

@RoutePage()
class DetailsPage extends StatefulWidget {
  const DetailsPage({required this.objectNumber, super.key});

  final String objectNumber;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (context, state) {
          return ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: AppConstants.webContentMaxWidth,
            ),
            child: Column(
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
          );
        },
      ),
    );
  }
}
