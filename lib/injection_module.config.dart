// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_scroll_app/data/api/museum_api_service.dart' as _i4;
import 'package:flutter_scroll_app/data/api/museum_api_service_impl.dart'
    as _i5;
import 'package:flutter_scroll_app/data/repository/museum_repository_impl.dart'
    as _i7;
import 'package:flutter_scroll_app/domain/mappers/museum_items_mapper.dart'
    as _i3;
import 'package:flutter_scroll_app/domain/repository/museum_repository.dart'
    as _i6;
import 'package:flutter_scroll_app/domain/use_case/museum_use_case.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt initialize({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.MuseumItemsMapper>(() => _i3.MuseumItemsMapper());
    gh.factory<_i4.MuseumApiService>(() => _i5.MuseumApiServiceImpl());
    gh.factory<_i6.MuseumRepository>(() => _i7.MuseumRepositoryImpl(
          museumApiService: gh<_i4.MuseumApiService>(),
          museumItemsMapper: gh<_i3.MuseumItemsMapper>(),
        ));
    gh.factory<_i8.MuseumUseCase>(
        () => _i8.MuseumUseCase(gh<_i6.MuseumRepository>()));
    return this;
  }
}
