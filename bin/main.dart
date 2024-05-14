import 'package:flutter_project_name_changer/flutter_project_name_changer.dart';

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