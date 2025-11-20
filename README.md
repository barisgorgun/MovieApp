# 🎬 MovieDB iOS App  
**SwiftUI · MVVM + Clean Architecture · Async/Await · Dependency Injection · Unit Tests**

This project is a **senior-level** MovieDB application built to practice and demonstrate modern iOS development patterns.  
It uses the TMDB API and is fully implemented with **SwiftUI**, **Clean Architecture**, **async/await**, **in-memory image caching**, **Dependency Injection**, and **Unit Tests**.

---

## 🚀 Features

### 🎞 Home Screen
- Sections for Top Rated, Popular, and Now Playing movies  
- Infinite scroll for each section  
- Skeleton loading with shimmer-style placeholders  
- Horizontal carousel layout  
- Reusable `MovieCard` components  

### 🔍 Search
- Debounced search flow (reduces unnecessary API calls)  
- Modern grid-style result layout  
- Favorite icons with instant state updates  
- Infinite scroll pagination support  

### ⭐ Favorites
- Global `FavoritesStore` implemented as an `EnvironmentObject`  
- Add / remove favorites from:
  - Home
  - Search
  - Movie Detail
- Dedicated Favorites screen  
- Local persistence using `UserDefaults`  

### 📄 Movie Detail
- Hero header with poster and backdrop  
- Cast list (credits)  
- Recommended movies section  
- Add / Remove Favorite support  
- Structured layout (Info, Cast, Recommendations)

---

## 🏛 Architecture

The project follows **MVVM + Clean Architecture** principles.

```text
MovieApp
├── Domain
│   ├── Entities
│   ├── UseCases
│   └── Repository Interfaces
├── Data
│   ├── DTOs
│   ├── Mappers
│   ├── API Service
│   └── Repository Implementations
├── Presentation
│   ├── Screens
│   │   ├── Home
│   │   ├── Search
│   │   ├── MovieDetail
│   │   └── Favorites
│   ├── Components
│   ├── Helpers
│   └── ImageCache (MemoryCacheActor)
└── App
    ├── AppDIContainer
    └── MovieAppApp
```

**Layer responsibilities:**

- **Domain**  
  - Business rules, entities, use cases, and repository protocols  
  - Completely independent from UI and frameworks, fully testable

- **Data**  
  - Network DTOs, mappers, API services, and repository implementations  
  - Bridges the gap between the TMDB API and the Domain layer

- **Presentation**  
  - SwiftUI screens, ViewModels, global `FavoritesStore`, helper views and UI utilities  
  - Manages all UI state and view logic

- **App**  
  - Application entry point (`MovieAppApp`)  
  - `AppDIContainer` for dependency wiring and environment setup

---

## 🧩 Dependency Injection

All dependencies are wired via **AppDIContainer**:

- Repository instances  
- API service (`APIService`)  
- UseCase factories  
- ViewModel factories  
- Global `FavoritesStore` (`EnvironmentObject`)  

This approach provides:

- High testability  
- Clear separation of concerns  
- Easy feature extension and maintenance  
- Strong alignment with Clean Architecture

---

## 🎞 Image Cache

For performance and smoother scrolling, the app uses a custom **MemoryCacheActor**:

- Fully thread-safe  
- Designed for Swift Concurrency (`actor` based)  
- Works seamlessly with async image loading  
- Provides noticeable performance improvements on Home and Search screens

---

## 🧪 Unit Tests

The project includes unit tests for key components:

### ✔ FavoritesStoreTests  
- `load()` behavior  
- `toggle()` favorite add / remove behavior  
- `isFavorite()` correctness  
- Uses `MockFavoritesRepository` for isolated testing

### ✔ MovieDetailViewModelTests  
- `loadDetail()` success and error flows  
- `loadCredits()` behavior  
- `loadRecommendations()` and pagination logic  
- State management via `MovieDetailState`  
- Uses `MockMovieRepository` for isolation  

### ✔ HomeViewModelTests  
- `loadInitialData()` loading for Top Rated, Popular and Now Playing sections  
- Pagination tests (`loadMoreTopRated`, `loadMorePopular`, `loadMoreNowPlaying`)  
- Error handling reflected in view state  

> Note: The structure makes it easy to extend tests to SearchViewModel, repositories, or additional use cases.

All tests are:

- Compatible with `async/await`  
- Concurrency-safe with `@MainActor` where needed  
- Using mocks and dummy data for fully isolated behavior

---

## 🔧 Setup: TMDB API Key (XCConfig Configuration)

To avoid committing API keys into source control, the project uses **Debug.xcconfig** and **Release.xcconfig**.

### 1️⃣ Create a Config folder  

In the project root, create:

```text
MovieApp/Config
```

### 2️⃣ Add TMDB key to Debug.xcconfig

In `Config/Debug.xcconfig`:

```text
TMDB_API_KEY = <your_tmdb_key_here>
```

Optionally, you can add a different key to `Release.xcconfig`.

### 3️⃣ Link .xcconfig in Xcode Build Settings

- Select the project in Xcode  
- Go to the **Info** tab  
- Assign `Debug.xcconfig` to Debug configuration  
- Assign `Release.xcconfig` to Release configuration

### 4️⃣ Use TMDB_API_KEY inside Info.plist

In `Info.plist`:

```xml
<key>TMDB_API_KEY</key>
<string>$(TMDB_API_KEY)</string>
```

This ensures:

- API keys never end up in your Git repository  
- Different keys for different build configurations are possible

---

## 📸 Screenshots (Placeholder)

```markdown
![Home](Screenshots/home.png)
![Detail](Screenshots/detail.png)
![Search](Screenshots/search.png)
![Favorites](Screenshots/favorites.png)
```

---

## 📦 Tech Stack

- **SwiftUI**
- **Async/Await (Swift Concurrency)**
- **MVVM + Clean Architecture**
- **Networking via URLSession**
- **Configuration management via XCConfig**
- **Actor-based in-memory image caching**
- **Dependency Injection via AppDIContainer**
- **Unit Tests using XCTest**

---

## 👨‍💻 Developer Notes

This project was built to:

- Practice senior-level iOS architecture patterns  
- Apply test-driven and test-friendly architecture  
- Use Swift Concurrency (async/await, actors) in a real-world context  
- Deeply understand SwiftUI state management, navigation, and dependency injection  

---

## 📝 License

This project is intended for personal learning and portfolio purposes.

## 👨‍💻 Developer  
**Barış Görgün**  
iOS Developer  

[GitHub](https://github.com/barisgorgun) •  
[LinkedIn](https://www.linkedin.com/in/baris-gorgun-857572103/) 

## 🌍 Diller

[🇹🇷 Türkçe için tıklayın](README.tr.md)
---

<p align="center">
  Made with ❤️ by <a href="https://github.com/barisgorgun">Barış Görgün</a>
</p>

