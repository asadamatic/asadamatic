import 'package:asadamatic/src/constant/values.dart';
import 'package:equatable/equatable.dart';

class App extends Equatable {
  final String name;
  final String description;
  final String logoAsset;
  final List<String> screenshotAssets;
  final String appStoreLink;
  final String playStoreLink;

  const App({
    required this.name,
    required this.description,
    required this.logoAsset,
    required this.screenshotAssets,
    required this.appStoreLink,
    required this.playStoreLink,
  });

  @override
  List<Object?> get props => [
        name,
        description,
        logoAsset,
        screenshotAssets,
        appStoreLink,
        playStoreLink
      ];
}

const List<App> apps = [
  App(
    name: 'Evolve Inventory',
    description: 'Manage your inventory with Evolve Inventory app.',
    logoAsset: 'assets/apps/inventory/logo.webp',
    screenshotAssets: inventoryScreenshots,
    appStoreLink: 'https://apps.apple.com/us/app/evolve-inventory/id6449703851',
    playStoreLink:
        'https://play.google.com/store/apps/details?id=com.knkit.inventoryapp',
  ),
  App(
    name: 'Evolve CRM',
    description: 'Customer relationship management with Evolve CRM.',
    logoAsset: 'assets/apps/crm/logo.webp',
    screenshotAssets: crmScreenshots,
    appStoreLink: 'https://apps.apple.com/us/app/evolve-crm/id6462847122',
    playStoreLink:
        'https://play.google.com/store/apps/details?id=com.knkit.evolvecrm',
  ),
  App(
    name: 'Evolve FMS',
    description: 'Field management simplified with Evolve FMS.',
    logoAsset: 'assets/apps/fms/logo.webp',
    screenshotAssets: fmsScreenshots,
    appStoreLink: 'https://apps.apple.com/us/app/evolve-fms/id6470257389',
    playStoreLink:
        'https://play.google.com/store/apps/details?id=com.knkit.fms',
  ),
  App(
    name: 'Dis Aircon Pte. Ltd.',
    description: 'Stay cool with Dis Aircon Pte Ltd app.',
    logoAsset: 'assets/apps/dis-aircon/logo.webp',
    screenshotAssets: disAirconScreenshots,
    appStoreLink:
        'https://apps.apple.com/us/app/dis-aircon-pte-ltd/id6449659623',
    playStoreLink:
        'https://play.google.com/store/apps/details?id=com.knkit.disportal',
  ),
  App(
    name: 'Try Modest',
    description: 'Try Modest: Your One-Stop Shop for Modest Fashion',
    logoAsset: 'assets/apps/try_modest/logo.webp',
    screenshotAssets: tryModestScreenshots,
    appStoreLink: 'https://apps.apple.com/ae/app/try-modest/id6471106909',
    playStoreLink:
        'https://play.google.com/store/apps/details?id=com.trymodestt.app',
  ),
];
