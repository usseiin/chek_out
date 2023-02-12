// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bloc/bloc.dart';
import 'package:chekout_app/data/models/model.dart';

import 'package:chekout_app/data/repository/repository.dart';
import 'package:chekout_app/models/pay_details.dart';
import 'package:chekout_app/services/enum/payment_mode.dart';
import 'package:chekout_app/services/logic/convert.dart';

import '../enum/pricing_plan.dart';

class AppStateCubit extends Cubit<AppState> {
  AppStateCubit({DataRepository? apiClient})
      : _apiClient = apiClient ?? DataRepository(),
        super(const AppState());

  final DataRepository _apiClient;

  void change(PricingPlan val) {
    if (val == PricingPlan.free) {
      emit(state.copyWith(
          plan: PricingPlan.free,
          rateSymbol: state.rateSymbol.copyWith(rate: val.price.toDouble())));
    }

    if (val == PricingPlan.basic) {
      emit(state.copyWith(
          plan: PricingPlan.basic,
          rateSymbol: state.rateSymbol.copyWith(rate: val.price.toDouble())));
    }
    if (val == PricingPlan.premium) {
      emit(state.copyWith(
          plan: PricingPlan.premium,
          rateSymbol: state.rateSymbol.copyWith(rate: val.price.toDouble())));
    }
  }

  Future<Details> getPaymebtDetails() async {
    final result = await _apiClient.getPaymentDetail(
      PayDetails(
          productName: 'ChekOut plan',
          description: state.plan.title,
          localPrice: AmountCurrency(
              amount: state.plan.price.toDouble(), currency: 'BTC'),
          userData: UserData(id: "id", email: "email"),
          pricingType: ""),
    );

    return result;
  }

  Future<void> _getRate(String query) async {
    RateSymbol res = await _apiClient.getRate(query);

    emit(
      state.copyWith(
          rateSymbol: RateSymbol(
        rate: res.rate,
        symbol: res.symbol,
      )),
    );
  }

  double get convertedRate {
    if (state.plan.price == state.rateSymbol.rate) {
      return state.plan.price.toDouble();
    }
    return convert(state.plan.price, state.rateSymbol.rate);
  }

  void updateScreen(String? query) {
    if (state.selectedPaymentOption == PaymentMode.cryptocurrency) {
      _getRate(query!);
    } else {
      emit(state.copyWith(
        rateSymbol:
            RateSymbol(symbol: "USD", rate: state.plan.price.toDouble()),
      ));
    }
  }

  void toggleTermAndCondition() {
    emit(state.copyWith(isTandC: !state.isTandC));
  }

  void updateSelectedPaymentOption(PaymentMode val) {
    emit(state.copyWith(selectedPaymentOption: val));
  }

  void resetSelected() {
    emit(state.copyWith(selectedPaymentOption: null));
  }
}

class AppState {
  final PricingPlan plan;
  final RateSymbol rateSymbol;
  final bool isTandC;
  final PaymentMode? selectedPaymentOption;

  const AppState({
    this.plan = PricingPlan.basic,
    this.rateSymbol = const RateSymbol(symbol: "USD", rate: 0.0),
    this.isTandC = false,
    this.selectedPaymentOption,
  });

  AppState copyWith({
    PricingPlan? plan,
    RateSymbol? rateSymbol,
    bool? isTandC,
    PaymentMode? selectedPaymentOption,
  }) {
    return AppState(
      plan: plan ?? this.plan,
      rateSymbol: rateSymbol ?? this.rateSymbol,
      isTandC: isTandC ?? this.isTandC,
      selectedPaymentOption:
          selectedPaymentOption ?? this.selectedPaymentOption,
    );
  }
}
