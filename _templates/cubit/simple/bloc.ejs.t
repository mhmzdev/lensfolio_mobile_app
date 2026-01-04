---
to: "lib/blocs/<%= h.changeCase.snake(name) %>/cubit.dart"
---
<% pascal = h.changeCase.pascal(name) %>
<% cubit = pascal+"Cubit" %>
<% pmodel = h.changeCase.pascal(model) %>
import 'dart:async';

import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/repos/<%= h.changeCase.snake(name) %>/<%= h.changeCase.snake(name) %>_repo.dart';
import 'package:lensfolio_mobile_app/services/fault/faults.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class <%= cubit %> extends Cubit<BlocState<<%= pmodel %>>> {
  static <%= cubit %> c(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<<%= cubit %>>(context, listen: listen);

  <%= cubit %>() : super(BlocState<<%= pmodel %>>());

  Future<void> fetch() async {
    emit(state.toLoading());
    try {
      final data = await <%= pascal %>Repo.ins.fetch();
      emit(state.toSuccess(data: data));
    } on Fault catch (e) {
      emit(state.toFailed(fault: e));
    }
  }

  void reset() => emit(BlocState<<%= pmodel %>>());
}
// end-cubit