import 'dart:io';
import 'package:provider/provider.dart';
import '/ui/providers/page_change_provider.dart';

void setFlagImage(context) {
  if (Platform.localeName.split("_")[0] == "tr") {
    Provider.of<PageChangeProvider>(context, listen: false).setFlagIndex(7);
  } else if (Platform.localeName.split("_")[0] == "de") {
    Provider.of<PageChangeProvider>(context, listen: false).setFlagIndex(0);
  } else if (Platform.localeName.split("_")[0] == "hi") {
    Provider.of<PageChangeProvider>(context, listen: false).setFlagIndex(2);
  } else if (Platform.localeName.split("_")[0] == "id") {
    Provider.of<PageChangeProvider>(context, listen: false).setFlagIndex(3);
  } else if (Platform.localeName.split("_")[0] == "it") {
    Provider.of<PageChangeProvider>(context, listen: false).setFlagIndex(4);
  } else if (Platform.localeName.split("_")[0] == "pt") {
    Provider.of<PageChangeProvider>(context, listen: false).setFlagIndex(5);
  } else if (Platform.localeName.split("_")[0] == "ru") {
    Provider.of<PageChangeProvider>(context, listen: false).setFlagIndex(6);
  } else {
    Provider.of<PageChangeProvider>(context, listen: false).setFlagIndex(1);
  }
}
