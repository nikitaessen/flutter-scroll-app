// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_scroll_app/core/data/repositories/museum_repository.dart'
    as _i8;
import 'package:flutter_scroll_app/core/data/sources/museum_api_service.dart'
    as _i6;
import 'package:flutter_scroll_app/core/data/sources/museum_api_service_impl.dart'
    as _i7;
import 'package:flutter_scroll_app/core/domain/repositories/museum_repository_impl.dart'
    as _i9;
import 'package:flutter_scroll_app/core/scroll_app_router.dart' as _i3;
import 'package:flutter_scroll_app/features/details/data/mappers/museum_object_details_mapper.dart'
    as _i4;
import 'package:flutter_scroll_app/features/details/domain/use_cases/museum_object_details_use_case.dart'
    as _i10;
import 'package:flutter_scroll_app/features/overview/data/mappers/museum_items_mapper.dart'
    as _i5;
import 'package:flutter_scroll_app/features/overview/domain/use_cases/museum_collection_use_case.dart'
    as _i11;
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
    gh.factory<_i3.ScrollAppRouter>(() => _i3.ScrollAppRouter());
    gh.factory<_i4.MuseumObjectDetailsMapper>(
        () => _i4.MuseumObjectDetailsMapper());
    gh.factory<_i5.MuseumItemsMapper>(() => _i5.MuseumItemsMapper());
    gh.factory<_i6.MuseumApiService>(() => _i7.MuseumApiServiceImpl());
    gh.factory<_i8.MuseumRepository>(() => _i9.MuseumRepositoryImpl(
          museumApiService: gh<_i6.MuseumApiService>(),
          museumItemsMapper: gh<_i5.MuseumItemsMapper>(),
          museumObjectDetailsMapper: gh<_i4.MuseumObjectDetailsMapper>(),
        ));
    gh.factory<_i10.MuseumObjectDetailsUseCase>(
        () => _i10.MuseumObjectDetailsUseCase(gh<_i8.MuseumRepository>()));
    gh.factory<_i11.MuseumCollectionUseCase>(
        () => _i11.MuseumCollectionUseCase(gh<_i8.MuseumRepository>()));
    return this;
  }
}
