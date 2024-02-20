abstract class LayerDataTransformer<F, T> {
  T transform();

  F restore(T data);
}
