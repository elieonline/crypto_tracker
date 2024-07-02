import 'package:crypto_tracker/core/extensions/texttheme_extension.dart';
import 'package:crypto_tracker/core/utils/utils.dart';
import 'package:crypto_tracker/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class CompareAssetPage extends ConsumerStatefulWidget {
  const CompareAssetPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CompareAssetPageState();
}

class _CompareAssetPageState extends ConsumerState<CompareAssetPage> {
  late TextEditingController _coinA, _coinB;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Compare Assets", style: textTheme(context).text1SemiBold),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: SearchField(
                      searchController: _coinA,
                      label: "Coin A",
                    ),
                  ),
                  const Spacing.width(12),
                  Expanded(
                    child: SearchField(
                      searchController: _coinB,
                      label: "Coin B",
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Table(
                    children: const [],
                  ),
                ),
              ),
              AppButton(
                text: 'Compare',
                onPressed: () {},
              ),
            ],
          ),
        ));
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
