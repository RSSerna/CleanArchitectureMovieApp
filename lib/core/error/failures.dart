import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable
{
  final List<dynamic> properties;

  const Failure({List<dynamic>? properties})
      : properties = properties ?? const [];

  @override
  List<Object?> get props => properties;
}

// General failures
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}