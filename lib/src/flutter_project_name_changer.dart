import 'dart:io';
import 'package:yaml/yaml.dart';

void renameProject(String directory, String newProjectName) {
  final directoryPath = Directory(directory);
  if (!directoryPath.existsSync()) {
    print('Directory not found: $directory');
    return;
  }

  // Read the pubspec.yaml file
  final pubspecFile = File('$directory/pubspec.yaml');
  if (!pubspecFile.existsSync()) {
    print('pubspec.yaml not found in the directory: $directory');
    return;
  }

  // Read the contents of pubspec.yaml as YAML
  final pubspecYamlContent = pubspecFile.readAsStringSync();
  final pubspecYaml = loadYaml(pubspecYamlContent);

  // Get the current project name
  final currentProjectName = pubspecYaml['name'] ?? 'old_project_name';

  // Update the project name in the YAML content with the new project name
  final updatedPubspecYamlContent = pubspecYamlContent.replaceAll(currentProjectName, newProjectName);
  pubspecFile.writeAsStringSync(updatedPubspecYamlContent);

  print('Project name updated in pubspec.yaml');

  // Rename occurrences in Dart files
  final dartFiles = directoryPath.listSync(recursive: true, followLinks: false)
      .where((entity) => entity.path.endsWith('.dart') && FileSystemEntity.isFileSync(entity.path))
      .toList();

  for (var file in dartFiles) {
    final lines = File(file.path).readAsLinesSync();
    final updatedLines = <String>[];

    for (var line in lines) {
      final updatedLine = line.replaceAll(currentProjectName, newProjectName);
      updatedLines.add(updatedLine);
    }

    File(file.path).writeAsStringSync(updatedLines.join('\n'));
    print('Renamed occurrences in: ${file.path}');
  }

  print('Renaming process complete.');
}