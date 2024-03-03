/// An abstract use case to be extended by project use cases
/// and use the same build scheme
abstract class UseCase<Type, Params> {
  Type call(Params params);
}

class NoParams {}
