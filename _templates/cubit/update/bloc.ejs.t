---
inject: true
before: Future<void>
to: "lib/blocs/<%= h.changeCase.snake(name) %>/cubit.dart"
---
<% pascal = h.changeCase.pascal(name) %>
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
