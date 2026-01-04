---
to: "<%= level === 'app' ? 'lib/features/app' : `lib/features/${h.changeCase.snake(feature)}` %>/ui/<%= h.changeCase.snake(name) %>/widgets/_body.dart"
---
part of '../<%= h.changeCase.snake(name) %>.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    <% if (formData) { %>final screenState = _ScreenState.s(context);<% } %>

    return <% if (!formData) { %> const <% } %> Screen(
      <% if (formData) { %>
      formKey: screenState.formKey,
      initialFormValue: _FormData.initialValues(),
      <% } %>
      keyboardHandler: true,
      child: <% if (formData) { %> const <% } %> SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [],
        ),
      ),
    );
  }
}
