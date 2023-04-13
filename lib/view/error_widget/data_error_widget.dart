import 'package:flutter/material.dart';
import 'package:mp_pull_to_refresh/smart_refresher.dart';
import 'package:newcase/styles/styles.dart';
import 'package:newcase/view/native_size_extension.dart';
import 'package:newcase/view/pull_to_refresh/app_refresh_indicator.dart';

/// Data error widget
class DataErrorWidget extends StatelessWidget {
  /// DataErrorWidget
  const DataErrorWidget({
    key,
    this.title = 'Đã xảy ra lỗi',
    this.content =
        'Không thể mở dữ liệu. Có thể dữ liệu bị lỗi hoặc đã được gỡ bỏ.',
    this.visibilityRefreshButton = true,
    this.onTapRefresh,
    this.alignment = Alignment.center,
    required this.refreshController
  }) : super(key: key);

  /// Title
  final String title;

  /// Content if data empty
  final String content;

  /// Visibility button
  final bool visibilityRefreshButton;

  /// Click refresh button
  final VoidCallback? onTapRefresh;

  /// Alignment
  final Alignment alignment;

  final RefreshController refreshController;

  @override
  Widget build(BuildContext context) {
    return AppRefreshIndicator(
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
                'assets/images/bg_data_error.png',
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: $style.insets.md),
                child: Text(
                  content,
                  style: $style.texts.body.copyWith(
                    color: $style.colors.grayColorN200,
                  ),
                  textAlign: TextAlign.center,
                ),
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
