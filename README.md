# SocialFeed

A simple social feed app built with SwiftUI following Clean Architecture principles.
The app fetches a token on launch, then retrieves and displays posts and their authors.
Designed with testability and modularity in mind.

## Technologies

- SwiftUI
- Swift Concurrency
- Dependency Injection
- Clean Architecture
- Secure token storage
- Dark Mode Support
- Built using native iOS components 
- Programmatic navigation using the NavigationPath API
- Unit tests for all layers using the new swift-testing
- Built with iOS 18.2, Xcode 16.2

## API

Data is fetched from [this API endpoint](https://engineering.league.dev/challenge/api/).

## How it works

1. App launches with a splash screen.
2. Auth token is fetched from the login endpoint and stored securely.
3. user and post data are fetched in parallel to reduce load time.
4. Posts are matched with their corresponding users and displayed in a feed.
5. Supports navigation to post details and user profiles.

<img src="https://github.com/user-attachments/assets/981e5cf0-7798-48f0-8a82-66d439df6ccb" alt="Splash Screen" width="200">
<img src="https://github.com/user-attachments/assets/08e9b937-c0c2-4686-9039-f7ca4064829a" alt="Post View" width="200">
<img src="https://github.com/user-attachments/assets/87c5f8c1-3419-43d1-a8b2-826db9d39bfe" alt="Post Detail" width="200">
<img src="https://github.com/user-attachments/assets/5e455ab8-ed9f-40ec-90eb-09065dab80e4" alt="User Profile" width="200">


