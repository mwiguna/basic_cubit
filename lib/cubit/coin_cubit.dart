import 'package:basic_cubit/helper/route.dart';
import 'package:basic_cubit/model/coin_model.dart';
import 'package:basic_cubit/service/coin_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// CoinCubit = State
// CoinCubit = CoinInitial/CoinLoaded/CoinLoading/CoinFailed

class CoinCubit extends Cubit<CoinState> {
  CoinCubit() : super(CoinInitial());

  Future<void> getCoin() async {
    emit(CoinLoading());

    Coin? result = await CoinService.getCoin(getCoinUrl);

    if (result != null) {
      emit(CoinLoaded(result));
    } else {
      emit(CoinFailed());
    }
  }

}

abstract class CoinState extends Equatable {
  @override
  List<Object> get props => [];
}

class CoinLoaded extends CoinState {
  final Coin coin;

  CoinLoaded(this.coin);
  @override
  List<Object> get props => [coin];
}
class CoinLoading extends CoinState {}
class CoinFailed  extends CoinState {}
class CoinInitial extends CoinState {}