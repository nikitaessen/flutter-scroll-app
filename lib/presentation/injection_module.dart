import 'package:flutter_scroll_app/presentation/injection_module.config.dart';
import 'package:flutter_scroll_app/presentation/bloc/details/details_cubit.dart';
import 'package:flutter_scroll_app/presentation/bloc/overview/overview_cubit.dart';
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
