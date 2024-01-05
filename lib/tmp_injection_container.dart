
  //Template
  sl.registerFactory(() => TemplateBloc(TemplateRepository: sl()));
  sl.registerLazySingleton(() => TemplateRepository(client: sl()));