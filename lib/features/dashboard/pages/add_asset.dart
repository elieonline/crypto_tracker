import 'package:crypto_tracker/core/enums/enums.dart';
import 'package:crypto_tracker/core/extensions/texttheme_extension.dart';
import 'package:crypto_tracker/core/utils/utils.dart';
import 'package:crypto_tracker/features/dashboard/data/cryptocurrency_model.dart';
import 'package:crypto_tracker/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifiers/crypto_notifier.dart';

@RoutePage()
class AddAssetPage extends ConsumerStatefulWidget {
  const AddAssetPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddAssetPageState();
}

class _AddAssetPageState extends ConsumerState<AddAssetPage> {
  late TextEditingController _coin, _unit, _buyPrice;
  Cryptocurrency? selectedCrypto;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    _listener();
    final notifier = ref.read(cryptoNotifier.notifier);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Asset", style: textTheme(context).text1SemiBold),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          children: [
            SearchField(
              searchController: _coin,
              label: "Coin",
              validator: Validators.notEmpty(),
              onPressed: (coin) {
                setState(() {
                  selectedCrypto = coin;
                  _coin.text = coin.name ?? "";
                });
              },
            ),
            const Spacing.bigHeight(),

            //amount
            AppFormField(
              controller: _unit,
              label: "Unit",
              hintText: "Total unit bought",
              keyboardType: TextInputType.number,
              validator: Validators.notEmpty(),
              textInputAction: TextInputAction.next,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
              ],
            ),

            //amount
            AppFormField(
              controller: _buyPrice,
              label: "Buy Price",
              hintText: "Coin price when bought",
              validator: Validators.amount(),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                NumFormatter(),
              ],
            ),
            const Spacing.height(150),

            //button

            AppButton(
              text: 'Add',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  notifier.addAsset(
                    selectedCrypto!,
                    unit: double.parse(_unit.text),
                    buyPrice: double.parse(
                      _buyPrice.text.replaceAll(',', ''),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _listener() {
    ref.listen(cryptoNotifier, (previous, next) {
      if (next.assetLoadState == LoadState.loading) {
        AppOverlay.of(context).controller.showLoader();
        return;
      }

      if (next.assetLoadState == LoadState.success) {
        AppOverlay.of(context).controller.removeOverLay();
        resetForm();
        AppBottom.sheet(
          context: context,
          child: SuccessBottomSheet(
            title: "Successful",
            message: "Asset added to portfolio successfully",
            button: AppButton(
              text: 'Done',
              onPressed: () {
                Navigator.pop(context);
                appRouter.replace(const DashboardRoute());
              },
            ),
          ),
        );
      }

      if (next.assetLoadState == LoadState.error) {
        AppOverlay.of(context).controller.removeOverLay();
        resetForm();
        AppOverlay.of(context).controller.showMessage(
              message: next.errorMessage ?? "Error occured while adding asset",
              title: "Failed!",
              messageType: MessageType.error,
            );
      }
    });
  }

  void resetForm() {
    ref.read(cryptoNotifier.notifier).reset();
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
