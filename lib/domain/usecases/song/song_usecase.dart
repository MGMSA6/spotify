import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/models/song/song.dart';
import 'package:spotify/domain/repository/song/song.dart';
import 'package:spotify/service_locator.dart';

class SongUsecase extends Usecase<Either, SongModel> {
  @override
  Future<Either> call({SongModel? params}) async {
    return sl<SongsRepository>().getNewSongs();
  }
}
