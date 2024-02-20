import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DeviceDetectorWidget extends StatelessWidget {
  final Widget Function() webSiteView;
  final Widget Function() phoneView;

  const DeviceDetectorWidget({
    super.key,
    required this.webSiteView,
    required this.phoneView,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
        return webSiteView.call();
      }

      if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
        return phoneView.call();
      }

      if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
        return phoneView.call();
      }
      return webSiteView.call();
    });
  }
}
