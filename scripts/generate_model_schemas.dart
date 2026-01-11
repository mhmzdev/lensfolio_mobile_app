// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:convert';

/// Generates Python-friendly JSON schemas from Freezed models for backend team.
/// Converts types to Python equivalents and uses snake_case naming.
/// Only regenerates schemas for models that have been modified since last generation.

void main() async {
  print('🔍 Starting model schema generation...\n');

  // Get project root directory from script location
  final scriptFile = File(Platform.script.toFilePath());
  final scriptDir = scriptFile.parent;
  final projectRoot = scriptDir.path.endsWith('scripts')
      ? scriptDir.parent
      : scriptDir;

  print('📁 Project root: ${projectRoot.path}\n');

  // Base output directory for generated schemas
  final baseOutputDir = Directory(
    '${projectRoot.path}${Platform.pathSeparator}gen${Platform.pathSeparator}models',
  );
  if (!baseOutputDir.existsSync()) {
    baseOutputDir.createSync(recursive: true);
    print('✅ Created base output directory: ${baseOutputDir.path}\n');
  }

  var totalSuccess = 0;
  var totalErrors = 0;
  var totalSkipped = 0;

  // Process pine_core models
  print('📦 Processing pine_core models...');
  final coreDir = Directory(
    '${projectRoot.path}${Platform.pathSeparator}packages${Platform.pathSeparator}pine_core${Platform.pathSeparator}lib${Platform.pathSeparator}src${Platform.pathSeparator}models',
  );
  final coreOutputDir = Directory(
    '${baseOutputDir.path}${Platform.pathSeparator}shared',
  );
  if (coreDir.existsSync()) {
    final coreFiles = await _findModelFiles(coreDir);
    print('   Found ${coreFiles.length} model files\n');
    final result = await _processFiles(coreFiles, coreOutputDir, 'shared');
    totalSuccess += result['success'] as int;
    totalErrors += result['errors'] as int;
    totalSkipped += result['skipped'] as int;
  } else {
    print('   ⚠️  Directory not found\n');
  }

  // Process fan_app models
  print('📱 Processing fan_app models...');
  final fanDir = Directory(
    '${projectRoot.path}${Platform.pathSeparator}apps${Platform.pathSeparator}fan_app${Platform.pathSeparator}lib${Platform.pathSeparator}features',
  );
  final fanOutputDir = Directory(
    '${baseOutputDir.path}${Platform.pathSeparator}fan_app',
  );
  if (fanDir.existsSync()) {
    final fanFiles = await _findModelFilesInFeatures(fanDir);
    print('   Found ${fanFiles.length} model files\n');
    final result = await _processFiles(fanFiles, fanOutputDir, 'fan_app');
    totalSuccess += result['success'] as int;
    totalErrors += result['errors'] as int;
    totalSkipped += result['skipped'] as int;
  } else {
    print('   ⚠️  Directory not found\n');
  }

  // Process driver_app models
  print('🚗 Processing driver_app models...');
  final driverDir = Directory(
    '${projectRoot.path}${Platform.pathSeparator}apps${Platform.pathSeparator}driver_app${Platform.pathSeparator}lib${Platform.pathSeparator}features',
  );
  final driverOutputDir = Directory(
    '${baseOutputDir.path}${Platform.pathSeparator}driver_app',
  );
  if (driverDir.existsSync()) {
    final driverFiles = await _findModelFilesInFeatures(driverDir);
    print('   Found ${driverFiles.length} model files\n');
    final result = await _processFiles(
      driverFiles,
      driverOutputDir,
      'driver_app',
    );
    totalSuccess += result['success'] as int;
    totalErrors += result['errors'] as int;
    totalSkipped += result['skipped'] as int;
  } else {
    print('   ⚠️  Directory not found\n');
  }

  print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  print('✨ Schema generation complete!');
  print('   Generated: $totalSuccess');
  print('   Skipped (unchanged): $totalSkipped');
  print('   Errors: $totalErrors');
  print('   Output: ${baseOutputDir.path}');
  print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n');
}

