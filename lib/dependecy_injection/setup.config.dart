// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../interact/authentication.dart' as _i294;
import '../repository/repo_firebase.dart' as _i477;
import '../viewmodel/login_viewmodel.dart' as _i152;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i294.Authentication>(() => _i477.RepoFirebase());
    gh.factory<_i152.LoginViewmodel>(
        () => _i152.LoginViewmodel(gh<_i294.Authentication>()));
    return this;
  }
}
