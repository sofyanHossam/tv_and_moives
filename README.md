# tv_and_moives
This Flutter app is built following Clean Architecture, using Bloc for state management, and fetching data from a custom API (Backend Repo Here).
We ensure SOLID principles are respected, especially Singleton, Abstraction (Interfaces), and Dependency Injection.

🏗 Clean Architecture
We use a 3-layer Clean Architecture:

Presentation Layer (UI + Bloc)

Shows the UI and reacts to user inputs using BLoC pattern.

Domain Layer (Entities + UseCases + Repository Interfaces)

Pure business logic. No Flutter or API code here.

Data Layer (Repository Implementation + API + Models)

Handles API calls, mapping data, and saving/retrieving it.

Why Clean Architecture?

Clear separation of concerns.

Easy to test, maintain, and scale.

Independent of frameworks.

🎯 Bloc (flutter_bloc)
Bloc (Business Logic Component) manages states and events.

It listens to UI events.

Calls the appropriate UseCase.

Emits new states based on the response.

Why Bloc?

Makes UI reactive.

Full separation between UI and business logic.

Scalable for large apps.

🌐 API (Backend)
We use this backend: Backend Netflix Clone

Auth (Login / Sign Up) to get a token.

Fetch Movies and TV Shows.

Play trailers from YouTube.

Flow:
User logs in ➔ gets token ➔ saved using shared_preferences.

Token used to fetch protected API data.

🚀 Dio (Networking)
Dio is used for all HTTP requests.

Why Dio?

Easy interceptors for adding the token.

Smart error handling.

Great performance for RESTful APIs.

🔧 Service Locator (get_it)
We use get_it for Dependency Injection.

Central place to register and retrieve instances (like Dio, Repositories, Blocs).

Makes testing and scaling much easier.

🛠 SOLID Principles
Single Responsibility: Each class has one job.

Open/Closed: Code is open for extension, closed for modification.

Liskov Substitution: We rely on abstractions (Interfaces).

Interface Segregation: We define small, specific interfaces.

Dependency Inversion: Higher layers depend on abstractions, not implementations.

Special Focus:

Singletons: Services like Dio and AuthRepository are singletons.

Abstractions: All repositories are interfaces first, then implemented.

Dependency Injection: Managed by get_it.

📦 Packages Used

Package	Purpose
cupertino_icons: ^1.0.8	iOS style icons
flutter_bloc: ^8.1.6	State Management (Bloc)
reactive_button: ^0.0.9	Fancy buttons for better UX
dartz: ^0.10.1	Functional programming (Result handling with Either/Option)
dio: ^5.8.0+1	Networking (API calls)
logger: ^2.5.0	Logging especially for auth and errors
get_it: ^8.0.3	Dependency Injection (Service Locator)
flutter_svg: ^2.0.17	Display SVG images
fan_carousel_image_slider: ^1.3.0	Carousel/Slider for movies
youtube_player_flutter: ^9.1.1	Play trailers from YouTube
shared_preferences	Local storage for token/user data
📱 Features
User Authentication (Login / Sign Up)

Save auth token securely.

Fetch and display Movies and TV Shows.

Watch movie trailers inside the app.

Responsive and clean UI/UX.

Beautiful movie carousel and SVG icons support.
