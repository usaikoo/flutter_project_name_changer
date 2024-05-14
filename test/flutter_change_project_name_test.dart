import 'dart:io';

import 'package:flutter_project_name_changer/flutter_change_project_name.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  test('Test renaming logic', () {
    // Define test inputs
    final oldProjectName = 'OldProjectName';
    final newProjectName = 'NewProjectName';
    final directory = '/Users/saiko/Desktop/AABB_Market';

    // Execute the renaming logic
    renameProject(directory, oldProjectName, newProjectName);

    // Verify the output
    final dartFiles = Directory(directory).listSync(recursive: true)
        .where((entity) => entity.path.endsWith('.dart') && FileSystemEntity.isFileSync(entity.path));

    for (var file in dartFiles) {
      final lines = File(file.path).readAsLinesSync();
      expect(lines.any((line) => line.contains(oldProjectName)), isFalse);
      expect(lines.any((line) => line.contains(newProjectName)), isTrue);
    }
  });
}
