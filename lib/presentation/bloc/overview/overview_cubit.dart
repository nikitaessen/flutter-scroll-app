import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_scroll_app/data/exceptions/repository_exception.dart';
import 'package:flutter_scroll_app/domain/models/museum_item.dart';
import 'package:flutter_scroll_app/domain/use_case/museum_use_case.dart';
import 'package:flutter_scroll_app/presentation/bloc/overview/overview_status.dart';

part 'overview_state.dart';

class OverviewCubit extends Cubit<OverviewState> {
  OverviewCubit({required this.museumUseCase})
      : super(const OverviewState(status: OverviewStatus.initial));

  final MuseumUseCase museumUseCase;

  Future<void> loadItems() async {
    try {
      if (state.status == OverviewStatus.initial) {
        final fetchedItems = await museumUseCase.execute();
        return emit(
          OverviewState(
            status: OverviewStatus.loaded,
            museumItems: fetchedItems,
          ),
        );
      }

      final nextPage = state.pageNumber + 1;
      final fetchedItems = await museumUseCase.execute(
        pageNumber: nextPage,
      );
      emit(
        state.copyWith(
          status: OverviewStatus.loaded,
          museumItems: List.from(state.museumItems)..addAll(fetchedItems),
          pageNumber: nextPage,
        ),
      );
    } on RepositoryException {
      emit(const OverviewState(status: OverviewStatus.error));
    } catch (ex) {
      // TODO(Nikita): log error
    }
  }
}