/// Process a list of files and generate schemas
Future<Map<String, int>> _processFiles(
  List<File> files,
  Directory outputDir,
  String source,
) async {
  var successCount = 0;
  var errorCount = 0;
  var skippedCount = 0;

  if (!outputDir.existsSync()) {
    outputDir.createSync(recursive: true);
  }

  for (final file in files) {
    try {
      final fileName = file.path.split(Platform.pathSeparator).last;

      // Check if file needs regeneration
      final needsRegeneration = await _needsRegeneration(file, outputDir);

      if (!needsRegeneration) {
        skippedCount++;
        continue; // Skip unchanged files silently
      }

      print('   Processing: $fileName');

      final schema = await _parseModelFile(file);
      if (schema != null) {
        await _writeSchema(file, schema, outputDir, source);
        successCount++;
        print('      ✅ Generated\n');
      } else {
        print('      ⚠️  Skipped (not a freezed model)\n');
      }
    } catch (e) {
      errorCount++;
      print('      ❌ Error: $e\n');
    }
  }

  return {
    'success': successCount,
    'errors': errorCount,
    'skipped': skippedCount,
  };
}

/// Check if a model file needs regeneration by comparing modification times
Future<bool> _needsRegeneration(File sourceFile, Directory outputDir) async {
  final fileName = sourceFile.path.split(Platform.pathSeparator).last;
  final fileNameWithoutExt = fileName.replaceFirst('.dart', '');
  final outputFileName = '$fileNameWithoutExt.json';

  final outputFile = File(
    '${outputDir.path}${Platform.pathSeparator}$outputFileName',
  );

  // If output doesn't exist, needs regeneration
  if (!outputFile.existsSync()) {
    return true;
  }

  // Compare modification times
  final sourceModified = await sourceFile.lastModified();
  final outputModified = await outputFile.lastModified();

  // If source is newer than output, needs regeneration
  return sourceModified.isAfter(outputModified);
}

/// Find all model .dart files in a specific directory (excluding .freezed.dart and .g.dart)
Future<List<File>> _findModelFiles(Directory dir) async {
  final modelFiles = <File>[];

  if (!dir.existsSync()) {
    return modelFiles;
  }

  await for (final entity in dir.list(recursive: true)) {
    if (entity is File && entity.path.endsWith('.dart')) {
      // Exclude .freezed.dart and .g.dart files
      if (!entity.path.endsWith('.freezed.dart') &&
          !entity.path.endsWith('.g.dart')) {
        modelFiles.add(entity);
      }
    }
  }

  return modelFiles;
}

/// Find all model .dart files in features directory (only in models/ subdirectories)
Future<List<File>> _findModelFilesInFeatures(Directory featuresDir) async {
  final modelFiles = <File>[];

  if (!featuresDir.existsSync()) {
    return modelFiles;
  }

  await for (final entity in featuresDir.list(recursive: true)) {
    if (entity is File && entity.path.endsWith('.dart')) {
      // Only include files in models/ subdirectories
      if (entity.path.contains(
        '${Platform.pathSeparator}models${Platform.pathSeparator}',
      )) {
        // Exclude .freezed.dart and .g.dart files
        if (!entity.path.endsWith('.freezed.dart') &&
            !entity.path.endsWith('.g.dart')) {
          modelFiles.add(entity);
        }
      }
    }
  }

  return modelFiles;
}

