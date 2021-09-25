part of 'style.dart';

extension StringExtension on String {
  String intelliTrim() {
    return length > 15 ? '${substring(0, 15)}...' : this;
  }

  String toCurrencies() {
    return NumberFormat.currency(
      locale: 'id-ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(double.parse(this));
  }
}
