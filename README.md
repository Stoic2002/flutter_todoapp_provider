# flutter_todoapp_provider

simple todo app with provider state management

## Features

-   CRUD todo
-   Local database with sqflite
-   Mark todo as complete and incomplete

## Dependencies

-   provider:
-   path:
-   sqflite:

## Project structure

```
lib/
  ├──models/
  │  └── todo_model.dart   
  ├──providers/
  │  └── todo_provider.dart 
  ├──screens/
  │  └── add_todo_screen.dart 
  |  └── edit_todo_screen.dart
  |  └── home_screen.dart
  ├──services/
  │  └── database_helper.dart 
  ├──widgets/
  │  └── todo_list_item.dart 
  └── main.dart
```

## Getting started

1.  Ensure you have Flutter installed on your machine. For installation instructions, refer to the official Flutter website.

2.  Clone this repository:
```
   git clone https://github.com/Stoic2002/flutter_todoapp_provider.git
```  
3.  Navigate to the project directory:
```
   cd flutter_todoapp_provider
```
4.  Install the dependencies:
```
   flutter pub get
```
5.  Run the app:
```
   flutter run
```

## Usage

-   To add a new todo, tap the floating action button and enter the todo title in the       dialog that appears.
-   To mark a todo as complete or incomplete, tap the checkbox next to the todo.
-   To edit a todo, tap the item
-   To delete a todo, swipe the todo item from right to left.


