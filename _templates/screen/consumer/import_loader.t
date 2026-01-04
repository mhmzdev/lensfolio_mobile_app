---
inject: true
before: part
to: "<%= level === 'app' ? 'lib/features/app' : `lib/features/${h.changeCase.snake(feature)}` %>/ui/<%= h.changeCase.snake(name) %>/<%= h.changeCase.snake(name) %>.dart"
skip_if: pine_ui/pine_ui.dart
---
