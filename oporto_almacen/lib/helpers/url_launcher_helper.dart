import 'package:url_launcher/url_launcher.dart';

class UrlLauncheHelper {
  static launchURLFacebook(String fbProtocolUrl, String fallbackUrl) async {
    try {
      bool launched = await launch(fbProtocolUrl, forceSafariVC: false);

      if (!launched) {
        await launch(fallbackUrl, forceSafariVC: false);
      }
    } catch (e) {
      await launch(fallbackUrl, forceSafariVC: false);
    }
  }

  static launchURLInstagram(String instProtocolUrl, String fallbackUrl) async {
    try {
      bool launched = await launch(instProtocolUrl, forceSafariVC: false);

      if (!launched) {
        await launch(fallbackUrl, forceSafariVC: false);
      }
    } catch (e) {
      await launch(fallbackUrl, forceSafariVC: false);
    }
  }

  static launchURLTwitter(String twProtocolUrl, String fallbackUrl) async {
    try {
      bool launched = await launch(twProtocolUrl, forceSafariVC: false);

      if (!launched) {
        await launch(fallbackUrl, forceSafariVC: false);
      }
    } catch (e) {
      await launch(fallbackUrl, forceSafariVC: false);
    }
  }

  static launchURLMaps(String mapsProtocolUrl) async {
    if (await canLaunch(mapsProtocolUrl)) {
      await launch(mapsProtocolUrl);
    } else {
      throw 'Could not launch $mapsProtocolUrl';
    }
  }

  static launchPhoneCall(String number) async {
    if (await canLaunch(number)) {
      await launch(number);
    } else {
      throw 'Could not launch $number';
    }
  }
}
