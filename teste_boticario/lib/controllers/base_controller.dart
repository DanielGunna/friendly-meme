abstract class BaseController {
  Function onNotifyState = () => {};
  void attachStateNotifier(Function onNotify) {
    onNotifyState = onNotify;
  }
}
