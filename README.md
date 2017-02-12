# Modal Dialog System

A minimalist modal dialog system.

![alert](https://cloud.githubusercontent.com/assets/5312427/22860349/5ccb9f36-f0fb-11e6-88f1-748e6927019a.png)

![confirm](https://cloud.githubusercontent.com/assets/5312427/22860351/69f9c746-f0fb-11e6-87e7-edb0f68263de.png)

## Usage

This package contains a basic CSS skin (mdialog.css) and two themes (blue.css and dark.css). Load them from your web page:
```html
<html>
  <title>test</title>
  <link rel="stylesheet" href="packages/mdialog/css/mdialog.css">
  <link rel="stylesheet" href="packages/mdialog/css/themes/dark.css">
```

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

## Create custom dialogs

The library provides two classes to create custom modal dialogs: `ModalWindow` and `ModalBlock`. The following code creates a modal loading interface.

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
