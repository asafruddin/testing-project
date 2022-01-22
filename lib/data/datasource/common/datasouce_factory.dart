import 'package:testing_project/data/datasource/binding/binding_remote.dart';
import 'package:testing_project/data/datasource/binding_data_sources.dart';
import 'package:testing_project/data/datasource/common/base_datasource_factory.dart';

class BindingDataSourceFactory
    extends BaseDataSourceFactory<BindingDataSources> {
  BindingDataSourceFactory({
    required BindingRemote bindingRemote,
  }) : _bindingRemote = bindingRemote;

  final BindingRemote? _bindingRemote;

  @override
  BindingDataSources createData(DataSouceState dataSouceState) {
    switch (dataSouceState) {
      case DataSouceState.local:
        return _bindingRemote!;
      case DataSouceState.network:
        return _bindingRemote!;
    }
  }
}
