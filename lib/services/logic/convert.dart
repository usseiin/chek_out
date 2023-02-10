double convert(val, rate) {
  val = val / rate;
  return double.parse(val.toStringAsFixed(6));
}
