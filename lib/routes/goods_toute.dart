
import 'package:fire_shop/pages/goods/goods_detail/goods_detail_page.dart';
import 'package:fire_shop/pages/goods/search/goods_search_history_page.dart';

final goodsDetailFunction = (context, {arguments}) => GoodsDetailPage(id: arguments["id"].toString(),);

final goodsHistoryFunction = (context, {arguments}) => GoodsSearchHistoryPage();