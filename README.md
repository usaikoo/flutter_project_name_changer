# Flutter Project Name Changer

Flutter Project Name Changer is a Dart package for programmatically renaming occurrences of a project name in Dart files. This package provides a convenient way to automate the process of updating project names across multiple files in a Dart project.

## Features

- Rename occurrences of the old project name to the new project name in Dart files.
- Works with various types of code including variables, strings, comments, import statements, etc.
- Supports renaming in multiple Dart files within different directory structures.
- Handles edge cases such as case sensitivity, partial matches, etc.

## Installation

To use this package, add `flutter_project_name_changer` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_project_name_changer: ^1.0.0




dart run flutter_package_name_changer my_old_project_name my_new_project_name /path/to/your/project
