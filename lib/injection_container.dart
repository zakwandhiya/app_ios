import 'package:bimo_app/features/chat_group/chat_detail/bloc/chat_detail_bloc.dart';
import 'package:bimo_app/features/chat_group/chat_detail/repository/chat_detail_repository.dart';
import 'package:bimo_app/features/chat_group/chat_list/bloc/chat_list_bloc.dart';
import 'package:bimo_app/features/chat_group/chat_list/repository/chat_list_repository.dart';
import 'package:bimo_app/features/homepage/bloc/homepage_bloc.dart';
import 'package:bimo_app/features/homepage/repository/homepage_repository.dart';
import 'package:bimo_app/features/logbook/logbook_edit/bloc/logbook_edit_bloc.dart';
import 'package:bimo_app/features/logbook/logbook_edit/repository/logbook_edit_repository.dart';
import 'package:bimo_app/features/logbook/logbook_list/bloc/logbook_list_bloc.dart';
import 'package:bimo_app/features/logbook/logbook_list/repository/logbook_list_repository.dart';
import 'package:bimo_app/features/login/bloc/login_bloc.dart';
import 'package:bimo_app/features/login/repository/login_repository.dart';
import 'package:bimo_app/features/milestone/milestone_detail/bloc/milestone_detail_bloc.dart';
import 'package:bimo_app/features/milestone/milestone_detail/repository/milestone_detail_repository.dart';
import 'package:bimo_app/features/milestone/milestone_edit/bloc/milestone_edit_bloc.dart';
import 'package:bimo_app/features/milestone/milestone_edit/repository/milestone_edit_repository.dart';
import 'package:bimo_app/features/pengumuman/pemumuman_list/bloc/pengumuman_list_bloc.dart';
import 'package:bimo_app/features/pengumuman/pemumuman_list/repository/pengumuman_list_repository.dart';
import 'package:bimo_app/features/portofolio/portofolio_edit/bloc/portofolio_edit_bloc.dart';
import 'package:bimo_app/features/portofolio/portofolio_edit/repository/portofolio_edit_repository.dart';
import 'package:bimo_app/features/portofolio/portofolio_list/bloc/portofolio_list_bloc.dart';
import 'package:bimo_app/features/portofolio/portofolio_list/repository/portofolio_list_repository.dart';
import 'package:bimo_app/features/profile/profile_detail/bloc/profile_detail_bloc.dart';
import 'package:bimo_app/features/profile/profile_detail/repository/profile_detail_repository.dart';
import 'package:bimo_app/features/profile/profile_edit/bloc/profile_edit_bloc.dart';
import 'package:bimo_app/features/profile/profile_edit/repository/profile_edit_repository.dart';
import 'package:bimo_app/features/rancangan/rancangan_mata_kuliah_edit/bloc/rancangan_mata_kuliah_edit_bloc.dart';
import 'package:bimo_app/features/rancangan/rancangan_mata_kuliah_edit/repository/rancangan_mata_kuliah_edit_repository.dart';
import 'package:bimo_app/features/rancangan/rancangan_mata_kuliah_list/bloc/rancangan_mata_kuliah_list_bloc.dart';
import 'package:bimo_app/features/rancangan/rancangan_mata_kuliah_list/repository/rancangan_mata_kuliah_list_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //login
  sl.registerFactory(() => LoginBloc(loginRepository: sl()));
  sl.registerLazySingleton(() => LoginRepository(client: sl()));

  //Homepage
  sl.registerFactory(() => HomepageBloc(homepageRepository: sl()));
  sl.registerLazySingleton(() => HomepageRepository(client: sl()));

  //ProfileDetail
  sl.registerFactory(() => ProfileDetailBloc(profileDetailRepository: sl()));
  sl.registerLazySingleton(() => ProfileDetailRepository(client: sl()));

  //ProfileEdit
  sl.registerFactory(() => ProfileEditBloc(profileEditRepository: sl()));
  sl.registerLazySingleton(() => ProfileEditRepository(client: sl()));

  //MilestoneDetail
  sl.registerFactory(() => MilestoneDetailBloc(milestoneDetailRepository: sl()));
  sl.registerLazySingleton(() => MilestoneDetailRepository(client: sl()));

  //MilestoneEdit
  sl.registerFactory(() => MilestoneEditBloc(milestoneEditRepository: sl()));
  sl.registerLazySingleton(() => MilestoneEditRepository(client: sl()));

  //PengumumanList
  sl.registerFactory(() => PengumumanListBloc(pengumumanListRepository: sl()));
  sl.registerLazySingleton(() => PengumumanListRepository(client: sl()));

  //ChatDetail
  sl.registerFactory(() => ChatDetailBloc(chatDetailRepository: sl()));
  sl.registerLazySingleton(() => ChatDetailRepository(client: sl()));

  //ChatList
  sl.registerFactory(() => ChatListBloc(chatListRepository: sl()));
  sl.registerLazySingleton(() => ChatListRepository(client: sl()));

  //MataKuliahList
  sl.registerFactory(() => MataKuliahListBloc(mataKuliahListRepository: sl()));
  sl.registerLazySingleton(() => MataKuliahListRepository(client: sl()));

  //MataKuliahEdit
  sl.registerFactory(() => MataKuliahEditBloc(mataKuliahEditRepository: sl()));
  sl.registerLazySingleton(() => MataKuliahEditRepository(client: sl()));

  //PortofolioEdit
  sl.registerFactory(() => PortofolioListBloc(portofolioListRepository: sl()));
  sl.registerLazySingleton(() => PortofolioListRepository(client: sl()));

  //MataKuliahEdit
  sl.registerFactory(() => PortofolioEditBloc(portofolioEditRepository: sl()));
  sl.registerLazySingleton(() => PortofolioEditRepository(client: sl()));

  //LogbookEdit
  sl.registerFactory(() => LogbookListBloc(mataKuliahListRepository: sl()));
  sl.registerLazySingleton(() => LogbookListRepository(client: sl()));

  //LogbookEdit
  sl.registerFactory(() => LogbookEditBloc(mataKuliahEditRepository: sl()));
  sl.registerLazySingleton(() => LogbookEditRepository(client: sl()));

  /*
  * client
  */
  sl.registerLazySingleton(() => http.Client());
}
