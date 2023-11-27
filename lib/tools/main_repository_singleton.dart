import '../model/app_cache.dart';
import '../model/app_firestore.dart';
import '../model/app_repository.dart';
import '../model/member_cache.dart';
import '../model/member_repository.dart';
import '../repo/member_firestore_bespoke.dart';
import '../repo/user_repository.dart';
import 'main_abstract_repository_singleton.dart';

class MainRepositorySingleton extends AbstractMainRepositorySingleton {
  MainRepositorySingleton() {
    _appRepository = AppCache(AppFirestore());
    _memberRepository = MemberCache(MemberFirestore());
    _userRepository = UserRepository();
  }

  @override
  AppRepository? appRepository() => _appRepository;
  AppRepository? _appRepository;

  @override
  MemberRepository? memberRepository() => _memberRepository;
  MemberRepository? _memberRepository;

  @override
  UserRepository? userRepository() => _userRepository;
  UserRepository? _userRepository;
}
