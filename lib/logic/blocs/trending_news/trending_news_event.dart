abstract class TrendingNewsEvent {}

class GetAllTrendingNewsEvent extends TrendingNewsEvent {
  String searchKeyword;

  GetAllTrendingNewsEvent({required this.searchKeyword});
}
