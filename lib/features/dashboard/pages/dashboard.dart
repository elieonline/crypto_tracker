import 'package:crypto_tracker/core/extensions/data_types_extensions.dart';
import 'package:crypto_tracker/core/extensions/texttheme_extension.dart';
import 'package:crypto_tracker/core/utils/utils.dart';
import 'package:crypto_tracker/features/dashboard/data/crypto_repository_impl.dart';
import 'package:crypto_tracker/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../notifiers/crypto_notifier.dart';
import '../widgets/app_bar.dart';
import '../widgets/filter_menu.dart';

@RoutePage()
class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  String? filterValue = "Name";
  @override
  Widget build(BuildContext context) {
    final assets = ref.watch(assetProvider);
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: dashAppBar(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => appRouter.push(const CompareAssetRoute()),
          backgroundColor: appColors(context).primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          label: Text(
            "Compare Assets",
            style: textTheme(context).text1Regular.copyWith(color: Colors.white),
          ),
        ),
        body: SmartRefresher(
          controller: _refreshController,
          onRefresh: _onRefresh,
          enablePullDown: true,
          enablePullUp: false,
          header: WaterDropHeader(waterDropColor: appColors(context).primary),
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            children: [
              //search
              const SearchField(),
              const Spacing.height(30),

              //balance
              Text("Total Balance", style: textTheme(context).textMedium),
              Text(
                "\$16,534.08",
                style: textTheme(context).header1Bold.copyWith(fontSize: 26),
              ),
              Text(
                "+\$6,534.08",
                style: textTheme(context).textSemiBold.copyWith(
                      color: appColors(context).success,
                    ),
              ),
              const Spacing.bigHeight(),

              //portfolio
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Assets",
                    style: textTheme(context).text2SemiBold,
                  ),
                  FilterMenu(
                    value: filterValue,
                    onChanged: (p0) {
                      setState(() {
                        filterValue = p0;
                      });
                    },
                  ),
                ],
              ),
              const Spacing.mediumHeight(),
              if (assets.isEmpty) ...[
                EmptyErrorWidget(
                  bottom: AppButton(
                    onPressed: () => appRouter.push(const AddAssetRoute()),
                    text: '+ Add Asset',
                  ),
                ),
              ] else ...[
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: assets.length,
                    separatorBuilder: (ctx, _) => const Spacing.tinyHeight(),
                    itemBuilder: (_, index) {
                      final asset = assets[index];
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        leading: Image.network(
                          "${asset.assetLogo}",
                          height: 24,
                          width: 24,
                        ),
                        title: Text(
                          "${asset.assetName}",
                          style: textTheme(context).text2SemiBold.copyWith(fontSize: 18),
                        ),
                        subtitle: Text(
                          "${asset.unit} (\$${asset.buyValue.formatAmount})",
                          style: textTheme(context).textRegular.copyWith(
                                fontSize: 13,
                                color: appColors(context).onSurface.withOpacity(0.7),
                              ),
                        ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "\$6,456.88",
                              style: textTheme(context).text2Bold.copyWith(fontSize: 18),
                            ),
                            Text(
                              "+\$74.55(1.56%)",
                              style: textTheme(context).textRegular.copyWith(
                                    color: (index % 2) == 0 ? appColors(context).success : appColors(context).error,
                                  ),
                            ),
                          ],
                        ),
                      );
                    }),
                const Spacing.smallHeight(),
                AppButton(
                  text: '+ Add Asset',
                  buttonStyle: AppButtonStyle.secondary(context),
                  onPressed: () => appRouter.push(const AddAssetRoute()),
                )
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _onRefresh() async {
    ref.read(cryptoNotifier.notifier).fetchAssets();
    Future.delayed(
      const Duration(milliseconds: 1500),
      () => _refreshController.refreshCompleted(),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(cryptoNotifier.notifier).fetchCryptoList();
    });
  }
}
