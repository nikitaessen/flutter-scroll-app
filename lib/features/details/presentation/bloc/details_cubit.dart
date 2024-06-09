import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_scroll_app/features/details/domain/use_cases/museum_object_details_use_case.dart';
import 'package:flutter_scroll_app/features/details/presentation/bloc/details_status.dart';
import 'package:bloc/bloc.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit({required MuseumObjectDetailsUseCase museumUseCase})
      : _museumUseCase = museumUseCase,
        super(const DetailsState(status: DetailsStatus.initial));

  final MuseumObjectDetailsUseCase _museumUseCase;

  Future<void> getObjectDetails(String objectNumber) async {
    try {
      emit(const DetailsState(status: DetailsStatus.loading));
      
      final details = await _museumUseCase.execute(objectNumber: objectNumber);
      emit(
        DetailsState(
          status: DetailsStatus.loaded,
          title: details.title,
          description: details.description,
          imageUrl: details.imageUrl,
        ),
      );
    } catch (ex) {
      emit(const DetailsState(status: DetailsStatus.error));
      log('DetailsCubit exception: $ex');
    }
  }
}
