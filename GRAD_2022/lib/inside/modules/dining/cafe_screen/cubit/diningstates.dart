abstract class DiningStates {}

class DiningIntialStates extends DiningStates {}

class DiningLoadingStates extends DiningStates {}

class DiningSuccesssStates extends DiningStates {}

class DiningErorrStates extends DiningStates {
  final String error;
  DiningErorrStates(this.error);
}