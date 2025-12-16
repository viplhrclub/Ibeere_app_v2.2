# Ibeere Quiz App v2.2

A Flutter-based quiz application with comprehensive features including battles, mini-games, leaderboards, and social features.

## Project Structure

```
├── android/          # Android native code
├── ios/              # iOS native code  
├── assets/           # Images, animations, sounds
├── lib/
│   ├── app/          # App initialization
│   ├── commons/      # Common widgets and bottom navigation
│   ├── core/         # Core utilities (routes, theme, localization)
│   ├── features/     # Feature modules (auth, quiz, battle, etc.)
│   ├── ui/           # UI screens and widgets
│   └── utils/        # Utility functions
├── Firebase/         # Firebase configuration files
├── Iberee App UI screens/  # UI design reference images (66 screens)
└── pubspec.yaml      # Flutter dependencies
```

## Features

- **Authentication**: Email, phone, and social login
- **Quiz System**: Multiple quiz modes with categories
- **Battle Mode**: 1v1 and group battles
- **Mini Games**: Tic-tac-toe, puzzles, memory games
- **Leaderboards**: Daily, weekly, monthly rankings
- **Coin System**: Earn and spend virtual currency
- **Social**: Friends, chat, challenges
- **Rewards**: Daily rewards, scratch cards, badges

## Backend API

- Base URL: `https://api.ibeere.fun/api/`
- Admin Panel: `https://api.ibeere.fun/`
- Database: MySQL

## Setup

1. Install Flutter: https://flutter.dev/docs/get-started/install
2. Clone repository
3. Run `flutter pub get`
4. Configure Firebase (see Firebase/ folder)
5. Run `flutter run`

## Screens

The app includes 89 screens across various categories:
- 15 v2 screens (pixel-perfect, API-integrated)
- 74 original screens
- See `Iberee App UI screens/` for design references

## Dependencies

Key packages:
- `firebase_core`: Firebase integration
- `flutter_bloc`: State management
- `http`: API calls
- `hive`: Local storage
- `flutter_svg`: SVG rendering
- See `pubspec.yaml` for full list

## Development

- **Design System**: `lib/core/theme/ibeere_tokens.dart`
- **Routes**: `lib/core/routes/routes.dart`
- **API Constants**: `lib/core/constants/api_endpoints_constants.dart`
- **Components**: `lib/ui/widgets/ibeere_v2_*.dart`

## License

Proprietary - All rights reserved
