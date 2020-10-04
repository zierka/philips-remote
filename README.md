# philips_remote

## About

An unofficial Philips TV remote control app written in Flutter.

The app is under heavy development.

## Features:
- pairing
- basic controls
- d-pad
- all/favorite channel lists
- application list

### Screenshots

![screenshot1](_stuff/repo_content/screenshot1.png)
![screenshot2](_stuff/repo_content/screenshot2.png)

### Pigeon

```
flutter pub run pigeon \
  --input pigeons/messages.dart \
  --dart_out lib/pigeon.dart \
  --objc_header_out ios/Runner/Channels/pigeon.h \
  --objc_source_out ios/Runner/Channels/pigeon.m \
  --java_out ./android/app/src/main/java/dev/flutter/pigeon/Pigeon.java \
  --java_package "dev.flutter.pigeon";
```