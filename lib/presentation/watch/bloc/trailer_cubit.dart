import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../core/entity/trailer.dart';
import '../../../domain/moive/usecases/get_movie_trailer.dart';
import '../../../service_locator.dart';
part 'trailer_state.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerLoading());

  void getMovieTrailer(int movieId) async {

    var returnedData = await sl<GetMovieTrailerUseCase>().call(
        params:movieId
    );

    returnedData.fold(
            (error) {
          emit(FailuerLoadTrailer(errorMessage: error ));
        },
            (data) async{
          TrailerEntity trailerEntity = data;
          YoutubePlayerController controller = YoutubePlayerController(
            initialVideoId: trailerEntity.key!,
            flags: const YoutubePlayerFlags(
              autoPlay: false,
            ),
          );

          emit(TrailerLoaded(youtubePlayerController: controller ));
        }
    );
  }
}

