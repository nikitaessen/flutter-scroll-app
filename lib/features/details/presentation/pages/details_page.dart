import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scroll_app/core/presentation/widgets/image_with_progress.dart';
import 'package:flutter_scroll_app/features/details/presentation/bloc/details_cubit.dart';
import 'package:flutter_scroll_app/features/details/presentation/bloc/details_status.dart';
import 'package:flutter_scroll_app/core/presentation/widgets/error_widget.dart';

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
      backgroundColor: Colors.amber.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade100,
        title: const Text('Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.router.maybePop();
          },
        ),
      ),
      body: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (context, state) {
          switch (state.status) {
            case DetailsStatus.initial:
            case DetailsStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case DetailsStatus.loaded:
              return LoadedDetailsContent(
                title: state.title,
                description: state.description,
                imageUrl: state.imageUrl,
              );
            case DetailsStatus.error:
              return const ErrorPageContent();
          }
        },
      ),
    );
  }
}

class LoadedDetailsContent extends StatelessWidget {
  const LoadedDetailsContent({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  final String imageUrl;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ImageWithProgress(
          imageUrl: imageUrl,
          height: 400,
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          description,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
