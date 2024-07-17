
sealed class ProductState {}

final class ProductInitial extends ProductState{}


// Get All Product ..
final class ProductLoadingState extends ProductState{}
final class ProductSuccessState extends ProductState{}
final class ProductErrorState extends ProductState{}
final class SearchResultState extends ProductState{}
