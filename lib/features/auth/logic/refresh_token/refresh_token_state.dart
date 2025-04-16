part of 'refresh_token_cubit.dart';

@immutable
sealed class RefreshTokenState {}

final class RefreshTokenInitial extends RefreshTokenState {}

final class RefreshTokenLoading extends RefreshTokenState {}

final class RefreshTokenSuccess extends RefreshTokenState {}

final class RefreshTokenFailure extends RefreshTokenState {
  final String errorMsg;
  RefreshTokenFailure({required this.errorMsg});
}
