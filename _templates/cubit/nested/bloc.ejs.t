---
to: "lib/blocs/<%= h.changeCase.snake(name) %>/cubit.dart"
---
<% pascal = h.changeCase.pascal(name) %>
<% cubit = pascal+"Cubit" %>
import 'dart:async';

import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/repos/<%= h.changeCase.snake(name) %>/<%= h.changeCase.snake(name) %>_repo.dart';
import 'package:lensfolio_mobile_app/services/fault/faults.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'state.dart';

class <%= cubit %> extends Cubit<<%= pascal %>State> {
  static <%= cubit %> c(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<<%= cubit %>>(context, listen: listen);

  <%= cubit %>() : super(<%= pascal %>State.def());

<% args.forEach(function(arg){ %>

<% pModule = h.changeCase.pascal(arg.module) %>
<% cModule = h.changeCase.camel(arg.module) %>
<% model = h.changeCase.pascal(arg.model) %>

  Future<void> <%= cModule %>() async {
    emit(
      state.copyWith(
        <%= cModule %>: state.<%= cModule %>.toLoading(),
      ),
    );
    try {
      final data = await <%= pascal %>Repo.ins.<%= cModule %>();
      emit(
        state.copyWith(
          <%= cModule %>: state.<%= cModule %>.toSuccess(data: data),
        ),
      );
    } on Fault catch (e) {
      emit(
        state.copyWith(
          <%= cModule %>: state.<%= cModule %>.toFailed(fault: e),
        ),
      );
    }
  }
<% }); %>

  void reset() => emit(<%= pascal %>State.def());
}
