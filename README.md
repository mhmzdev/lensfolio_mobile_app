# Lensfolio Mobile App - In Progress at [flutterkaro](https://flutterkaro.mhmz.dev)

A Flutter mobile application built with clean architecture, layer-first structure, and best practices.

## 📋 Table of Contents

- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Architecture](#architecture)
- [State Management](#state-management)
- [Code Generation](#code-generation)
- [Contributing](#contributing)

---

## 👀 Look'n Feel
This is a little glimpse of Lensfolio:

<img src="https://github-production-user-asset-6210df.s3.amazonaws.com/43790152/540062434-1794ef64-6af8-4261-b68f-a645ef39efea.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVCODYLSA53PQK4ZA%2F20260124%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20260124T065005Z&X-Amz-Expires=300&X-Amz-Signature=33ad101832b23835e23c13d7b8475d10611465ba79e62bf9d67719293bb8a2ec&X-Amz-SignedHeaders=host" height="580"> <img src="https://github-production-user-asset-6210df.s3.amazonaws.com/43790152/540062561-0035b2da-d998-40ab-9d8b-bc7aa808f729.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVCODYLSA53PQK4ZA%2F20260124%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20260124T065214Z&X-Amz-Expires=300&X-Amz-Signature=912ff6b66e24e5e7fcfecd05634fbe73ffdf58944800660adbc902d92a12adc3&X-Amz-SignedHeaders=host" height="580"> <img src="https://github-production-user-asset-6210df.s3.amazonaws.com/43790152/540062560-7c416971-cf53-4d98-9f33-b41f7c9b1866.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVCODYLSA53PQK4ZA%2F20260124%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20260124T065237Z&X-Amz-Expires=300&X-Amz-Signature=0f2d536b52fb42a60d4e3367809a7525dc732e2c06118db3cb502629577fb3e6&X-Amz-SignedHeaders=host" height="580"> 

<img src="https://github-production-user-asset-6210df.s3.amazonaws.com/43790152/540062562-1827abec-3419-4cb4-8639-fb1d3a4db4ad.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVCODYLSA53PQK4ZA%2F20260124%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20260124T065258Z&X-Amz-Expires=300&X-Amz-Signature=d62a5cf4893cb2ba142f9c12d2e8bcde6f72e3c16f3092676c0d0423586848fb&X-Amz-SignedHeaders=host" height="580"> <img src="https://github-production-user-asset-6210df.s3.amazonaws.com/43790152/540062563-e3027ec0-1c0d-4d15-878f-8a0850941198.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVCODYLSA53PQK4ZA%2F20260124%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20260124T065326Z&X-Amz-Expires=300&X-Amz-Signature=5374e8d34096501de78e7a22535f2991030a2a90abe992ddfb5aece31531072e&X-Amz-SignedHeaders=host" height="580">

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.38.2 or higher)
- Dart SDK (3.10.0 or higher)
- Node.js (for Hygen code generation)
- CocoaPods (for iOS development)

### Installation

1. **Clone the repository:**
```bash
git clone <repository-url>
cd lensfolio_mobile_app
```

2. **Install dependencies:**
```bash
flutter pub get
```

3. **Install Hygen globally** (for code generation):
```bash
npm install -g hygen
```

4. **Run the app:**

**Option 1: From VS Code/Cursor**
- Open Debug panel (Cmd/Ctrl + Shift + D)
- Select your desired configuration
- Click Run

**Option 2: From Terminal**
```bash
flutter run
```

---

## 🏗️ Architecture

This project follows a **modified MVVM architecture** with layer-first organization.

For detailed architecture documentation, see [Architecture.md](Architecture.md)

**Quick Overview:**
- **Layer-First Structure**: Code organized by technical layer (blocs, repos, models, ui)
- **Single Source of Truth**: Cubit holds all app-level state
- **Two-Layer State**: Cubit (app-level) + Provider (ephemeral UI)
- **Unidirectional Data Flow**: View → ViewModel → Model → ViewModel → View
- **Clean Separation**: UI, Business Logic, Data layers are clearly separated

---

## ⚡ Code Generation

This project uses **Hygen** for boilerplate code generation. Templates are located in `_templates/`.

### Detailed Documentation

For comprehensive guides, see:
- [Cubit Nested Template](_templates/cubit/nested/README.md) - Complex cubits with multiple operations
- [Cubit Simple Template](_templates/cubit/simple/README.md) - Simple cubits for basic operations
- [Cubit Update Template](_templates/cubit/update/README.md) - Update existing cubits with new operations
- [Screen Template](_templates/screen/README.md) - Screen generation guide

---

## 🤝 Contributing

For development workflow, coding conventions, and contribution guidelines, see [CONTRIBUTING.md](CONTRIBUTING.md)

## ⭐️ Star History

[![Star History Chart](https://api.star-history.com/svg?repos=mhmzdev/lensfolio_mobile_app&type=Date)](https://www.star-history.com/#mhmzdev/lensfolio_mobile_app&Date)

## 🔑 License
- This project is licensed under the MIT License - see the [LICENSE](LICENSE.md) file for details

## 🧑 Author

#### Muhammad Hamza
[![LinkedIn Link](https://img.shields.io/badge/Connect-Hamza-blue.svg?logo=linkedin&longCache=true&style=social&label=Connect
)](https://www.linkedin.com/in/mhmzdev)

You can also follow my GitHub Profile to stay updated about my latest projects:

[![GitHub Follow](https://img.shields.io/badge/Connect-Hamza-blue.svg?logo=Github&longCache=true&style=social&label=Follow)](https://github.com/m-hamzashakeel)

If you liked the repo then kindly support it by giving it a star ⭐!

Copyright (c) 2026 MUHAMMAD HAMZA
