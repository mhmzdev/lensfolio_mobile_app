---
to: "<%= formData ? `${level === 'app' ? 'lib/features/app' : `lib/features/${h.changeCase.snake(feature)}`}/ui/${h.changeCase.snake(name)}/static/_form_keys.dart` : null %>"
---
part of '../<%= h.changeCase.snake(name) %>.dart';

class _FormKeys {
<% if (formKeys.length) { %>
<% formKeys.forEach(function(key){ %>
  static const <%= h.changeCase.camelCase(key) %> = '<%= h.changeCase.snake(key) %>';
<% }); %>
<% } else { %>
  static const key = 'key';
<% } %>
}