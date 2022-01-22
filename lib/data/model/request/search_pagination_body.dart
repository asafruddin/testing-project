import 'package:json_annotation/json_annotation.dart';

part 'search_pagination_body.g.dart';

@JsonSerializable(createFactory: false)
class SearchPaginationBody {
  final String? searchKey;
  final int? page;

  SearchPaginationBody({this.searchKey, this.page});

  Map<String, dynamic> toJson() => _$SearchPaginationBodyToJson(this);
}
