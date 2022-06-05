import 'dart:ffi';

import 'Deadline.dart';

class DeadlinesController {
  static const int SUCESS = 1;
  static const int BAD_ACTION = -1;
  static const int PROCESS_FAILURE = -2;
  List<Deadline> myList = List.empty( growable: true);

  int addDeadlineData(Deadline dl){
    if (myList.length < 19 ){
      myList.add(dl);
      return SUCESS;
    }

    return BAD_ACTION; //FULL
  }

  int deleteItem(Deadline dl){
    if (myList.length > 0 ){
      if ( myList.remove(dl))
        return SUCESS;
      else
        return PROCESS_FAILURE;
    }

    return BAD_ACTION; //EMPTY
  }

  List getList(){
    return myList;
  }

  void reset(){
    myList.clear();
  }
}