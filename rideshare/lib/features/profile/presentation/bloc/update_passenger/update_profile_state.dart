class UpdateProfileState {
  final String fullName;
  final int age;
  final String imageUrl;
  final bool isInitial;
  final bool isLoading;
  final bool isSuccess;
  final bool isFailed;

  const UpdateProfileState({
    this.age = 0,
    this.fullName = '',
    this.imageUrl = '',
    this.isInitial = true,
    this.isFailed = false,
    this.isLoading = false,
    this.isSuccess = false,
  });

  UpdateProfileState copyWith({
    String? fullName,
    int? age,
    String? imageUrl,
    bool? isInitial,
    bool? isLoading,
    bool? isSuccess,
    bool? isFailed,
  }) {
    return UpdateProfileState(
      fullName: fullName ?? this.fullName,
      age: age ?? this.age,
      imageUrl: imageUrl ?? this.imageUrl,
      isFailed: isFailed ?? this.isFailed,
      isInitial: isInitial ?? this.isInitial,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}