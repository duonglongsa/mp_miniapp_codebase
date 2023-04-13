import 'package:flutter/material.dart';
import 'package:mp_pull_to_refresh/smart_refresher.dart';
import 'package:newcase/styles/styles.dart';
import 'package:newcase/view/native_size_extension.dart';
import 'package:newcase/view/pull_to_refresh/app_refresh_indicator.dart';

/// Widget data empty
class DataEmptyWidget extends StatelessWidget {
  /// EmptyListWidget
  const DataEmptyWidget({
    key,
    this.title = 'Không có dữ liệu',
    this.content = '',
    this.visibilityRefreshButton = true,
    this.onTapRefresh,
    required this.refreshController,
    this.enablePullDown = true
  }) : super(key: key);

  /// Title
  final String title;

  /// Content if data empty
  final String content;

  /// Visibility button
  final bool visibilityRefreshButton;

  /// Click refresh button
  final VoidCallback? onTapRefresh;

  final RefreshController refreshController;

  final bool enablePullDown;
  @override
  Widget build(BuildContext context) {
    return AppRefreshIndicator(
      enablePullDown: enablePullDown,
      onRefresh: () async {
        onTapRefresh?.call();
      },
      controller: refreshController,
      child: ListView(
        children: [
          SizedBox(
            height: 60.0.getHeight(context),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: $style.insets.md),
              child: Image.asset(
                'assets/images/bg_data_empty.png',
                width: 325,
                height: 210,
              ),
            ),
          ),
          SizedBox(
            height: 60.0.getHeight(context),
          ),
          Center(
            child: Text(
              title,
              style: $style.texts.headLineBold.copyWith(
                color: $style.colors.blackColorN400,
              ),
            ),
          ),
          if (content.isNotEmpty) ...[
            const SizedBox(
              height: 12,
            ),
            Center(
              child: Text(
                content,
                style: $style.texts.body.copyWith(
                  color: $style.colors.grayColorN200,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
          if (visibilityRefreshButton) ...[
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/ic_refresh.png',
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 4),
                Text(
                  'Kéo xuống để tải lại trang',
                  style: $style.texts.callout.copyWith(
                    color: $style.colors.neutral300,
                  ),
                )
              ],
            )
          ]
        ],
      ),
    );
  }
}
