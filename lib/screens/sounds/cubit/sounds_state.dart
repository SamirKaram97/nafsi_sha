abstract class SoundsState{}

class SoundsInitialState extends SoundsState{}


class SoundsPlaySongChangeState extends SoundsState{}


class SoundsLoadNextSoundState extends SoundsState{}

class SoundsLoadPreviousSoundState extends SoundsState{}

class SoundsChangeCurrentSoundState extends SoundsState{}

class SoundsChangeShuffleModeState extends SoundsState{}

class SoundsChangeLoopModeState extends SoundsState{}

class SoundsDurationOrPositionState extends SoundsState{}


class GetSoundsLoadingState extends SoundsState{}
class GetSoundsSuccessState extends SoundsState{}
class GetSoundsErrorState extends SoundsState{
  final String errorMessage;

  GetSoundsErrorState({required this.errorMessage});
}



