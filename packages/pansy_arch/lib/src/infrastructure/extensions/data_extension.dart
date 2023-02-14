import 'package:fpdart/fpdart.dart';

extension DataExtension<T> on Future<T> {
  Future<Either<Error, T>> fromDataToEither() async {
    try {
      return Right(await this);
    } catch (e) {
      return Left(Error());
    }
  }

  Future<Option<Error>> fromDataToOption() async {
    try {
      await this;
      return None();
    } catch (e) {
      return Some(Error());
    }
  }
}
