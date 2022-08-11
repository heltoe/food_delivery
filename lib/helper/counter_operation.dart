enum CounterOperation {
  add,
  subtract,
}

class CounterOperationHelper{
  static String getValue(CounterOperation type){
    switch(type){
      case CounterOperation.add:
        return "add";
      case CounterOperation.subtract:
        return "subtract";
      default:
        return "";
    }
  }
  static bool isIncrement(CounterOperation type) {
    return getValue(type) == "add";
  }
}