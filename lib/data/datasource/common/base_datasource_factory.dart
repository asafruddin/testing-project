abstract class BaseDataSourceFactory<T> {
  T createData(DataSouceState dataSouceState);
}

enum DataSouceState { network, local }
