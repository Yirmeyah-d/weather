import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import '../error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class UseCaseNoFailure<Type, Params> {
  Future<Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class Params extends Equatable {
  final String city;

  const Params({required this.city});

  @override
  List<Object> get props => [city];
}
