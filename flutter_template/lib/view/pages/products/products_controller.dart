import 'package:u/utilities.dart';

mixin ProductController {
  List<String> products = <String>[];

  Rx<PageState> state = PageState.initial.obs;


  void getProducts() {
    state.loading();
    try {
      if (products.isEmpty) state.emptying();
      if (products.isNotEmpty) state.loaded();
    } catch (e) {
      state.error();
    }
  }
}
