import 'package:equatable/equatable.dart';
import 'package:flutter_scroll_app/presentation/bloc/details/details_status.dart';
import 'package:bloc/bloc.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(const DetailsState(status: DetailsStatus.initial));
}
