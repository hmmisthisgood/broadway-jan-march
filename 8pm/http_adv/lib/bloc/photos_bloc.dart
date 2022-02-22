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

  final logger = Logger();

  int currentPage = 1;

  List<Photo> allPhotos = [];
  // return
// from inside bloc/cubit functions, we [emit]

  fetchPosts() async {
    emit(LoadingState());

    // logger.i("Fethinvg data from server");
    final url =
        "https://pixabay.com/api/?key=${Constants.API_KEY}&q=cats&image_type=photo&per_page=5";
    // logger.i(url);

    final uri = Uri.parse(url);
    try {
      final response = await apiClient.get(uri);

      final body = response.body;

      final Map<String, dynamic> decodedJson = json.decode(body);
      List hits = decodedJson['hits'];

      final photosData = hits.map((item) {
        final convertedPhoto = Photo.convertMapToPhoto(item);
        return convertedPhoto;
      }).toList();
      allPhotos.addAll(photosData);
      emit(SuccessState(data: photosData));
    } catch (e) {
      // logger.e(e);

      emit(ErrorState(errorMessage: e.toString()));
    }
  }

  loadMorePosts() async {
    print("loading more posts");
    currentPage++;

    emit(LoadingState());

    // logger.i("Fethinvg data from server");
    final url =
        "https://pixabay.com/api/?key=${Constants.API_KEY}&q=cats&image_type=photo&page=$currentPage&per_page=5";

    final uri = Uri.parse(url);
    try {
      final response = await apiClient.get(uri);
      final Map<String, dynamic> decodedJson = json.decode(response.body);

      List newHits = decodedJson['hits'];

      /// new 20 allPhotos
      final loadedMorePhotos = newHits.map((item) {
        final convertedPhoto = Photo.convertMapToPhoto(item);
        return convertedPhoto;
      }).toList();
      allPhotos.addAll(loadedMorePhotos);

      emit(SuccessState(data: allPhotos));
    } catch (e) {
      // logger.e(e);

      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}
