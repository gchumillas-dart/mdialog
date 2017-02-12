# Modal Dialog System

A minimalist modal dialog system.

## Usage

Example:

```dart
import 'package:mdialog/mdialog.dart';

main() async {
  await alert('We will proceed to format the Hard Disk');
  print('Ok, you\'ve been alerted');

  if (await confirm('Are you sure?')) {
    print('Formating Hard Disk ...');
  }
}
```

## Create custom modal dialogs

This library provides two classes to create custom modal dialogs: `ModalWindow` and `ModalBlock`. The following code creates a custom modal dialog interface.

```dart
import 'dart:html';
import 'package:mdialog/mdialog.dart';

class ModalLoading {
  final _modalWindow = new ModalWindow();

  ModalLoading() {
    _modalWindow.add(new ModalBlock('header')..text = 'Loading request');
    _modalWindow.add(new ModalBlock('body')..text = 'Please wait ...');
    _modalWindow.open();
  }

  void close() => _modalWindow.close();
}

main() async {
  final loading = new ModalLoading();

  try {
    await HttpRequest.getString('http://www.google.com');
  } catch (e) {
    await alert('Error processing the request');
  } finally {
    loading.close();
  }
}
```


## Features and bugs

Please file feature requests and bugs at the [Issue Tracker](https://github.com/gchumillas-dart/mdialog/issues).
