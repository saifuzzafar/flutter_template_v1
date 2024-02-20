import 'package:core/mapper/layer_data_transformer.dart';

abstract class BaseLayerDataTransformer<F, T>
    extends LayerDataTransformer<F, T> {
  @override
  F restore(T data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  T transform() {
    // TODO: implement transform
    throw UnimplementedError();
  }
}
