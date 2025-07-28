📱 Chat App – Flutter Firebase BLoC Architecture
A clean and scalable Flutter chat application built with BLoC state management and integrated with Firebase Authentication and Cloud Firestore.


🚀 Features
🔐 Email & Password Authentication
Users can sign in or register with their email using Firebase Authentication.

💬 Real-time Chat
Messages are stored and synced using Firebase Cloud Firestore, ensuring real-time updates.

🧠 State Management with BLoC
Application logic is managed using the BLoC pattern, ensuring separation of concerns and testable code.

🧼 Clean Architecture
Project follows Clean Code and Layered Architecture principles:

Presentation (UI + BLoC)
Domain (Business logic)
Data (Firebase services and repositories)

## Project Structure
lib/
│
├── features/
│   └── chat/
│       ├── data/
│       ├── domain/
│       └── presentation/
│
├── core/
│   └── utils/
│   └── constants/
│
├── firebase_options.dart
└── main.dart

## Tech Stack
Flutter
Firebase Authentication
Cloud Firestore
Flutter BLoC
Dart
Clean Architecture

##Screenshots
(Add some screenshots of login screen, chat UI, etc.)

## Setup Instructions
Clone the repository:
git clone https://github.com/your-username/your-chat-app.git
cd your-chat-app

##Install dependencies
flutter pub get

## Setup Firebase:
Use FlutterFire CLI to configure Firebase.
Make sure you have the google-services.json (Android) and GoogleService-Info.plist (iOS).

## Run the app
flutter run

## Coming Soon
Push Notifications with FCM
Chat rooms / group chat
Media sharing (images, files)

## Contributing
Feel free to fork the project and submit pull requests to add features or fix bugs.



