# SocialFeed

A simple social feed app built with SwiftUI following Clean Architecture principles.
The app fetches a token on launch, then retrieves and displays posts and their authors.
Designed with testability and modularity in mind.

## Features

- Splash screen with animation
- Auth token fetch and storage
- Feed list with posts and user info
- Post detail view
- User profile view
- Programmatic navigation

## Technologies

- SwiftUI
- Swift Concurrency (`async/await` and the Obsevation Framework)
- Dependency Injection
- Clean Architecture (Use Case, Repository, APIClient)
- Keychain token storage
- Unit tests for all layers using the new swift-testing
- Built with iOS 18.2, Xcode 16.2

## API

Data is fetched from:
[https://engineering.league.dev/challenge/api/](https://engineering.league.dev/challenge/api/)

## How it works

1. App launches with a splash screen.
2. Auth token is fetched from `/login` and stored securely.
3. `/users` and `/posts` are fetched in parallel.
4. Posts are matched to users and displayed.
5. Navigation to post detail and user profile is handled via `NavigationPath`.
