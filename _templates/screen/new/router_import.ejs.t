---
inject: true
to: lib/router/router.dart
after: // imports
skip_if: "ui/screens/<%= h.changeCase.snake(name) %>/<%= h.changeCase.snake(name) %>.dart"
---
import 'package:lensfolio_mobile_app/ui/screens/<%= h.changeCase.snake(name) %>/<%= h.changeCase.snake(name) %>.dart';
