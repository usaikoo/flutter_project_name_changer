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

```


## Usage
flutter pub run flutter_project_name_changer:main old_project_name new_project_name /path/to/your/project

example :
old_project_name = flutter_app
new_project_name = new_flutter_app
/path/to/your/project = .

```code
flutter_project_name_changer:main flutter_app  new_flutter_app .
```