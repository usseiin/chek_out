// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bloc/bloc.dart';

import 'package:chekout_app/data/repository/repository.dart';

import '../enum/pricing_plan.dart';

class AppStateCubit extends Cubit<AppState> {
  AppStateCubit({DataRepository? apiClient})
      : _apiClient = apiClient ?? DataRepository(),
        super(const AppState());

  final DataRepository _apiClient;

  void change(PricingPlan val) {
    if (val == PricingPlan.free) {
      emit(state.copyWith(plan: PricingPlan.free));
    }

    if (val == PricingPlan.basic) {
      emit(state.copyWith(plan: PricingPlan.basic));
    }
    if (val == PricingPlan.premium) {
      emit(state.copyWith(plan: PricingPlan.premium));
    }
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

  void updateScreen(String? query) {
    if (state.selectedPaymentOption == "Cryptocurrency") {
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

  void updateSelectedPaymentOption(String val) {
    emit(state.copyWith(selectedPaymentOption: val, isExpand: true));
  }
}

class AppState {
  final PricingPlan plan;
  final RateSymbol? rateSymbol;
  final bool isTandC;
  final String selectedPaymentOption;

  const AppState({
    this.plan = PricingPlan.basic,
    this.rateSymbol,
    this.isTandC = false,
    this.selectedPaymentOption = "",
  });

  AppState copyWith({
    PricingPlan? plan,
    RateSymbol? rateSymbol,
    bool? isTandC,
    String? selectedPaymentOption,
    bool? isExpand,
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
