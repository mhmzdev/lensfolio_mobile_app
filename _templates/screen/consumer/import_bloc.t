---
inject: true
before: part
to: "<%= level === 'app' ? 'lib/features/app' : `lib/features/${h.changeCase.snake(feature)}` %>/ui/<%= h.changeCase.snake(name) %>/<%= h.changeCase.snake(name) %>.dart"
skip_if: <%= h.changeCase.snake(arg.bloc) %>/cubit.dart
---
import 'package:lensfolio_mobile_app/features/<%= level === 'app' ? 'app' : h.changeCase.snake(feature) %>/blocs/<%= h.changeCase.snake(arg.bloc) %>/cubit.dart';