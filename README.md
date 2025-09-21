# One Studio Task - Flutter Food Ordering App

A Flutter application for food ordering and delivery built for One Studio company.

## Features

- Browse meals with descriptions and images
- Customize meal options (single/multiple selection)
- Smart cart management with duplicate prevention
- Real-time price calculation
- Search and filter functionality
- Responsive design for all screen sizes

## Tech Stack

- **Flutter** - Cross-platform UI framework
- **Dart** - Programming language
- **BLoC** - State management
- **Hive** - Local storage
- **GetIt** - Dependency injection

## Installation

1. Clone the repository
2. Install dependencies: `flutter pub get`
3. Generate required files: `flutter packages pub run build_runner build --delete-conflicting-outputs`
4. Run the app: `flutter run`

## Project Structure

```text
lib/
├── core/                    # Core functionality
├── features/               # Feature modules
│   ├── meals/              # Meal management
│   └── cart/                # Cart management
└── main.dart               # App entry point
```

## Development

- **Code Generation**: `flutter packages pub run build_runner build --delete-conflicting-outputs`
- **Testing**: `flutter test`
- **Build**: `flutter build apk --release`

## License

MIT License
