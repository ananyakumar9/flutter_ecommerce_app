import 'package:mobx/mobx.dart';

class GlobalStore with Store {
  final Observable<int> _pageIndex = Observable(0);

  int get pageIndex => _pageIndex.value;

  void setPageIndex({required int index}) {
    runInAction(() => _pageIndex.value = index);
  }

  final Observable<double> cartAmount = Observable(0.0);
}
