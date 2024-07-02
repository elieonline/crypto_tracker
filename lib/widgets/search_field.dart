// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crypto_tracker/core/enums/enums.dart';
import 'package:crypto_tracker/core/extensions/texttheme_extension.dart';
import 'package:crypto_tracker/core/utils/utils.dart';
import 'package:crypto_tracker/features/dashboard/data/crypto_repository_impl.dart';
import 'package:crypto_tracker/features/dashboard/data/cryptocurrency_model.dart';
import 'package:crypto_tracker/features/dashboard/notifiers/crypto_notifier.dart';
import 'package:crypto_tracker/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    this.searchController,
    this.hintText,
    this.label,
    this.validator,
    this.onPressed,
  });
  final TextEditingController? searchController;
  final String? hintText, label;
  final String? Function(String?)? validator;
  final void Function(Cryptocurrency coin)? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppFormField(
      controller: searchController,
      label: label,
      hintText: hintText ?? 'Search for coins',
      borderRadius: 5,
      marginBottom: 0,
      validator: validator,
      constraints: const BoxConstraints(minHeight: 50, maxHeight: 50),
      contentPadding: const EdgeInsets.symmetric(vertical: 10),
      prefixIcon: const Icon(BIcons.search_normal, size: 18),
      readOnly: true,
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return SearchModal(onPressed: onPressed);
          },
        );
      },
    );
  }
}

class SearchModal extends ConsumerStatefulWidget {
  const SearchModal({super.key, this.onPressed});
  final void Function(Cryptocurrency coin)? onPressed;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchModalState();
}

class _SearchModalState extends ConsumerState<SearchModal> {
  late TextEditingController _query;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const Spacing.height(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 28),
              Text(
                "Choose Coin",
                style: textTheme(context).text1Regular,
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                AppFormField(
                  controller: _query,
                  hintText: 'Search for coins',
                  borderRadius: 5,
                  marginBottom: 16,
                  autofocus: true,
                  constraints: const BoxConstraints(minHeight: 50, maxHeight: 50),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  prefixIcon: const Icon(BIcons.search_normal, size: 18),
                ),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      final state = ref.watch(cryptoNotifier);
                      final cryptos = ref.watch(cryptoProvider);

                      if (state.loadState == LoadState.loading) {
                        return const CustomLoader();
                      }
                      List<Cryptocurrency> filtered = [];

                      if (_query.text.isNotEmpty) {
                        filtered = cryptos.where((element) {
                          String text = "${element.name}";
                          return text.toLowerCase().contains(_query.text.toLowerCase());
                        }).toList();
                      } else {
                        filtered = cryptos;
                      }

                      if (filtered.isEmpty) {
                        return Center(
                          child: Text.rich(
                            TextSpan(
                              text: _query.text.isEmpty
                                  ? (state.errorMessage ?? "Unable to fetch coins")
                                  : "No coin found with ",
                              children: [
                                if (_query.text.isNotEmpty) ...[
                                  TextSpan(
                                    text: "'${_query.text}'",
                                    style: TextStyle(color: appColors(context).primary),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        );
                      }

                      return ListView.separated(
                        itemCount: filtered.length,
                        shrinkWrap: true,
                        separatorBuilder: (c, ind) => const Divider(
                          height: 6,
                          thickness: 0.1,
                        ),
                        itemBuilder: (context, index) {
                          var data = filtered[index];
                          return ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.zero,
                            onTap: () {
                              Navigator.pop(context);
                              widget.onPressed!(data);
                            },
                            title: Text(
                              "${data.name} (${data.symbol})",
                              style: textTheme(context).text,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _query = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _query.dispose();
    super.dispose();
  }
}
