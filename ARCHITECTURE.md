
## 🏛️ Architecture Pattern

This project follows a **modified MVVM (Model-View-ViewModel) architecture** with layer-first organization, implementing clean architecture principles.

### Layer Separation

```
┌─────────────────────────────────────────────────────────────┐
│                     UI Layer (View)                         │
│  • Screens, Widgets                                         │
│  • Pure presentation logic                                  │
│  • Observes state, displays UI                             │
└─────────────────┬───────────────────────────────────────────┘
                  │ calls methods / observes
┌─────────────────▼───────────────────────────────────────────┐
│              Provider (Ephemeral ViewModel)                 │
│  • Screen-specific state                                    │
│  • UI state (visibility, focus, etc.)                      │
│  • Delegates business logic to Cubit                       │
└─────────────────┬───────────────────────────────────────────┘
                  │ invokes
┌─────────────────▼───────────────────────────────────────────┐
│               Cubit (App ViewModel)                         │
│  • App-level state management                              │
│  • Business logic                                           │
│  • Single source of truth                                  │
│  • Coordinates with repositories                           │
└─────────────────┬───────────────────────────────────────────┘
                  │ calls
┌─────────────────▼───────────────────────────────────────────┐
│            Repository (Model/Data Layer)                    │
│  • API calls, Firebase operations                          │
│  • Data parsing and transformation                         │
│  • Data caching (if needed)                                │
│  • Error handling                                           │
└─────────────────┬───────────────────────────────────────────┘
                  │ uses
┌─────────────────▼───────────────────────────────────────────┐
│              Models (Data Structures)                       │
│  • Immutable data classes (Freezed)                        │
│  • JSON serialization                                       │
│  • Business entities                                        │
└─────────────────────────────────────────────────────────────┘
```

### Key Architectural Principles

#### 1. **Single Source of Truth**
- **Cubit** is the single source of truth for app-level state
- UI never holds business data, only reads from Cubit
- All state mutations happen through Cubit methods
- Provider only manages ephemeral UI state (screen-specific)

```dart
// ✅ Good: Cubit as single source of truth
final userData = UserCubit.c(context, true).state.fetch.data;

// ❌ Bad: Storing business data in widget/provider
class _MyState {
  UserData? user; // Don't do this for business data
}
```

#### 2. **Unidirectional Data Flow**
Data flows in one direction: **View → ViewModel → Model → ViewModel → View**

```
User Action → Provider/Cubit Method → Repository → API/Firebase
                                                      ↓
UI Update ← State Emission ← Data Processing ← Response
```

#### 3. **Separation of Concerns**

| Layer | Responsibility | What It Does | What It Doesn't Do |
|-------|---------------|--------------|-------------------|
| **UI** | Presentation | Display data, capture input | Business logic, API calls |
| **Provider** | Ephemeral state | UI state management | Business logic, data persistence |
| **Cubit** | Business logic | State management, orchestration | UI rendering, API calls |
| **Repository** | Data access | API/Firebase calls, parsing | Business logic, state management |
| **Models** | Data structure | Define data shape | Logic, mutations |

#### 4. **Dependency Rule**
Dependencies point inward (toward business logic):

```
UI → Provider → Cubit → Repository → External Services
```

- UI depends on Provider/Cubit
- Provider depends on Cubit
- Cubit depends on Repository
- Repository depends on Models and Services
- **Inner layers never depend on outer layers**

#### 5. **Testability**
Each layer can be tested independently:

```dart
// Test Cubit without UI
test('fetch user data', () async {
  final cubit = UserCubit();
  await cubit.fetch();
  expect(cubit.state.fetch.isSuccess, true);
});

// Test Repository with mocks
test('fetch from API', () async {
  final repo = UserRepo.ins;
  final data = await repo.fetch();
  expect(data, isA<UserData>());
});
```

#### 6. **Immutability**
All state and models are immutable:

- Models use **Freezed** (immutable by default)
- State changes create new instances
- Prevents accidental mutations
- Easier to track state changes

```dart
// ✅ Good: Immutable state updates
emit(state.copyWith(fetch: state.fetch.toSuccess(data: data)));

// ❌ Bad: Direct mutation
state.fetch.data = data; // Not possible with Freezed
```

#### 7. **Layer-First Organization**
Unlike feature-first, we organize by **technical layer**:

**Benefits:**
- **Discoverability**: All cubits in one place, all repos in another
- **Reusability**: Easier to share code across features
- **Scalability**: Add features without reorganizing structure
- **Clarity**: Technical boundaries are explicit

**Trade-offs:**
- Features span multiple directories
- Need discipline to maintain separation

---
