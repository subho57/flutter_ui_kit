import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:nb_utils/nb_utils.dart';

Future<RemoteConfig> setUpRemoteConfig() async {
  if (isMobile) {
    final RemoteConfig remoteConfig = RemoteConfig.instance;

    remoteConfig.setConfigSettings(RemoteConfigSettings(fetchTimeout: Duration.zero, minimumFetchInterval: Duration.zero));
    await remoteConfig.fetch();
    await remoteConfig.fetchAndActivate();

    return remoteConfig;
  } else {
    throw '';
  }
}
