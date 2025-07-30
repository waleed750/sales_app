import 'dart:developer';
import 'package:package_info_plus/package_info_plus.dart' as ino;
import 'package:freerasp/freerasp.dart';

import '../../../core_export.dart';

class RaspSecureApp {
  //singleton instance
  final instance = Talsec.instance;

  /// Initialize Talsec configuration for Android and iOS
  final threatCallback = ThreatCallback(
      onMalware: (packageInfo) => log("Malware detected", name: "FreeRasp"),
      onAppIntegrity: () => log("App integrity", name: "FreeRasp"),
      onObfuscationIssues: () => log("Obfuscation issues", name: "FreeRasp"),
      onDebug: () => log("Debugging", name: "FreeRasp"),
      onDeviceBinding: () => log("Device binding", name: "FreeRasp"),
      onDeviceID: () => log("Device ID", name: "FreeRasp"),
      onHooks: () => log("Hooks", name: "FreeRasp"),
      onPasscode: () => log("Passcode not set", name: "FreeRasp"),
      onPrivilegedAccess: () => log("Privileged access ex: JailBreak or Root", name: "FreeRasp"),
      onSecureHardwareNotAvailable: () =>
          log("Secure hardware not available", name: "FreeRasp"),
      onSimulator: () => log("Simulator on", name: "FreeRasp"),
      onSystemVPN: () => log("System VPN", name: "FreeRasp"),
      onDevMode: () => log("Developer mode on", name: "FreeRasp"),
      onADBEnabled: () => log("USB debugging enabled", name: "FreeRasp"),
      onUnofficialStore: () => log("Unofficial store", name: "FreeRasp"));
  Future<void> initializeTalsec() async {
    final info = await ino.PackageInfo.fromPlatform();
    final config = TalsecConfig(
      androidConfig: AndroidConfig(
        packageName: info.packageName,
        signingCertHashes: [Environment.SigningCertHashes],
        supportedStores: ['com.android.vending','com.heytap.market'],
        malwareConfig: MalwareConfig(
          // blacklistedPackageNames: ['com.aheaditec.freeraspExample'],
          suspiciousPermissions: [
            ['android.permission.CAMERA'],
            ['android.permission.READ_SMS', 'android.permission.READ_CONTACTS'],
            // Add additional permissions
            ['android.permission.ACCESS_FINE_LOCATION'],
            ['android.permission.ACCESS_COARSE_LOCATION'],
            ['android.permission.READ_EXTERNAL_STORAGE'],
            ['android.permission.WRITE_EXTERNAL_STORAGE'],
            ['android.permission.ACCESS_NETWORK_STATE'],
            ['android.permission.SEND_SMS'],
            ['android.permission.RECEIVE_SMS'],
            ['android.permission.CALL_PHONE'],
            ['android.permission.READ_PHONE_STATE'],
          ],
        ),
      ),
      iosConfig: IOSConfig(
        bundleIds: [info.packageName],
        teamId: 'M8AK35...',
      ),
      watcherMail: Environment.WatcherMail,
      isProd: true,
    );

    await Talsec.instance.start(config);
    Talsec.instance.attachListener(threatCallback);
  }
}
/*
Google Play Store

Package Name: com.android.vending
Google Play
Samsung Galaxy Store

Package Name: com.sec.android.app.samsungapps
Samsung Galaxy Store
Amazon Appstore

Common Package Name: com.amazon.venezia
Amazon Appstore
Huawei App Gallery

Package Name: com.huawei.appmarket
Huawei App Gallery
Xiaomi Mi Store (GetApps)

Package Name: com.xiaomi.market
Xiaomi GetApps
Oppo Software Store (App Market)

Likely Package Name: com.oppo.market
Oppo App Market
VIVO App Store

Likely Package Name: com.bbk.appstore
VIVO App Store
Aptoide

Package Name: cm.aptoide.pt
Aptoide
SlideME Marketplace

Package Name: com.slideme.sam.manager
SlideME
GetJar

Accessed via Web: No specific package name
GetJar
F-Droid

Package Name: org.fdroid.fdroid
F-Droid
Tencent MyApp

Package Name: com.tencent.android.qqdownloader
Tencent MyApp
 */