/// Parse a model file and extract schema information
Future<Map<String, dynamic>?> _parseModelFile(File file) async {
  final content = await file.readAsString();
  final lines = content.split('\n');

  // Check if it's a freezed model
  if (!content.contains('@freezed') && !content.contains('@Freezed')) {
    return null;
  }

  String? className;
  final fields = <Map<String, dynamic>>[];
  final enums = <Map<String, dynamic>>[];
  var inFactoryConstructor = false;
  var inEnum = false;
  String? currentEnum;
  final enumValues = <String>[];

  for (var i = 0; i < lines.length; i++) {
    final line = lines[i].trim();

    // Extract class name (prioritize sealed class, then regular class)
    if ((line.contains('sealed class') || line.startsWith('class ')) &&
        !line.contains('extension') &&
        className == null) {
      final match = RegExp(r'class\s+(\w+)').firstMatch(line);
      if (match != null) {
        className = match.group(1);
      }
    }

    // Detect factory constructor start
    if (line.contains('factory $className(')) {
      inFactoryConstructor = true;
      continue;
    }

    // Detect factory constructor end
    if (inFactoryConstructor && line.contains('}) =')) {
      inFactoryConstructor = false;
      continue;
    }

    // Parse fields inside factory constructor
    if (inFactoryConstructor) {
      final field = _parseField(line);
      if (field != null) {
        fields.add(field);
      }
    }

    // Parse enums
    if (line.startsWith('enum ')) {
      inEnum = true;
      final match = RegExp(r'enum\s+(\w+)').firstMatch(line);
      if (match != null) {
        currentEnum = match.group(1);
        enumValues.clear();
      }
      continue;
    }

    if (inEnum) {
      if (line == '}') {
        if (currentEnum != null && enumValues.isNotEmpty) {
          enums.add({'name': currentEnum, 'values': List.from(enumValues)});
        }
        inEnum = false;
        currentEnum = null;
        enumValues.clear();
      } else if (line.isNotEmpty && !line.startsWith('//')) {
        // Extract enum value
        final enumValue = line.replaceAll(',', '').trim();
        if (enumValue.isNotEmpty &&
            !enumValue.startsWith('///') &&
            !enumValue.startsWith('extension')) {
          enumValues.add(enumValue);
        }
      }
    }
  }

  if (className == null) {
    return null;
  }

  return {'className': className, 'fields': fields, 'enums': enums};
}

/// Parse a field line from the factory constructor
Map<String, dynamic>? _parseField(String line) {
  if (line.isEmpty ||
      line.startsWith('//') ||
      line.startsWith('///') ||
      line == '{' ||
      line == '}') {
    return null;
  }

  var fieldLine = line;
  String? jsonKey;
  dynamic defaultValue;
  var isRequired = false;
  var isNullable = false;

  // Extract @JsonKey annotation
  if (fieldLine.contains('@JsonKey')) {
    final jsonKeyMatch = RegExp(
      r"@JsonKey\(name:\s*'([^']+)'",
    ).firstMatch(fieldLine);
    if (jsonKeyMatch != null) {
      jsonKey = jsonKeyMatch.group(1);
    }
    // Remove @JsonKey annotation from the line
    fieldLine = fieldLine.replaceAll(RegExp(r'@JsonKey\([^)]+\)\s*'), '');
  }

  // Extract @Default annotation
  if (fieldLine.contains('@Default')) {
    final defaultMatch = RegExp(r'@Default\(([^)]+)\)').firstMatch(fieldLine);
    if (defaultMatch != null) {
      final defaultStr = defaultMatch.group(1)!;
      defaultValue = _parseDefaultValue(defaultStr);
    }
    // Remove @Default annotation from the line
    fieldLine = fieldLine.replaceAll(RegExp(r'@Default\([^)]+\)\s*'), '');
  }

  // Check if required
  if (fieldLine.contains('required')) {
    isRequired = true;
    fieldLine = fieldLine.replaceAll('required', '').trim();
  }

  // Parse type and name
  final parts = fieldLine.split(' ').where((s) => s.isNotEmpty).toList();
  if (parts.length < 2) {
    return null;
  }

  var type = parts[0];
  final name = parts[1].replaceAll(',', '').replaceAll('?', '');

  // Check if nullable
  if (parts[0].endsWith('?') || parts[1].contains('?')) {
    isNullable = true;
    type = type.replaceAll('?', '');
  }

  return {
    'name': name,
    'type': type,
    'jsonKey': jsonKey,
    'required': isRequired,
    'nullable': isNullable,
    'defaultValue': defaultValue,
  };
}

