import 'package:flutter/widgets.dart';
import 'package:mp_pull_to_refresh/indicator/classic_footer.dart';
import 'package:mp_pull_to_refresh/indicator/classic_header.dart';
import 'package:mp_pull_to_refresh/smart_refresher.dart';
import 'package:newcase/styles/styles.dart';

class AppRefreshIndicator extends StatelessWidget {
  /// AppRefreshIndicator
  const AppRefreshIndicator({
    required this.child,
    required this.controller,
    this.scrollController,
    this.onRefresh,
    this.onLoadMore,
    this.enablePullUp = false,
    this.enablePullDown = true,
  });

  /// Controller inner state
  final RefreshController controller;

  /// Scroll controller
  final ScrollController? scrollController;

  /// Refresh Content
  /// notice that: If child is  extends ScrollView,It will help you get the
  /// internal slivers and add footer and header in it.
  /// else it will put child into SliverToBoxAdapter and add footer and header
  final Widget child;

  /// callback when header refresh
  final VoidCallback? onRefresh;

  /// load more callback
  final VoidCallback? onLoadMore;

  /// enablePullUp
  final bool enablePullUp;

  /// enablePullDown
  final bool enablePullDown;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      header: ClassicHeader(
        refreshingText: 'Đang tải lại',
        releaseText: 'Thả để tải lại',
        completeText: 'Đã tải xong',
        failedText: 'Đã xảy ra lỗi khi tải lại',
        idleText: 'Kéo xuống để tải lại',
        textStyle: $style.texts.subHeadline.copyWith(
          color: $style.colors.neutral200,
        ),
      ),
      footer: ClassicFooter(
        noDataText: 'Không có dữ liệu',
        loadingText: 'Đang tải...',
        failedText: 'Tải thêm thất bại',
        idleText: 'Tải thêm',
        canLoadingText: 'Thả để tải thêm',
        textStyle: $style.texts.subHeadline.copyWith(
          color: $style.colors.neutral200,
        ),
      ),
      refreshController: controller,
      scrollController: scrollController,
      onRefresh: onRefresh,
      onLoading: onLoadMore,
      enablePullUp: enablePullUp,
      enablePullDown: enablePullDown,
      child: child,
    );
  }
}
