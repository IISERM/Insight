# Hive
Hive is a light-weight fast key-value pair database. Think of it as a dictionary/map based storage system.\
The hive is a key-value pair collection of boxes, where each box is a key-value pair storage. So one can think of hive as a dictionary/map of dictionaries/maps.

Relevant documentation:
- [Pub Dev](https://pub.dev/packages/hive): Quick Reference.
- [Documentation and Tutorials](https://docs.hivedb.dev/#/): Documentation and Tutorials on Hive. 
- [API Reference](https://pub.dev/documentation/hive/latest/): API Reference for everything that is found in Hive.

## Quick Start
### Opening a Box
When opening a box for the first time, you need to await the results from `openBox()`.
```dart
Box<Student> studentBox = await Hive.openBox<Student>("student_box");
```

If a box is already open, we can simply get the box by using the following code:
```dart
Box<Student> studentBox = Hive.box<Student>("student_box");
```

### Adding Data
After fetching the box, we can add data to the box using the following code:
```dart
Student student = Student("John Doe", "Physics");
studentBox.put("ms69420", student);
```

### Accessing Data
We can access data from the box using the following code:
```dart
Student student = studentBox.get("ms69420");
print(student.name);
print(student.subject);
```

### Modifying Data
We can modify data in the box using the following code:
```dart
Student student = studentBox.get("ms69420");
student.name = "Jane Doe";
studentBox.put("ms69420", student);
```

### Removing Data
We can remove data from the box using the following code:
```dart
studentBox.delete("ms69420");
```

### Closing the Box
After we are done with the box, we can close the box using the following code:
```dart
studentBox.close();
```
