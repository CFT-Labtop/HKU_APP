import 'package:flutter/material.dart';
import 'package:hku_app/Util/BaseResponse.dart';

class BaseFutureBuilder extends StatelessWidget {
  final Future future;
  final Widget child;
  final Widget errorChild;
  final void Function(BaseResponse response) onSuccessCallback;
  final void Function(Exception error) onErrorCallback;
  

  BaseFutureBuilder({
    Key key,
    @required this.future,
    @required this.child,
    this.errorChild,
    this.onSuccessCallback,
    this.onErrorCallback,
  }) : super(key: key);

  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    Widget loadingWidget = Center(child: CircularProgressIndicator());
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        return loadingWidget;
      case ConnectionState.active:
        return loadingWidget;
      case ConnectionState.waiting:
        return loadingWidget;
      case ConnectionState.done:
        if (snapshot.hasError){
          this.onErrorCallback(snapshot.error);
          return this.errorChild??SizedBox();
        }
        this.onSuccessCallback(snapshot.data);
        return this.child;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: _buildFuture,
      future: future,
    );
  }
}
