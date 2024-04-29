import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scroll_app/domain/models/museum_item.dart';
import 'package:flutter_scroll_app/presentation/bloc/overview/overview_cubit.dart';
import 'package:flutter_scroll_app/presentation/bloc/overview/overview_status.dart';
import 'package:flutter_scroll_app/presentation/widget/error_widget.dart';
import 'package:flutter_scroll_app/presentation/widget/list_item.dart';

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

  final List<MuseumItem> items;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (items.isEmpty) {
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          );
        }

        return ListView.builder(
          controller: scrollController,
          itemBuilder: (context, index) {
            if (index == items.length) {
              return const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              );
            }

            return ListItem(
              title: items[index].title,
              imageUrl: items[index].imageUrl,
            );
          },
          itemCount: items.length + 1,
        );
      },
    );
  }
}
