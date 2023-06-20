class MobileAppModel {
  String header, name, description, assetImage;
  String? playstoreLink, appstoreLink;

  MobileAppModel(
      {required this.header,
      required this.name,
      required this.description,
      required this.assetImage,
      this.playstoreLink,
      this.appstoreLink});
}

List<MobileAppModel> apps = [
  MobileAppModel(
    header: "Android | iOS",
    name: "Bon Cop Bad Cop",
    description:
        """An app designed to protect the canadian populations from dangerous cops by enabling the user to record his/her interactions with cops and send it automatically to a law clinic""",
    assetImage: "assets/ios.png",
    playstoreLink: "",
    appstoreLink: "",
  ),
  MobileAppModel(
    header: "Android | iOS",
    name: "MedFiner",
    description:
        """An app that enables cameroonians to find at any time, any medicine in any of the pharmacies having it in stock. It is connected in real-time with numerous pharmacies in the country and provides live data on their stocks to users""",
    assetImage: "assets/ios.png",
    playstoreLink: "",
    appstoreLink: "",
  ),
];
