import 'dart:io';

void main(List<String> args) {
  if (args.length != 3) {
    print('Usage: dart rename_project.dart <old_project_name> <new_project_name> <directory>');
    return;
  }

  final oldProjectName = args[0];
  final newProjectName = args[1];
  final directory = args[2];

  renameProject(directory, oldProjectName, newProjectName);
}

void renameProject(String directory, String oldProjectName, String newProjectName) {
  final directoryPath = Directory(directory);
  if (!directoryPath.existsSync()) {
    print('Directory not found: $directory');
    return;
  }

  final dartFiles = directoryPath.listSync(recursive: true, followLinks: false)
      .where((entity) => entity.path.endsWith('.dart') && FileSystemEntity.isFileSync(entity.path))
      .toList();

  for (var file in dartFiles) {
    final lines = File(file.path).readAsLinesSync();
    final updatedLines = <String>[];

    for (var line in lines) {
      final updatedLine = line.replaceAll(oldProjectName, newProjectName);
      updatedLines.add(updatedLine);
    }

    File(file.path).writeAsStringSync(updatedLines.join('\n'));
    print('Renamed occurrences in: ${file.path}');
  }

  print('Renaming process complete.');
}
