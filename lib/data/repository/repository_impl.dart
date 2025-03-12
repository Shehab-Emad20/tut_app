// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:tut_app/data/data_source/remote_data_source.dart';
import 'package:tut_app/data/mapper/mapper.dart';
import 'package:tut_app/data/network/failure.dart';
import 'package:tut_app/data/network/network_info.dart';
import 'package:tut_app/data/network/requests.dart';
import 'package:tut_app/domain/models/models.dart';
import 'package:tut_app/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  RepositoryImpl(this._remoteDataSource, this._networkInfo);
  @override
  Future<Either<Failure, Authentication>> login(
    LoginRequets loginRequets,
  ) async {
    if (await _networkInfo.isConnected) {
      final response = await _remoteDataSource.login(loginRequets);
      if (response.status == 0) {
        return Right(response.toDomain());
      } else {
        return Left(
          Failure(response.status ?? 409, response.message ?? "Error"),
        );
      }
    } else {
      return Left(Failure(501, "No Internet Connection"));
    }
  }
}
