abstract class PhotosState {}

// initial state

class InitialState extends PhotosState {}

// loading state
class LoadingState extends PhotosState {}

// error state
class ErrorState extends PhotosState {
  final String errorMessage;
  ErrorState({required this.errorMessage});
}

// success state
class SuccessState extends PhotosState {
  final data;
  SuccessState({required this.data});
}
