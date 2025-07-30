class AndroidDeviceInfoModel {
  final String? operatingSystem;
  final String? securityPatch;
  final int? sdkVersion;
  final String? incrementalVersion;
  final String? board;
  final String? bootloaderStatus;
  final String? brand;
  final String? deviceModel;
  final String? displayBuild;
  final String? fingerprint;
  final String? hardware;
  final String? host;
  final String? id;
  final String? manufacturer;
  final String? model;
  final String? product;
  final String? name;
  final List<String>? supported32BitAbis;
  final List<String>? supported64BitAbis;
  final List<String>? supportedAbis;
  final String? tags;
  final String? type;
  final bool? isPhysicalDevice;
  final List<String>? systemFeatures;
  final String? serialNumber;
  final bool? isLowRamDevice;

  AndroidDeviceInfoModel({
    required this.operatingSystem,
    required this.securityPatch,
    required this.sdkVersion,
    required this.incrementalVersion,
    required this.board,
    required this.bootloaderStatus,
    required this.brand,
    required this.deviceModel,
    required this.displayBuild,
    required this.fingerprint,
    required this.hardware,
    required this.host,
    required this.id,
    required this.manufacturer,
    required this.model,
    required this.product,
    required this.name,
    required this.supported32BitAbis,
    required this.supported64BitAbis,
    required this.supportedAbis,
    required this.tags,
    required this.type,
    required this.isPhysicalDevice,
    required this.systemFeatures,
    required this.serialNumber,
    required this.isLowRamDevice,
  });

  @override
  String toString() {
    return '''
Android Device Information:
Operating System: $operatingSystem
Security Patch: $securityPatch
SDK Version: $sdkVersion
Incremental Version: $incrementalVersion
Board: $board
Bootloader Status: $bootloaderStatus
Brand: $brand
Device Model: $deviceModel
Display Build: $displayBuild
Fingerprint: $fingerprint
Hardware: $hardware
Host: $host
ID: $id
Manufacturer: $manufacturer
Model: $model
Product: $product
Name: $name
Supported 32-bit ABIs: ${supported32BitAbis?.join(", ")}
Supported 64-bit ABIs: ${supported64BitAbis?.join(", ")}
Supported ABIs: ${supportedAbis?.join(", ")}
Tags: $tags
Type: $type
Is Physical Device: $isPhysicalDevice
System Features: ${systemFeatures?.join(", ")}
Serial Number: $serialNumber
Is Low RAM Device: $isLowRamDevice
''';
  }

  Map<String, dynamic> toMap() {
    return {
      'Operating System': operatingSystem,
      'Security Patch': securityPatch,
      'SDK Version': sdkVersion,
      'Incremental Version': incrementalVersion,
      'Board': board,
      'Bootloader Status': bootloaderStatus,
      'Brand': brand,
      'Device Model': deviceModel,
      'Display Build': displayBuild,
      'Fingerprint': fingerprint,
      'Hardware': hardware,
      'Host': host,
      'ID': id,
      'Manufacturer': manufacturer,
      'Model': model,
      'Product': product,
      'Name': name,
      'Supported 32-bit ABIs': supported32BitAbis,
      'Supported 64-bit ABIs': supported64BitAbis,
      'Supported ABIs': supportedAbis,
      'Tags': tags,
      'Type': type,
      'Is Physical Device': isPhysicalDevice,
      'System Features': systemFeatures,
      'Serial Number': serialNumber,
      'Is Low RAM Device': isLowRamDevice
    };
  }

  factory AndroidDeviceInfoModel.fromMap(Map<String, dynamic> json) {
    return AndroidDeviceInfoModel(
      operatingSystem: json['Operating System'],
      securityPatch: json['Security Patch'],
      sdkVersion: json['SDK Version'],
      incrementalVersion: json['Incremental Version'],
      board: json['Board'],
      bootloaderStatus: json['Bootloader Status'],
      brand: json['Brand'],
      deviceModel: json['Device Model'],
      displayBuild: json['Display Build'],
      fingerprint: json['Fingerprint'],
      hardware: json['Hardware'],
      host: json['Host'],
      id: json['ID'],
      manufacturer: json['Manufacturer'],
      model: json['Model'],
      product: json['Product'],
      name: json['Name'],
      supported32BitAbis: json['Supported 32-bit ABIs'].cast<String>(),
      supported64BitAbis: json['Supported 64-bit ABIs'].cast<String>(),
      supportedAbis: json['Supported ABIs'].cast<String>(),
      tags: json['Tags'],
      type: json['Type'],
      isPhysicalDevice: json['Is Physical Device'],
      systemFeatures: json['System Features'].cast<String>(),
      serialNumber: json['Serial Number'],
      isLowRamDevice: json['Is Low RAM Device'],
    );
  }
}
