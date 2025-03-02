# IIIT Raichur

IIIT Raichur official application for students & other stakeholders

## Getting Started

## Project Architecture
This document explains the folder structure for a standard screen. The structure is designed to ensure scalability, maintainability, and clarity while managing a single screen in Flutter with possible tabs and state management using BLoC or Providers.

## Folder Overview

```
lib/
│── core/                     # Core configurations, constants, utilities
│   ├── config/               # App-level configurations (routes, etc.)
│   ├── network/              # API handling, interceptors
│   ├── services/             # Third-party services (Firebase, Payment, API Service etc.)
│   ├── utils/                # Helper functions
│   ├── themes/               # App Themes
│
│── data/                     # Data layer
│   ├── models/               # Data models
│   ├── repositories/         # Repository pattern for data sources
│   ├── data_sources/         # Local & remote data sources
│
│── presentation/             # UI & State management
│   ├── blocs/                # All BLoC logic (organized per feature)
│   │   ├── auth/             # BLoC Logic for all type of Authentication (Login etc.)
│   │   ├── theme/             # BLoC Logic for themes state
│   ├── screens/              # All screens (organized per feature)
│   │   ├── auth_screens/     # All Auth Screens in this folder (e.g. Signup, Login, etc.)
│   │   ├── profile_screen/   # Profile Screen UI
│   ├── widgets/              # Shared UI components (e.g. Error Screen, Snack bar etc.)
│
│── main.dart                 # App entry point
```

## Folder Details

### `presentation/blocs/{page_name}`
Contains all files related to the **BLoC (Business Logic Component)** implementation for the page or tab.
- **`page_name_bloc.dart`**: The core BLoC class handling business logic.
- **`page_name_event.dart`**: Defines all the events that trigger state changes.
- **`page_name_state.dart`**: Defines all possible states for the page.

---

### `presentation/screens/page_name`
Contains the main entry point for the page.
- **`page_name.dart`**: The root widget that combines all other elements (e.g., UI, BLoC, etc.).

---

### `data/`
Holds the shared data models and repositories for the entire page.
- **`repositories/{name_repository}`**: Contains the repository classes responsible for fetching/managing data (e.g., API calls, database queries).
- **`models/{name_model}`**: Contains the data models used in the page.

---

### `provider/`
Contains providers for state management using `ChangeNotifier` or any other provider-based approach.
- **`page_name_provider.dart`**: Manages the state for the entire page if BLoC is not used.

---

### `presentation/widgets/`
Contains reusable widgets specific to the page.
- **`page_widget.dart`**: Example reusable widget for the page.

---

## Usage Guidelines

- **Scalability**: The folder structure is designed to handle additional tabs or complex pages with minimal changes.
- **Modularity**: Each feature or tab has its own directory to encapsulate its functionality, ensuring clean code organization.
- **Reusability**: Widgets, models, and repositories are organized to be reusable within the page or across tabs.

This structure is ideal for managing pages with complex requirements while maintaining clarity and separation of concerns.

## Commit Message Guidelines
Use the following commit types to keep a clean and organized history in backend projects:

1. **`feat:`** – Adding a new backend feature or endpoint.  
   *Example:* `feat: add new screen or feature`

2. **`fix:`** – Fixing bugs in the backend logic or API responses.  
   *Example:* `fix: correct data validation in bloc etc.`

3. **`docs:`** – Updating backend documentation (API docs, comments).  
   *Example:* `docs: update documentation`

4. **`refactor:`** – Improving code structure without changing behavior, such as restructuring services or models.  
   *Example:* `refactor: move login screen to from login folder to auth folder`

5. **`test:`** – Adding or modifying tests for backend functions, routes, or services.  
   *Example:* `test: add unit tests for authentication service`

6. **`perf:`** – Performance improvements in backend logic, such as optimizing database queries or caching results.  
   *Example:* `perf: add caching for frequently accessed endpoints`

7. **`chore:`** – Maintenance tasks, like updating dependencies or configuration files.  
   *Example:* `chore: update dependency versions`

8. **`add:`** – Adding new modules, services, or components (e.g., new database tables or files).  
   *Example:* `add: implement Redis cache service`

9. **`update:`** – Modifying existing backend functionality or updating dependencies/configurations.  
   *Example:* `update: enhance data validation in BLoC`

10. **`delete:`** – Removing outdated code, unused files, or deprecated endpoints.  
    *Example:* `delete: remove unused email service`

11. **`style:`** – Minor code style changes (indentation, formatting) with no logic changes.  
    *Example:* `style: enhanced UI`