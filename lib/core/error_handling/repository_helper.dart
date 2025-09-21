import 'package:dartz/dartz.dart';
import 'package:one_studio_task/core/error_handling/exceptions.dart';
import 'package:one_studio_task/core/error_handling/failures.dart';

mixin RepositoryHelper {
  Future<Either<Failure, T>> handleEither<T>(Future<T> Function() call) async {
    try {
      final result = await call();
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(CacheFailure(message: 'Unexpected error: $e'));
    }
  }
}
