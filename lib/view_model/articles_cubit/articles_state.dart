part of 'articles_cubit.dart';

abstract class ArticlesState {}

class ArticlesInitial extends ArticlesState {}

class ArticlesLoadingState extends ArticlesState {}

class ArticlesLoadingSuccessState extends ArticlesState {}

class ArticlesLoadingErrorState extends ArticlesState {}

class ArticlesSearchedLoadingState extends ArticlesState {}

class ArticlesSearchedLoadingSuccessState extends ArticlesState {}

class ArticlesSearchedLoadingErrorState extends ArticlesState {}

class ChangeIndexState extends ArticlesState {}

