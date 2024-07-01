

import 'package:gp_nafsi/models/session_model.dart';

abstract class LayoutState{}

class LayoutInitialState extends LayoutState{}

class LayoutChangeBottomNavBarIndexState extends LayoutState{}

class LayoutChangeFavouriteIndexState extends LayoutState{}

class LayoutChangeAppSoundPlayState extends LayoutState{}



class GetVideosLoadingState extends LayoutState{}

class GetVideosErrorState extends LayoutState{}

class GetVideosSuccessState extends LayoutState{}

class GetUserDataLoadingState extends LayoutState{}



class GetUserDataErrorState extends LayoutState{}

class GetUserDataSuccessState extends LayoutState{}

class GetUserSessionsLoadingState extends LayoutState{}

class GetUserSessionsErrorState extends LayoutState{}

class GetUserSessionsSuccessState extends LayoutState{}



class CreateSessionLoadingState extends LayoutState{}

class GetProfileFaceIdSuccess extends LayoutState{
  final String faceId;

  GetProfileFaceIdSuccess({required this.faceId});
}
class GetProfileFaceIdError extends LayoutState{}

class CreateSessionErrorState extends LayoutState{
  final SessionModel? sessionModel;

  CreateSessionErrorState({required this.sessionModel});
}

class CreateSessionSuccessState extends LayoutState{}

class UpdateSessionLoadingState extends LayoutState{}

class UpdateSessionErrorState extends LayoutState{
  final SessionModel? sessionModel;

  UpdateSessionErrorState({required this.sessionModel});
}

class UpdateSessionSuccessState extends LayoutState{}

class UpdateUserFaceIdLoadingState extends LayoutState{}

class UpdateUserFaceIdErrorState extends LayoutState{
  final String errorMessage;

  UpdateUserFaceIdErrorState({required this.errorMessage});
}

class UpdateUserFaceIdSuccessState extends LayoutState{}



class AddArticleToFavourites extends LayoutState{}
class RemoveArticleFromFavourites extends LayoutState{}


class ChangePasswordLoadingStata extends LayoutState{}
class ChangePasswordSuccessStata extends LayoutState{}
class ChangePasswordErrorStata extends LayoutState{
  final String errorMessage;
  ChangePasswordErrorStata({required this.errorMessage});
}


class LogoutState extends LayoutState{}

