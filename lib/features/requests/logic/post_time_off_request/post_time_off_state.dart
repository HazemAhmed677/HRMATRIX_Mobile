part of 'post_time_off_cubit.dart';

sealed class PostTimeOffState {}

final class PostTimeOffInitial extends PostTimeOffState {}

final class PostTimeOffLoading extends PostTimeOffState {}

final class PostTimeOffSuccess extends PostTimeOffState {}

final class PostTimeOffFailure extends PostTimeOffState {
  final String errorMsg;
  PostTimeOffFailure({required this.errorMsg});
}
