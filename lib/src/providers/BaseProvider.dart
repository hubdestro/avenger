import 'package:flutter/cupertino.dart';

import 'Status.dart';

class BaseProvider extends ChangeNotifier {
  Status status = Status.Initial;
}
