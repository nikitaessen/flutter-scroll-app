import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_scroll_app/src/domain/exceptions/repository_exception.dart';
import 'package:flutter_scroll_app/src/domain/models/museum_object.dart';
import 'package:flutter_scroll_app/src/domain/use_case/museum_collection_use_case.dart';
import 'package:flutter_scroll_app/src/presentation/bloc/overview/overview_status.dart';

part 'overview_state.dart';

class OverviewCubit extends Cubit<OverviewState> {
  OverviewCubit({required MuseumCollectionUseCase museumUseCase})
      : _museumUseCase = museumUseCase,
        super(const OverviewState(status: OverviewStatus.initial));

  final MuseumCollectionUseCase _museumUseCase;

  Future<void> getCollectionObjects() async {
    try {
      if (state.hasReachedLimit) {
        return;
      }
      
      if (state.status == OverviewStatus.initial) {
        final museumCollection = await _museumUseCase.execute();
        final museumItems = museumCollection.items;
        return emit(
          OverviewState(
            status: OverviewStatus.loaded,
            museumItems: museumCollection.items,
            hasReachedLimit: museumItems.length >= museumCollection.count,
          ),
        );
      }

      final nextPage = state.pageNumber + 1;
      final museumCollection = await _museumUseCase.execute(
        pageNumber: nextPage,
      );
      final museumItems = List<MuseumObject>.from(state.museumItems)
        ..addAll(museumCollection.items);
      emit(
        state.copyWith(
          status: OverviewStatus.loaded,
          museumItems: museumItems,
          pageNumber: nextPage,
          hasReachedLimit: museumItems.length >= museumCollection.count,
        ),
      );
    } on RepositoryException {
      emit(const OverviewState(status: OverviewStatus.error));
    } catch (ex) {
      emit(const OverviewState(status: OverviewStatus.error));
      // TODO(Nikita): log error
    }
  }
}
