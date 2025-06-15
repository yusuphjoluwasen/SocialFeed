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

Data is fetched from:
[https://engineering.league.dev/challenge/api/](https://engineering.league.dev/challenge/api/)

## How it works

1. App launches with a splash screen.
2. Auth token is fetched from the login endpoint and stored securely.
3. user and post data are fetched in parallel to reduce load time.
4. Posts are matched with their corresponding users and displayed in a feed.
5. Supports navigation to post details and user profiles.
