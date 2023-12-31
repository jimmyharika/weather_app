import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/src/data/app_colors.dart';

final cityProvider = StateProvider<String>((ref) {
  return 'London';
});

class CitySearchBox extends ConsumerStatefulWidget {
  const CitySearchBox({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CitySearchBoxState();
}

class _CitySearchBoxState extends ConsumerState<CitySearchBox> {
  late final _searchController = TextEditingController();
  static const _radius = 30.0;
  @override
  void initState() {
    super.initState();
    _searchController.text = ref.read(cityProvider);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              height: 50,
              child: TextField(
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black),
                controller: _searchController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(_radius),
                      bottomLeft: Radius.circular(_radius),
                    ),
                  ),
                ),
                onSubmitted: (value) =>
                    ref.read(cityProvider.notifier).state = value,
              ),
            ),
          ),
          InkWell(
              child: Container(
                height: 50,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColors.accentColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(_radius),
                    bottomRight: Radius.circular(_radius),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text("search"),
                ),
              ),
              onTap: () {
                FocusScope.of(context).unfocus();
                ref.read(cityProvider.notifier).state = _searchController.text;
              })
        ],
      ),
    );
  }
}
