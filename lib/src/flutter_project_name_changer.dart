import 'dart:io';



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
