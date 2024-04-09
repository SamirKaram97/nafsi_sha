

import 'package:audio_service/audio_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_nafsi/layout/cubit/layout_cubit.dart';
import 'package:gp_nafsi/screens/sounds/cubit/sounds_state.dart';
import 'package:just_audio/just_audio.dart';

import '../../../models/sound_model.dart';

class SoundsCubit extends Cubit<SoundsState>
{
  SoundsCubit():super(SoundsInitialState());
  static SoundsCubit get(context)=>BlocProvider.of(context);

  List<SoundModel> sounds=[
    SoundModel(name: "sound 1",coverUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxa70Dyls3kaOuPgCJkxWQFntO77FnE1Tecwya-CRxHQ&s",url: "http://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Sevish_-__nbsp_.mp3"),
    SoundModel(name: "sound 2",coverUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSE47KA6XXsMnFn4VnJh6aPqyMlDdALipDUlSLIAxwPzF4CSNMGUGL9ihCA70NrAwGUycc&usqp=CAU",url: "https://codeskulptor-demos.commondatastorage.googleapis.com/descent/background%20music.mp3"),
    SoundModel(name: "sound 3",coverUrl: "https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/149562217/original/fc77d96de1229ad6ca6f83289fd2d4b4c068a568/make-album-and-song-covers.jpg",url: "http://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Sevish_-__nbsp_.mp3"),
    SoundModel(name: "sound 4",coverUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxa70Dyls3kaOuPgCJkxWQFntO77FnE1Tecwya-CRxHQ&s",url: "https://codeskulptor-demos.commondatastorage.googleapis.com/descent/background%20music.mp3"),
    SoundModel(name: "sound 5",coverUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSE47KA6XXsMnFn4VnJh6aPqyMlDdALipDUlSLIAxwPzF4CSNMGUGL9ihCA70NrAwGUycc&usqp=CAU",url: "http://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Sevish_-__nbsp_.mp3"),
    SoundModel(name: "sound 6",coverUrl: "https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/149562217/original/fc77d96de1229ad6ca6f83289fd2d4b4c068a568/make-album-and-song-covers.jpg",url: "https://codeskulptor-demos.commondatastorage.googleapis.com/descent/background%20music.mp3"),
  ];

  late AudioPlayer audioPlayer;//
  late int currentSound;
  late bool play;
  late ProcessingState processingState;
  late bool shuffleModeEnabled;
  late List<LoopMode> loopModesList;
  late int loopModeIndex;
  late Duration soundTotalDuration;
  late Duration currentPositionDuration;


  void init(context)async
  {

    currentSound=0;
    soundTotalDuration=Duration.zero;
    currentPositionDuration=Duration.zero;
    play=false;
    shuffleModeEnabled=false;
    loopModeIndex=0;
    loopModesList=[LoopMode.off,LoopMode.all,LoopMode.one];
    audioPlayer=AudioPlayer();
    ConcatenatingAudioSource playlist = ConcatenatingAudioSource(
      // Start loading next item just before reaching it
      useLazyPreparation: false,
      // Customise the shuffle algorithm
      shuffleOrder: DefaultShuffleOrder(),
      // Specify the playlist items
      //MediaItem for notification
      children: sounds.map((e) => AudioSource.uri(Uri.parse(e.url),tag: MediaItem(id: e.url, title: e.name,album: e.name))).toList(),
    );
    await audioPlayer.setAudioSource(playlist, initialIndex: 0, initialPosition: Duration.zero);


    _listenToDurations();
    _listenToIndex();
    _listenToPlayOrNot(context);

  }

  void _playSound()async
  {
    audioPlayer.play();
  }

  Future<void> _pauseSound()async
  {
    await audioPlayer.pause();
  }

  void playOrPauseSound()async
  {
    if(play) {
      await _pauseSound();
    }
    else
      {
        _playSound();
      }
  }


  void loadNextSound()async
  {
    if(currentSound<sounds.length-1)
      {
       audioPlayer.seekToNext();
      }
    else
      {
         audioPlayer.seek(Duration.zero, index: 0);
      }
    emit(SoundsLoadNextSoundState());
  }


  void loadPreviousSound()async
  {
    if(currentSound>0)
    {
       audioPlayer.seekToPrevious();
    }
    else
    {
       audioPlayer.seek(Duration.zero, index: sounds.length-1);
    }
    emit(SoundsLoadPreviousSoundState());
  }


  void choseSong(int index)async
  {
    if(index!=currentSound) {
      currentSound=index;
      await audioPlayer.seek(Duration.zero, index: currentSound);
      _playSound();
    }
    emit(SoundsChangeCurrentSoundState());
  }

  void _listenToDurations()
  {
    audioPlayer.durationStream.listen((duration) {
      soundTotalDuration=duration??Duration.zero;
      emit(SoundsDurationOrPositionState());
    });
    audioPlayer.positionStream.listen((current) {
      if(current.inSeconds!=currentPositionDuration.inSeconds) {
        currentPositionDuration=current;
        emit(SoundsDurationOrPositionState());
      }
    });

  }

  void _listenToPlayOrNot(context)
  {
    audioPlayer.playingStream.listen((event) {
      play=event;
      LayoutCubit.get(context).changeAppSoundPlay(event);
      emit(SoundsPlaySongChangeState());
    });

  }

  void _listenToIndex()
  {
    audioPlayer.currentIndexStream.listen((event) {
      currentSound=event??0;
      emit(SoundsChangeCurrentSoundState());
    });
  }

  void changeShuffleMode()
  {
    shuffleModeEnabled=!shuffleModeEnabled;
    audioPlayer.setShuffleModeEnabled(shuffleModeEnabled);
    emit(SoundsChangeShuffleModeState());
  }
  
  void changeLoopMode()
  {
    if(loopModeIndex<loopModesList.length-1)
      {
        audioPlayer.setLoopMode(loopModesList[++loopModeIndex]);
      }
    else{
      loopModeIndex=0;
      audioPlayer.setLoopMode(loopModesList[loopModeIndex]);
    }
    emit(SoundsChangeLoopModeState());
  }

  void dispose()
  {
    audioPlayer.dispose();
  }

  void changeCurrentPosition(Duration newPosition)
  {
    audioPlayer.seek(newPosition);
  }

}