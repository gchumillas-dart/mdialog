//import 'package:modal_dialog/core.dart';
import 'package:modal_dialog/modal_dialog.dart';

main() async {
  await alert('It works!');
  if (await confirm('Are you sure?')) {
    print('ok');
  }
}
