---
inject: true
before: part
to: "<%= level === 'app' ? 'lib/features/app' : `lib/features/${h.changeCase.snake(feature)}` %>/ui/<%= h.changeCase.snake(name) %>/<%= h.changeCase.snake(name) %>.dart"
skip_if: flutter_bloc/flutter_bloc.dart
---
import 'package:flutter_bloc/flutter_bloc.dart';