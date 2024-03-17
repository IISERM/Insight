# Code Style Guide

Comments are not necessary if the code is self explanatory.
Good code and naming conventions are documentations in themselves.

This document is a guide to the coding style that should be followed in the project.
In this document, any line without the word *prefer* is a rule that **must** be followed.
Any line with the word *prefer* is a rule that **should** be followed if possible.

## Naming Conventions

- Use `camelCase` for variables and functions. Example: `myVariable`, `myFunction()`.
- Use `PascalCase` for classes and enums. Example: `MyClass`.
- Use `UPPER_CASE` for constants. Example: `MY_CONSTANT`.
- Use `snake_case` for file names. Example: `my_file.dart`.
- Append `_` to the start of private variables and functions. Example: `_myPrivateVariable`, `_myPrivateFunction()`.
- Never use abbreviations for variable names. Example: `myVariable` instead of `myVar`.
- Prefer not to use single letter variable names. Example: `myVariable` instead of `a`. Cases where single letter variable names are acceptable if the code block is small:
  - `for` loops.
  - `if` statements.
  - `switch` statements.
- Prefer to use `is` and `has` as prefixes for boolean variables. Example: `isReady`, `hasError`.
- Prefer to use `get` as a prefix for getter functions. Example: `getMyVariable()`.
- Prefer to use `set` as a prefix for setter functions. Example: `setMyVariable()`.
- Prefer to use `on` as a prefix for event functions. Example: `onPressed()`.
- Prefer to use `build` as a prefix for build functions. Example: `buildMyWidget()`.

## File Structure
- We follow Flutter Clean Architecture, to know more about it please check [this video](https://www.youtube.com/watch?v=lpJYUIsWLYw).
-`lib` as the root folder for all files.
- The app is divided into features which contains functionality like `auth`, `homepage`, `srm`, etc. and all of these will be contained in the `features` folder in `lib`.
- Every feature will have its own folder with three subfolders named `interface`, `models`, `providers`. When creating a new feature folder, please create these three folders in it and create a `.gitkeep` file using touch command or such to add them to commit. For more information about these subfolders please take a look at the [clean architecture video](https://www.youtube.com/watch?v=lpJYUIsWLYw).
- In the `interface` folder, all pages should be kept at root whereas all widgets should be put in a folder called `widgets`.
- All **assets** should be inside the `assets` folder. Example: `assets/images`, `assets/fonts`.
- Every theme should have its own file inside the `themes` folder. Example: `themes/defaultLightTheme.dart`.

## Coding Structure
- Prefer to use `const` over `final` for variables that are supposed to be constant. [README](https://en.wikipedia.org/wiki/Inheritance_(object-oriented_programming))
- Prefer `final` variables over `var` variables.
- Never use `dynamic` as a variable type. Always use a specific type instead.
- Prefer to use Dart 's pre-defined types instead of using custom types.
- Use [composition](https://stackify.com/oop-concepts-composition/) rather than [inheritance](https://en.wikipedia.org/wiki/Inheritance_(object-oriented_programming)), when creating new data models.
- If the indentation is not set to 2 spaces, set it to 2 spaces.
- If the indentation level is more than 5, refactor the code.
  - Abstract the code into smaller widgets or functions.
  - Always try to have the false condition of an 'if' statement at the start and return out of the function.
- Prefer to have imports in the following order:
  1. Flutter imports.
  2. Dart imports.
  3. Third party imports.
  4. Project imports.
- Prefer to have variables in the following order:
  1. `const` variables.
  2. `final` variables.
  3. `late` variables.
  4. `static` variables
