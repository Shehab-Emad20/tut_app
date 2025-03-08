abstract class BaseViewModel extends BaseViewModelInputs implements BaseViewModelOutputs {
  // Additional common functionality for all view models can be added here
}

abstract class BaseViewModelInputs {
  void start(); // Start the ViewModel job

  void dispose(); // Finish the ViewModel job
}

abstract class BaseViewModelOutputs {
  // Define output-related methods and properties here
}
