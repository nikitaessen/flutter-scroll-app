import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_scroll_app/data/exceptions/repository_exception.dart';
import 'package:flutter_scroll_app/domain/models/museum_item.dart';
import 'package:flutter_scroll_app/domain/use_case/museum_use_case.dart';

part 'overview_state.dart';

class OverviewCubit extends Cubit<OverviewState> {
  OverviewCubit({required this.museumUseCase}) : super(OverviewLoadingState()) {
    loadItems();
  }

  final MuseumUseCase museumUseCase;

  Future<void> loadItems() async {
    try {
      final data = await museumUseCase.execute();
      print(data);
    } on RepositoryException {
      emit(OverviewErrorState(errorMessage: 'Error when loading items. >_<'));
    } catch (ex) {
      // TODO(Nikita): log error
    }
  }
}
