import 'package:flutter/material.dart';
import 'package:flutter_tutorial_currency_converter_app/feature/currency_conversion/domain/entities/currency_entity.dart';

class ContainerSelector extends StatelessWidget {
  const ContainerSelector(
      {required this.options,
      required this.onChanged,
      this.selectedCurrency,
       required this.height,
      super.key});

  final List<CurrencyEntity> options;
  final void Function(CurrencyEntity currency) onChanged;
  final CurrencyEntity? selectedCurrency;
  final double height;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 400,
      height: height,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 4,
              spreadRadius: 0,
              color: Color.fromRGBO(0, 0, 0, 0.25)
          )
        ],
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: ListView.builder(itemBuilder: (context, index) {
          final item = options[index];
          return GestureDetector(
            onTap: () => onChanged(item),
            child: AnimatedDefaultTextStyle(
              style: const TextStyle(color: Colors.black),
              duration: const Duration(milliseconds: 300),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  borderRadius: item == selectedCurrency? BorderRadius.circular(24): BorderRadius.zero,
                  color: item == selectedCurrency ? Colors.green : Colors.transparent,

                ),
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Text(item.name),
                    const SizedBox(width: 16,),
                    Text(item.symbol),
                    const SizedBox(width: 16,),
                    if (item.symbol != item.symbolNative) Text(item.symbolNative,),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: options.length,
        ),
      ),
    );
  }
}
