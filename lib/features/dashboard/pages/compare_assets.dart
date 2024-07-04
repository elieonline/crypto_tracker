import 'package:crypto_tracker/core/enums/enums.dart';
import 'package:crypto_tracker/core/extensions/data_types_extensions.dart';
import 'package:crypto_tracker/core/extensions/texttheme_extension.dart';
import 'package:crypto_tracker/core/utils/utils.dart';
import 'package:crypto_tracker/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/cryptocurrency_model.dart';
import '../notifiers/crypto_notifier.dart';

@RoutePage()
class CompareAssetPage extends ConsumerStatefulWidget {
  const CompareAssetPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CompareAssetPageState();
}

class _CompareAssetPageState extends ConsumerState<CompareAssetPage> {
  late TextEditingController _coinA, _coinB;
  Cryptocurrency? selectedCoinA, selectedCoinB;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loadState = ref.watch(cryptoNotifier.select((value) => value.detailsLoadState));
    final details = ref.watch(cryptoNotifier.select((value) => value.details));
    final errorMessage = ref.watch(cryptoNotifier.select((value) => value.errorMessage));
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Compare Assets", style: textTheme(context).text1SemiBold),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Row(
                  children: [
                    Expanded(
                      child: SearchField(
                        searchController: _coinA,
                        label: "Coin A",
                        validator: Validators.notEmpty(),
                        onPressed: (coin) {
                          setState(() {
                            selectedCoinA = coin;
                            _coinA.text = coin.name ?? "";
                          });
                        },
                      ),
                    ),
                    const Spacing.width(12),
                    Expanded(
                      child: SearchField(
                        searchController: _coinB,
                        label: "Coin B",
                        validator: Validators.notEmpty(),
                        onPressed: (coin) {
                          setState(() {
                            selectedCoinB = coin;
                            _coinB.text = coin.name ?? "";
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Spacing.bigHeight(),
              Expanded(
                child: Builder(builder: (context) {
                  if (loadState == LoadState.loading) {
                    return Center(
                      child: CircularProgressIndicator(color: appColors(context).primary),
                    );
                  }

                  if (loadState == LoadState.error) {
                    return EmptyErrorWidget(
                      title: "Error Occured",
                      message: errorMessage ?? "Unable to fetch coins information, kindly try again.",
                    );
                  }

                  if (loadState == LoadState.idle || details.length < 2) {
                    return const EmptyErrorWidget(
                      title: "Select Coin Pair",
                      message: "Select two coins you'll like to compare",
                    );
                  }

                  return SingleChildScrollView(
                    child: Table(
                        border: TableBorder.all(
                          width: 0.5,
                          color: appColors(context).onSurface,
                        ),
                        children: [
                          TableRow(
                            children: [
                              tableText("Coin"),
                              tableText(_coinA.text, style: textTheme(context).text2SemiBold),
                              tableText(_coinB.text, style: textTheme(context).text2SemiBold),
                            ],
                          ),
                          TableRow(
                            children: [
                              tableText("Logo"),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network("${details[0].image}", height: 40, width: 40),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network("${details[1].image}", height: 40, width: 40),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              tableText("Price USD"),
                              tableText("\$${details[0].currentPrice.formatAmount}"),
                              tableText("\$${details[1].currentPrice.formatAmount}"),
                            ],
                          ),
                          TableRow(
                            children: [
                              tableText("Market Cap"),
                              tableText("\$${details[0].marketCap.formatAmount}"),
                              tableText("\$${details[1].marketCap.formatAmount}"),
                            ],
                          ),
                          TableRow(
                            children: [
                              tableText("Price Change 24h"),
                              tableText("\$${details[0].priceChange24H.formatAmount}"),
                              tableText("\$${details[1].priceChange24H.formatAmount}"),
                            ],
                          ),
                          TableRow(
                            children: [
                              tableText("Total Volume"),
                              tableText("\$${details[0].totalVolume.formatAmount}"),
                              tableText("\$${details[1].totalVolume.formatAmount}"),
                            ],
                          ),
                          TableRow(
                            children: [
                              tableText("Max Supply"),
                              tableText("\$${details[0].maxSupply.formatAmount}"),
                              tableText("\$${details[1].maxSupply.formatAmount}"),
                            ],
                          ),
                          TableRow(
                            children: [
                              tableText("Total Supply"),
                              tableText("\$${details[0].totalSupply.formatAmount}"),
                              tableText("\$${details[1].totalSupply.formatAmount}"),
                            ],
                          ),
                        ]),
                  );
                }),
              ),
              const Spacing.bigHeight(),
              AppButton(
                text: 'Compare',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (selectedCoinA?.id == selectedCoinB?.id) {
                      AppOverlay.of(context).showMessage(
                        message: 'You cannot compare the same coin',
                        messageType: MessageType.error,
                      );
                      return;
                    }
                    ref.read(cryptoNotifier.notifier).fetchCryptoDetails(
                          "${selectedCoinA?.id},${selectedCoinB?.id}",
                        );
                  }
                },
              ),
            ],
          ),
        ));
  }

  Widget tableText(String text, {TextStyle? style}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(text, style: style ?? textTheme(context).text1Regular),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _coinA = TextEditingController();
    _coinB = TextEditingController();
  }

  @override
  void dispose() {
    _coinA.dispose();
    _coinB.dispose();
    super.dispose();
  }
}
