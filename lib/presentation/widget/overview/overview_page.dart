import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scroll_app/domain/models/museum_object.dart';
import 'package:flutter_scroll_app/presentation/bloc/overview/overview_cubit.dart';
import 'package:flutter_scroll_app/presentation/bloc/overview/overview_status.dart';
import 'package:flutter_scroll_app/presentation/widget/overview/error_widget.dart';
import 'package:flutter_scroll_app/presentation/widget/overview/list_item.dart';

@RoutePage()
class OverviewPage extends StatefulWidget {
  const OverviewPage({super.key});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage>
    with TickerProviderStateMixin {
  late AnimationController controller;
  final _scrollController = ScrollController();

  @override
  void initState() {
    context.read<OverviewCubit>().loadItems();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(
        () {
          setState(() {});
        },
      );
    controller.repeat(reverse: true);
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<OverviewCubit>().loadItems();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OverviewCubit, OverviewState>(
      builder: (context, state) {
        switch (state.status) {
          case OverviewStatus.initial:
          case OverviewStatus.loaded:
            return _OverviewPageContent(
              items: state.museumItems,
              scrollController: _scrollController,
            );
          case OverviewStatus.error:
            return const ErrorPageContent();
        }
      },
    );
  }
}

class _OverviewPageContent extends StatelessWidget {
  const _OverviewPageContent({
    required this.items,
    required this.scrollController,
  });

  final List<MuseumObject> items;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample page title'),
      ),
      body: Builder(
        builder: (context) {
          if (items.isEmpty) {
            const _ProgressIndicatorItem();
          }

          return ListView.builder(
            controller: scrollController,
            itemBuilder: (context, index) {
              if (index == items.length) {
                return const _ProgressIndicatorItem();
              }

              final item = items[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListItem(
                  objectNumber: item.objectNumber,
                  title: item.title,
                  imageUrl: item.imageUrl,
                  headerImageUrl: item.headerImageUrl,
                ),
              );
            },
            itemCount: items.length + 1,
          );
        },
      ),
    );
  }
}

class _ProgressIndicatorItem extends StatelessWidget {
  const _ProgressIndicatorItem();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
