
abstract class BaseUseCase<TOutput, TInput> {
  const BaseUseCase();
  Future<TOutput> call(final TInput input);
}