/// Convert camelCase to snake_case
String _toSnakeCase(String input) {
  return input
      .replaceAllMapped(
        RegExp(r'[A-Z]'),
        (match) => '_${match.group(0)!.toLowerCase()}',
      )
      .replaceFirst(RegExp(r'^_'), '');
}

/// Convert Dart type to Python type
String _toPythonType(String dartType) {
  // Handle List types - just return "list", item_type will be added separately
  if (dartType.startsWith('List<')) {
    return 'list';
  }

  // Handle Map types
  if (dartType.startsWith('Map<')) {
    return 'dict';
  }

  // Basic type mappings
  switch (dartType) {
    case 'String':
      return 'str';
    case 'int':
      return 'int';
    case 'double':
      return 'float';
    case 'bool':
      return 'bool';
    case 'DateTime':
      return 'datetime';
    case 'num':
      return 'float';
    default:
      // Custom types/models remain as is
      return dartType;
  }
}

/// Parse default value from string
dynamic _parseDefaultValue(String value) {
  value = value.trim();

  if (value == 'true') return true;
  if (value == 'false') return false;
  if (value == 'null') return null;

  // Try to parse as number
  if (int.tryParse(value) != null) {
    return int.parse(value);
  }
  if (double.tryParse(value) != null) {
    return double.parse(value);
  }

  // String literal
  if ((value.startsWith("'") && value.endsWith("'")) ||
      (value.startsWith('"') && value.endsWith('"'))) {
    return value.substring(1, value.length - 1);
  }

  // Empty list
  if (value == '[]') return [];

  // Empty map
  if (value == '{}') return {};

  // Enum or other complex value
  return value;
}

/// Write schema to JSON file
Future<void> _writeSchema(
  File sourceFile,
  Map<String, dynamic> schema,
  Directory outputDir,
  String source,
) async {
  final className = schema['className'];
  final fields = schema['fields'] as List;
  final enums = schema['enums'] as List;

  // Extract just the file name from the source file
  final fileName = sourceFile.path.split(Platform.pathSeparator).last;
  final fileNameWithoutExt = fileName.replaceFirst('.dart', '');

  // Generate JSON schema
  final jsonSchema = {
    'model_name': className,
    'source': source, // shared, fan_app, or driver_app
    'source_file': fileName,
    'generated_at': DateTime.now().toIso8601String(),
    'fields': fields.map((field) {
      final fieldName = field['name'] as String;
      final dartType = field['type'] as String;
      final pythonType = _toPythonType(dartType);

      // Use jsonKey if available, otherwise convert field name to snake_case
      final finalFieldName = field['jsonKey'] ?? _toSnakeCase(fieldName);

      final fieldSchema = <String, dynamic>{
        'name': finalFieldName,
        'type': pythonType,
        'required': field['required'],
        'nullable': field['nullable'],
      };

      // Add item_type for list fields
      if (dartType.startsWith('List<')) {
        final innerType = dartType.substring(5, dartType.length - 1);
        fieldSchema['item_type'] = innerType;
      }

      if (field['defaultValue'] != null) {
        fieldSchema['default_value'] = field['defaultValue'];
      }

      return fieldSchema;
    }).toList(),
  };

  if (enums.isNotEmpty) {
    jsonSchema['enums'] = enums;
  }

  // Generate output filename
  final outputFileName = '$fileNameWithoutExt.json';

  final outputFile = File(
    '${outputDir.path}${Platform.pathSeparator}$outputFileName',
  );

  // Create parent directories if needed
  if (!outputFile.parent.existsSync()) {
    outputFile.parent.createSync(recursive: true);
  }

  // Write formatted JSON
  const encoder = JsonEncoder.withIndent('  ');
  final prettyJson = encoder.convert(jsonSchema);
  await outputFile.writeAsString(prettyJson);
}
