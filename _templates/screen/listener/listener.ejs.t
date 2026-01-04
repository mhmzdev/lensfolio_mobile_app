---
to: "<%= level === 'app' ? 'lib/features/app' : `lib/features/${h.changeCase.snake(feature)}` %>/ui/<%= h.changeCase.snake(name) %>/listeners/_<%= h.changeCase.snake(arg.state) %>.dart"
---
part of '../<%= h.changeCase.snake(name) %>.dart';
<% bloc = h.changeCase.pascal(arg.bloc) %>
<% module = h.changeCase.camel(arg.module) %>

class _<%= h.changeCase.pascal(arg.state) %>Listener extends StatelessWidget {
  const _<%= h.changeCase.pascal(arg.state) %>Listener();

  @override
  Widget build(BuildContext context) {
    return BlocListener< <%= bloc %>Cubit, <%= bloc %>State>(
      listenWhen: (a, b) => a.<%= module %> != b.<%= module %>,
      listener: (_, state) {
        if (state.<%= module %>.isFailed) {
          UIFlash.error(context, state.<%= module %>.errorMessage);
        }
        if (state.<%= module %>.isSuccess) {
          UIFlash.success(context, 'Request completed successfully');
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
