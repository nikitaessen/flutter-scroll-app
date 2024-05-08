import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scroll_app/src/presentation/bloc/details/details_cubit.dart';
import 'package:flutter_scroll_app/src/presentation/bloc/details/details_status.dart';
import 'package:flutter_scroll_app/src/presentation/widget/common/error_widget.dart';
import 'package:transparent_image/transparent_image.dart';

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
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        const CircularProgressIndicator(),
                        FadeInImage.memoryNetwork(
                          height: 400,
                          placeholder: kTransparentImage,
                          image: state.imageUrl,
                          fit: BoxFit.contain, // Adjust the fit property here
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            state.description,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
