// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class IosDeviceInfoModel {
  String? systemName;
  String? version;
  String? model;
  bool? physicalDevice;
  String? utsName;
  String? machine;
  String? nodeName;
  String? release;
  String? identifierForVendor;
  String? iOsAppOnMac;

  IosDeviceInfoModel({
    this.systemName,
    this.version,
    this.model,
    this.physicalDevice,
    this.utsName,
    this.machine,
    this.nodeName,
    this.release,
    this.identifierForVendor,
    this.iOsAppOnMac,
  });

  IosDeviceInfoModel copyWith({
    String? systemName,
    String? version,
    String? model,
    bool? physicalDevice,
    String? utsName,
    String? machine,
    String? nodeName,
    String? release,
    String? identifierForVendor,
    String? iOsAppOnMac,
  }) {
    return IosDeviceInfoModel(
      systemName: systemName ?? this.systemName,
      version: version ?? this.version,
      model: model ?? this.model,
      physicalDevice: physicalDevice ?? this.physicalDevice,
      utsName: utsName ?? this.utsName,
      machine: machine ?? this.machine,
      nodeName: nodeName ?? this.nodeName,
      release: release ?? this.release,
      identifierForVendor: identifierForVendor ?? this.identifierForVendor,
      iOsAppOnMac: iOsAppOnMac ?? this.iOsAppOnMac,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'systemName': systemName,
      'version': version,
      'model': model,
      'physicalDevice': physicalDevice,
      'utsName': utsName,
      'machine': machine,
      'nodeName': nodeName,
      'release': release,
      'identifierForVendor': identifierForVendor,
      'iOsAppOnMac': iOsAppOnMac,
    };
  }

  factory IosDeviceInfoModel.fromMap(Map<String, dynamic> map) {
    return IosDeviceInfoModel(
      systemName:
          map['systemName'] != null ? map['systemName'] as String : null,
      version: map['version'] != null ? map['version'] as String : null,
      model: map['model'] != null ? map['model'] as String : null,
      physicalDevice:
          map['physicalDevice'] != null ? map['physicalDevice'] as bool : null,
      utsName: map['utsName'] != null ? map['utsName'] as String : null,
      machine: map['machine'] != null ? map['machine'] as String : null,
      nodeName: map['nodeName'] != null ? map['nodeName'] as String : null,
      release: map['release'] != null ? map['release'] as String : null,
      identifierForVendor: map['identifierForVendor'] != null
          ? map['identifierForVendor'] as String
          : null,
      iOsAppOnMac:
          map['iOsAppOnMac'] != null ? map['iOsAppOnMac'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory IosDeviceInfoModel.fromJson(String source) =>
      IosDeviceInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'IosDeviceInfoModel(systemName: $systemName, version: $version, model: $model, physicalDevice: $physicalDevice, utsName: $utsName, machine: $machine, nodeName: $nodeName, release: $release, identifierForVendor: $identifierForVendor, iOsAppOnMac: $iOsAppOnMac)';
  }

  @override
  bool operator ==(covariant IosDeviceInfoModel other) {
    if (identical(this, other)) return true;

    return other.systemName == systemName &&
        other.version == version &&
        other.model == model &&
        other.physicalDevice == physicalDevice &&
        other.utsName == utsName &&
        other.machine == machine &&
        other.nodeName == nodeName &&
        other.release == release &&
        other.identifierForVendor == identifierForVendor &&
        other.iOsAppOnMac == iOsAppOnMac;
  }

  @override
  int get hashCode {
    return systemName.hashCode ^
        version.hashCode ^
        model.hashCode ^
        physicalDevice.hashCode ^
        utsName.hashCode ^
        machine.hashCode ^
        nodeName.hashCode ^
        release.hashCode ^
        identifierForVendor.hashCode ^
        iOsAppOnMac.hashCode;
  }
}
