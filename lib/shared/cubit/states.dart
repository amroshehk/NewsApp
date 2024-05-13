abstract class AppStates {}
class AppInitiateStates extends AppStates {}
class AppBottomNavigationStates extends AppStates {}


class AppLoadingBusinessStates extends AppStates {}
class AppSuccessBusinessStates extends AppStates {}
class AppFailureBusinessStates extends AppStates {
  final String error;
  AppFailureBusinessStates(this.error);

}
