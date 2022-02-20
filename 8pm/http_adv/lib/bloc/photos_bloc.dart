// Bloc=Cubit

import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_adv/bloc/photos_state.dart';
import 'package:http_adv/util/constants.dart';
import 'package:http/http.dart' as apiClient;
import 'package:logger/logger.dart';

class PhotosCubit extends Cubit<PhotosState> {
  PhotosCubit() : super(InitialState());
  final logger = Logger();
  deletePost() {}
  updatePost() {}

  // return
// from inside bloc/cubit functions, we [emit]

  fetchPosts() async {
    emit(LoadingState());

    // logger.i("Fethinvg data from server");
    final url =
        "https://pixabay.com/api/?key=${Constants.API_KEY}&q=cats&image_type=photo";
    // logger.i(url);

    final uri = Uri.parse(url);
    try {
      final response = await apiClient.get(uri);

      final body = response.body;

      final decodedJson = json.decode(body);
      emit(SuccessState(data: body));
    } catch (e) {
      // logger.e(e);

      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}
