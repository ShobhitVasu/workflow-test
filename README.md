# cicddemo

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Building Different App Variants

This project supports building different app variants using configuration files:

```bash
# Build with default configuration
flutter build apk

# Build with specific configuration
flutter build apk --dart-define=CONFIG_FILE=app1.json
flutter build apk --dart-define=CONFIG_FILE=app2.json
```

Configuration files are located in the `assets/config/` directory. Each config file defines app-specific settings like app name, colors, API endpoints, etc.

The CI/CD pipeline is configured to automatically build all configured app variants.