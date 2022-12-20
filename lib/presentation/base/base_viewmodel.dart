import 'dart:async';

abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  // StreamController _inputStreamController =
  //     StreamController<FlowState>.broadcast();
}

abstract class BaseViewModelInputs {
  void start();
  void dispose();
  

}

abstract class BaseViewModelOutputs {


}
