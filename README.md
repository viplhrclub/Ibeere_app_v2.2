# Ibeere Quiz App v2.2

A comprehensive quiz application built with Flutter, featuring multiple game modes, battle system, leaderboards, and more.

## Features

- 🎯 Multiple Quiz Modes (Solo, Battle, Group)
- 🎮 Mini Games (Tic-Tac-Toe, Number Puzzle, Memory Cards, Guess the Word)
- 🏆 Leaderboards & Rankings
- 💰 Coin System & In-App Purchases
- 🎁 Daily Rewards & Scratch Cards
- 👥 Social Features (Friends, Chat, Challenges)
- 🏅 Badges & Achievements
- 📊 Statistics & Performance Tracking
- 🌐 Multi-language Support
- 🎨 Custom UI Design System

## Backend API

Backend API hosted at: https://api.ibeere.fun
Admin Panel: https://api.ibeere.fun/admin

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio / Xcode (for mobile development)
- Firebase account (for authentication & notifications)

### Installation

1. Clone the repository
```bash
git clone https://github.com/viplhrclub/Ibeere_app_v2.2.git
cd Ibeere_app_v2.2
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the app
```bash
flutter run
```

## Project Structure

```
lib/
├── app/                    # App initialization
├── commons/                # Common widgets & models
├── core/                   # Core functionality
│   ├── config/            # App configuration
│   ├── constants/         # Constants & API endpoints
│   ├── localization/      # Multi-language support
│   ├── navigation/        # Navigation utilities
│   ├── routes/            # Route definitions
│   └── theme/             # Theme & design system
├── features/              # Feature modules
│   ├── auth/             # Authentication
│   ├── quiz/             # Quiz functionality
│   ├── battle_room/      # Battle mode
│   ├── leaderboard/      # Rankings & leaderboards
│   ├── profile_management/
│   ├── wallet/           # Coins & payments
│   └── ...
├── ui/                    # UI screens & widgets
│   ├── screens/          # All app screens
│   └── widgets/          # Reusable widgets
└── utils/                 # Utility functions
```

## Configuration

1. Firebase Setup:
   - Add `google-services.json` to `android/app/`
   - Add `GoogleService-Info.plist` to `ios/Runner/`
   - Update `firebase_options.dart` with your Firebase config

2. API Configuration:
   - Update API base URL in `lib/core/constants/api_endpoints_constants.dart`

## Build

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

## License

All rights reserved. Property of Ibeere Games.
