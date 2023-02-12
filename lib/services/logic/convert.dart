double convert(val, rate) {
  val = val / rate;
  if (val > 10) {
    return double.parse(val.toStringAsFixed(4));
  }
  return double.parse(val.toStringAsFixed(6));
}
