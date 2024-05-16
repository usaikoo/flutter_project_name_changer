import 'package:flutter_project_name_change/flutter_project_name_change.dart';
import 'package:args/args.dart';

// void main(List<String> args) {
//   if (args.length != 3) {
//     print('Usage: dart rename_project.dart <old_project_name> <new_project_name> <directory>');
//     return;
//   }

//   final oldProjectName = args[0];
//   final newProjectName = args[1];
//   final directory = args[2];

//   renameProject(directory, oldProjectName, newProjectName);
// }

void main(List<String> arguments) {
  final parser = ArgParser();
  parser.addOption('directory', abbr: 'd', defaultsTo: '.');
  parser.addFlag('help', abbr: 'h', help: 'Prints usage information.');
  parser.addFlag('verbose', abbr: 'v', negatable: false, help: 'Prints more information.');

  final argResults = parser.parse(arguments);

  if (argResults['help'] == true || arguments.isEmpty) {
    print('Usage: dart run bin/main.dart [options] <new_project_name>');
    print(parser.usage);
    return;
  }

  final directory = argResults['directory'] as String;
  final newProjectName = arguments.last;

  renameProject(directory, newProjectName);
}