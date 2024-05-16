abstract class AppStates {}
class AppInitiateStates extends AppStates {}
class AppBottomNavigationStates extends AppStates {}


class AppLoadingBusinessStates extends AppStates {}
class AppSuccessBusinessStates extends AppStates {}
class AppFailureBusinessStates extends AppStates {
  final String error;
  AppFailureBusinessStates(this.error);
}


class AppLoadingScienceStates extends AppStates {}
class AppSuccessScienceStates extends AppStates {}
class AppFailureScienceStates extends AppStates {
  final String error;
  AppFailureScienceStates(this.error);
}


class AppLoadingSportsStates extends AppStates {}
class AppSuccessSportsStates extends AppStates {}
class AppFailureSportsStates extends AppStates {
  final String error;
  AppFailureSportsStates(this.error);
}

class AppChangeThemeModeStates extends AppStates {}
