// Bloc=Cubit

import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_adv/bloc/photos_state.dart';
import 'package:http_adv/model/photo.dart';
import 'package:http_adv/util/constants.dart';
import 'package:http/http.dart' as apiClient;
import 'package:logger/logger.dart';

// bloc/cubit

class PhotosCubit extends Cubit<PhotosState> {
  PhotosCubit() : super(InitialState());

  final _logger = Logger();

  int _currentPage = 1;

  List<Photo> _allPhotos = [];

  int _totalPhotos = 0;

  String searchQuery = "";

  // return
// from inside bloc/cubit functions, we [emit]

  fetchPosts(String query) async {
    emit(LoadingState());

    emit(LoadingState());
    emit(LoadingState());
    emit(LoadingState());
    emit(LoadingState());
    emit(LoadingState());

    _currentPage = 1;
    _allPhotos = [];

    searchQuery = query;

    // logger.i("Fethinvg data from server");
    final url =
        "https://pixabay.com/api/?key=${Constants.API_KEY}&q=$query&image_type=photo&per_page=3";
    // logger.i(url);

    final uri = Uri.parse(url);
    try {
      final response = await apiClient.get(uri);

      final body = response.body;

      final Map<String, dynamic> decodedJson = json.decode(body);
      List hits = decodedJson['hits'];

      _totalPhotos = decodedJson['total'];

      final photosData = hits.map((item) {
        final convertedPhoto = Photo.convertMapToPhoto(item);
        return convertedPhoto;
      }).toList();

      _allPhotos.addAll(photosData);

      emit(SuccessState(data: photosData));
    } catch (e) {
      // logger.e(e);

      emit(ErrorState(errorMessage: e.toString()));
    }
  }

  loadMorePosts() async {
    print("loading more posts");
    _currentPage++;

    if (_allPhotos.length >= _totalPhotos) {
      emit(NoMoreData(data: _allPhotos));
      return;
    }

    // emit(LoadingMoreState(data: _allPhotos));

    // logger.i("Fethinvg data from server");
    final url =
        "https://pixabay.com/api/?key=${Constants.API_KEY}&q=$searchQuery&image_type=photo&page=$_currentPage&per_page=3";

    final uri = Uri.parse(url);
    try {
      final response = await apiClient.get(uri);
      final Map<String, dynamic> decodedJson = json.decode(response.body);

      List newHits = decodedJson['hits'];

      /// new 20 _allPhotos
      final loadedMorePhotos = newHits.map((item) {
        final convertedPhoto = Photo.convertMapToPhoto(item);
        return convertedPhoto;
      }).toList();

      _allPhotos.addAll(loadedMorePhotos);

      emit(SuccessState(data: _allPhotos));
    } catch (e) {
      // logger.e(e);

      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}
