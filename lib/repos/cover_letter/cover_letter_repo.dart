import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_ai/firebase_ai.dart';
import 'package:flutter/services.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/gen/assets/assets.gen.dart';
import 'package:lensfolio_mobile_app/models/cover_letter/cover_letter.dart';
import 'package:lensfolio_mobile_app/models/cover_letter/letter_prompt_response.dart';
import 'package:lensfolio_mobile_app/services/agent_tool.dart';
import 'package:lensfolio_mobile_app/services/app_log.dart';
import 'package:lensfolio_mobile_app/services/fault/faults.dart';
import 'package:lensfolio_mobile_app/services/firebase/remote/remote_configs.dart';
import 'package:lensfolio_mobile_app/services/supabase/supabase.dart';
import 'package:lensfolio_mobile_app/services/supabase/database.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'cover_letter_mocks.dart';
part 'cover_letter_parser.dart';
part 'cover_letter_data_provider.dart';

class CoverLetterRepo {
  static final CoverLetterRepo _instance = CoverLetterRepo._();
  CoverLetterRepo._();

  static CoverLetterRepo get ins => _instance;

  /// --- repo functions --- ///

  Future<CoverLetter> save(LetterPromptResponse letter, int uid) {
    final payload = _CoverLetterParser.save(letter, uid);
    return _CoverLetterProvider.save(payload);
  }

  Future<List<CoverLetter>> fetch(int uid) => _CoverLetterProvider.fetch(uid);

  Future<LetterPromptResponse> generate(Map<String, dynamic> payload) =>
      _CoverLetterProvider.generate(payload);

  Future<CoverLetter> edit(int id, Map<String, dynamic> payload) =>
      _CoverLetterProvider.edit(id, payload);

  Future<void> delete(int id) => _CoverLetterProvider.delete(id);
}
