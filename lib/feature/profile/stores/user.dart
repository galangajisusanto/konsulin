import 'package:mobx/mobx.dart';
part 'user.g.dart';

class User = UserBase with _$User;

abstract class UserBase with Store{
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}