import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hku_app/Util/BaseResponse.dart';

class BaseFutureBuilder extends StatelessWidget {
  final Future future;
  final Widget Function() loadingCallback;
  final Widget Function(BaseResponse response) onSuccessCallback;
  final Widget Function(Exception error) onErrorCallback;
  

  BaseFutureBuilder({
    Key key,
    @required this.future,
    this.loadingCallback,
    this.onSuccessCallback,
    this.onErrorCallback,
  }) : super(key: key);

  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    Widget loadingWidget = Center(child: CircularProgressIndicator());
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        return (this.loadingCallback == null)?loadingWidget: this.loadingCallback();
      case ConnectionState.active:
        return (this.loadingCallback == null)?loadingWidget: this.loadingCallback();
      case ConnectionState.waiting:
        return (this.loadingCallback == null)?loadingWidget: this.loadingCallback();
      case ConnectionState.done:
        if (snapshot.hasError){
          if(this.onErrorCallback == null) return SizedBox();
          return this.onErrorCallback(snapshot.error);
        }
        else{
          if(this.onSuccessCallback == null) return SizedBox();
          return this.onSuccessCallback(snapshot.data);
        }
        break;
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
