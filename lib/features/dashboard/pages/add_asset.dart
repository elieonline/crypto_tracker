import 'package:crypto_tracker/core/extensions/texttheme_extension.dart';
import 'package:crypto_tracker/core/utils/utils.dart';
import 'package:crypto_tracker/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class AddAssetPage extends ConsumerStatefulWidget {
  const AddAssetPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddAssetPageState();
}

class _AddAssetPageState extends ConsumerState<AddAssetPage> {
  late TextEditingController _coin, _unit, _buyPrice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Asset", style: textTheme(context).text1SemiBold),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        children: [
          SearchField(
            searchController: _coin,
          ),
          const Spacing.bigHeight(),

          //amount
          AppFormField(
            controller: _unit,
            label: "Unit",
            hintText: "Total unit bought",
            validator: Validators.amount(),
          ),

          //amount
          AppFormField(
            controller: _buyPrice,
            label: "Buy Price",
            hintText: "Coin price when bought",
            validator: Validators.amount(),
          ),
          const Spacing.height(150),

          //button

          AppButton(
            text: 'Add',
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _coin = TextEditingController();
    _unit = TextEditingController();
    _buyPrice = TextEditingController();
  }

  @override
  void dispose() {
    _coin.dispose();
    _unit.dispose();
    _buyPrice.dispose();
    super.dispose();
  }
}
