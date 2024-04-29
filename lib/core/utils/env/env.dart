import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'FIREBASE_API_KEY_ANDROID', obfuscate: true)
  static final String androidFBAppId = _Env.androidFBAppId;

  @EnviedField(varName: 'FIREBASE_API_KEY_IOS', obfuscate: true)
  static final String iosFBAppId = _Env.iosFBAppId;

  @EnviedField(varName: 'FIREBASE_API_KEY_WEB', obfuscate: true)
  static final String webFBAppId = _Env.webFBAppId;
}
