
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

typedef ZMConsumerBuilder = Widget Function(BuildContext context, Widget child);

class ZMProvider {

  static ChangeNotifierProvider builder({
    @required ChangeNotifier value,
    @required ZMConsumerBuilder builder,
  }){
    return ChangeNotifierProvider.value(
      value: value,
      child: Consumer(builder: (context, ChangeNotifier _, child){
        return builder(
          context,
          child,
        );
      })
    );
  }


}