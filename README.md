# StopIncrust

Application mobile iOS et Android.

## Repository layout

- `ios/` — application iOS (Swift / SwiftUI)
- `android/` — application Android (Kotlin / Jetpack Compose)
- `docs/` — project documentation

## Getting started

1. Clone the repository:
   ```bash
   gh repo clone fduruy/StopIncrust
   ```
2. Open the project in VS Code.
3. Commit and push your changes directly on `main` while the project is bootstrapping.

## Workflow

- Bootstrap phase: work directly on `main`.
- Once the project matures: feature branches + pull requests with review.
- Track tasks with GitHub issues.
- Pull with rebase before pushing to avoid merge conflicts:
  ```bash
  git pull --rebase
  ```
