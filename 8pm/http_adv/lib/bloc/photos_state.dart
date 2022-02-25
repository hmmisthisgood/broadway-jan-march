import 'package:http_adv/model/photo.dart';

abstract class PhotosState {
  final data;
  PhotosState({this.data});
}

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
  final List<Photo> data;
  SuccessState({required this.data}) : super(data: data);
}

class LoadingMoreState extends PhotosState {
  final List<Photo> data;
  LoadingMoreState({required this.data}) : super(data: data);
}

class NoMoreData extends PhotosState {
  final List<Photo> data;
  NoMoreData({required this.data}) : super(data: data);
}
