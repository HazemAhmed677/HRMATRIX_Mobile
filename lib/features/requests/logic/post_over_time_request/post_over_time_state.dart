part of 'post_over_time_cubit.dart';

sealed class PostOverTimeState {}

final class PostOverTimeInitial extends PostOverTimeState {}

final class PostOverTimeLoading extends PostOverTimeState {}

final class PostOverTimeSuccess extends PostOverTimeState {}

final class PostOverTimeFailure extends PostOverTimeState {
  final String errorMsg;
  PostOverTimeFailure({required this.errorMsg});
}
