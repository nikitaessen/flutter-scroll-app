import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scroll_app/features/overview/domain/entities/museum_object.dart';
import 'package:flutter_scroll_app/features/overview/presentation/bloc/overview_cubit.dart';
import 'package:flutter_scroll_app/features/overview/presentation/bloc/overview_status.dart';
import 'package:flutter_scroll_app/core/presentation/widgets/error_widget.dart';
import 'package:flutter_scroll_app/features/overview/presentation/widgets/list_item.dart';

@RoutePage()
class OverviewPage extends StatefulWidget {
  const OverviewPage({super.key});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage>
    with TickerProviderStateMixin {
  final _scrollController = ScrollController();

  @override
  void initState() {
    context.read<OverviewCubit>().getCollectionObjects();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<OverviewCubit>().getCollectionObjects();
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
              hasReachedLimit: state.hasReachedLimit,
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
    required this.hasReachedLimit,
    required this.items,
    required this.scrollController,
  });

  final bool hasReachedLimit;
  final List<MuseumObject> items;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade100,
        title: const Text(
          'Rijksmuseum',
        ),
        leading: const Icon(Icons.account_balance_outlined),
      ),
      backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
      body: items.isEmpty
          ? const _ProgressIndicatorItem()
          : ListView.builder(
              controller: scrollController,
              padding: const EdgeInsets.symmetric(vertical: 40),
              itemBuilder: (context, index) {
                if (index == items.length && !hasReachedLimit) {
                  return const _ProgressIndicatorItem();
                }

                final item = items[index];
                return Center(
                  child: ListItem(
                    objectNumber: item.objectNumber,
                    title: item.title,
                    imageUrl: item.imageUrl,
                    headerImageUrl: item.headerImageUrl,
                  ),
                );
              },
              itemCount: hasReachedLimit ? items.length : items.length + 1,
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
