class BaseResponse<T> {
  final String? errorText;
  final String succefullText;
  final bool isError;
  final T? data;

  BaseResponse({
    this.errorText,
    this.isError = false,
    this.succefullText = "",
    this.data,
  });
}
