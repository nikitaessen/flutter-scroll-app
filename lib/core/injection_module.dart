import 'package:flutter_scroll_app/core/injection_module.config.dart';
import 'package:flutter_scroll_app/features/details/presentation/bloc/details_cubit.dart';
import 'package:flutter_scroll_app/features/overview/presentation/bloc/overview_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

GetIt serviceLocator = GetIt.instance;

@InjectableInit(
  initializerName: 'initialize',
  preferRelativeImports: false,
  asExtension: true,
)
void registerDependencies() {
  serviceLocator.initialize();
  _registerCubits();
}

void _registerCubits() {
  serviceLocator
    ..registerFactory<OverviewCubit>(
      () => OverviewCubit(museumUseCase: serviceLocator()),
    )
    ..registerFactory(
      () => DetailsCubit(museumUseCase: serviceLocator()),
    );
}
