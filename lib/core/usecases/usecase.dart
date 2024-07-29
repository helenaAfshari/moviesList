

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:get_list/core/error/failures.dart';

// abstract class UseCase<Type,Params>{
//   Future<Either<Failure,Type>>call(Params params);
// }

// class NoParams extends Equatable{
//   @override
//   List<Object?> get props => throw UnimplementedError();

// }

// abstract class UseCase<Type, Params> {
//   Future<Type> call({Params params});
// }

abstract class UseCase<Type, Params> {
  Future<Type> call({required Params params});
}
