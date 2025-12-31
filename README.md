
# CoreUtility

CoreUtility is a lightweight and reusable Swift Package that provides commonly used utility helpers for iOS and Swift projects.

It is designed to be framework-agnostic, easy to maintain, and safe to reuse across multiple apps and targets.

---

## ✨ Features

- String manipulation and masking utilities
- Date and time helpers
- Array and number utilities
- Random value generators
- File size and duration formatters
- JSON conversion helpers
- Validation utilities (email, phone)
- Threading helpers

✔ No UIKit / SwiftUI dependency  
✔ Swift Package Manager compatible  
✔ Suitable for multi-target and multi-brand apps

---

## 📦 Requirements

- iOS 13+
- Swift 5.7+
- Xcode 14+

---

## 📥 Installation

### Swift Package Manager (Xcode)

1. Open **File → Add Package Dependencies**
2. Enter the repository URL:
   ```
   https://github.com/email2sunilverma/CoreUtility.git
   ```
3. Select a version rule, for example:
   ```swift
   .from("2.0.0")
   ```

---

## 🚀 Usage

Import the package in your project:

```swift
import CoreUtility
```

### 🧵 String Utilities

```swift
StringUtils.truncate("Hello World", length: 5)
// Hello...

StringUtils.maskSensitiveData("1234567890123456")
// 1234********3456

StringUtils.extractInitials(from: "John Doe")
// JD
```

### ⏱ Date & Time Utilities

```swift
DateTimeUtils.currentTimestamp()

DateTimeUtils.timeAgo(from: someDate)
// 2h ago

DateTimeUtils.formatDuration(seconds: 3661)
// 1h 1m 1s
```

### 📚 Array Utilities

```swift
ArrayUtils.chunk([1, 2, 3, 4, 5], chunkSize: 2)
// [[1,2], [3,4], [5]]

ArrayUtils.unique([1, 1, 2, 3])
// [1,2,3]
```

### 🔢 Number Utilities

```swift
NumberUtils.calculatePercentage(value: 25, total: 200)
// 12.5%

NumberUtils.formatLargeNumber(1_200_000)
// 1.2M
```

### 🎲 Random Utilities

```swift
RandomUtils.generateCode(length: 6)
// A9F2KQ

RandomUtils.uuid()
// UUID string
```

### ✅ Validation Utilities

```swift
ValidationUtils.isValidEmail("test@mail.com")
// true

ValidationUtils.isValidPhoneNumber("+919876543210")
// true
```

### 🧾 JSON Utilities

```swift
JSONUtils.toJSONString(["key": "value"])
// {"key":"value"}

JSONUtils.toDictionary("{\"key\":\"value\"}")
// ["key": "value"]
```

### 🧵 Thread Utilities

```swift
ThreadUtils.runInBackground {
    // background work
}

ThreadUtils.runOnMain {
    // main-thread work
}
```

---

## 🗂 Project Structure

```
Sources/CoreUtility/
├── StringUtils.swift
├── ArrayUtils.swift
├── DateTimeUtils.swift
├── NumberUtils.swift
├── RandomUtils.swift
├── FileUtils.swift
├── ValidationUtils.swift
├── JSONUtils.swift
├── ThreadUtils.swift
├── GreetingUtils.swift
```

Each utility follows **single-responsibility design**.  
There is no `CoreUtility.swift` facade, by design.

---

## 🔄 Versioning

This package follows [Semantic Versioning](https://semver.org/):

| Type    | Description                    |
|---------|--------------------------------|
| MAJOR   | Breaking changes               |
| MINOR   | Backward-compatible features   |
| PATCH   | Bug fixes                      |

**Example:**
- `2.0.0` – Removed CoreUtility facade and exposed utilities directly

---

## 🚫 Out of Scope

This package intentionally does **not** include:

- UI components (UIKit / SwiftUI)
- Networking layers
- Persistence or database logic
- App-specific business logic

---

## 🧪 Testing

Unit tests can be added under:

```
Tests/CoreUtilityTests/
```

Recommended for production usage.

---

## 📄 License

**MIT License**  
Free to use, modify, and distribute.

---

## 🤝 Contributing

Contributions are welcome:

- Add new generic utilities
- Improve documentation
- Add unit tests

Please follow clean coding practices and maintain backward compatibility.

---

## 👤 Author

**Sunil Verma**  
GitHub: [https://github.com/email2sunilverma](https://github.com/email2sunilverma)
