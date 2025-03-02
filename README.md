# IIIT Raichur

IIIT Raichur official application for students & other stakeholders

## Getting Started

## Project Architecture

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
│   │   ├── auth/             # BLoC Logic for themes state
│   ├── screens/              # All screens (organized per feature)
│   │   ├── auth_screens/     # All Auth Screens in this folder (e.g. Signup, Login, etc.)
│   │   ├── profile_screen/   # Profile Screen UI
│   ├── widgets/              # Shared UI components (e.g. Error Screen, Snack bar etc.)
│
│── main.dart                 # App entry point

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