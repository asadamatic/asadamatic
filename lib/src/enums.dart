enum Os {
  ios(imageAsset: 'assets/apple.png' ), 
  android(imageAsset: 'assets/android.png');

  const Os({required this.imageAsset});
  final String imageAsset;

  bool get isIOS => this == Os.ios;
}