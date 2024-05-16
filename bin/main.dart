import 'package:flutter_project_name_changer/flutter_project_name_changer.dart';
import 'package:args/args.dart';

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