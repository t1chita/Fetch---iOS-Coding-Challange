# Fetch - iOS Coding Challenge

## Overview
🎉 Fetch is a native iOS app that allows users to browse recipes in the Dessert category using the [TheMealDB API](https://themealdb.com/api.php). Users can view a list of dessert meals and access detailed information about each meal, including its name, instructions, ingredients, and measurements. 🎉

---
## ScreenShots
**HomeView**

  ![Screenshot 2024-12-20 at 12 57 28](https://github.com/user-attachments/assets/57a447fb-c512-4018-b6c1-0f31a7118112)
  
**DetailsView**

  ![Screenshot 2024-12-20 at 12 58 42](https://github.com/user-attachments/assets/3decc05d-2ea7-4c1f-a3c9-30dc26fa12f1)
  
---
## Features
🍰 - Fetch and display a list of dessert meals sorted alphabetically.
🍰 - View detailed information for a selected meal:
  - Meal name
  - Cooking instructions
  - Ingredients and their respective measurements.
🍰 - Filters out any null or empty values from the API responses.
🍰 - Fully built using **Swift Concurrency** (`async/await`).
🍰 - Developed with **SwiftUI** to ensure a modern and user-friendly interface.

---

## Endpoints Used
1. **Fetch Dessert Meals**:
   - `https://themealdb.com/api/json/v1/1/filter.php?c=Dessert`
   - Provides a list of meals in the Dessert category.
2. **Fetch Meal Details**:
   - `https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID`
   - Provides details for a meal by its ID.

---

## Installation
🍎 1. Clone the repository:
   ```bash
   git clone https://github.com/t1chita/Fetch---iOS-Coding-Challange.git
   ```
🍎 2. Open the project in Xcode:
   ```bash
   cd fetch-ios-challenge
   open DessertMeals.xcodeproj
   ```
🍎 3. Build and run the app on the latest iOS simulator or device.

---

## How It Works
🎯 1. **Home View**:
   - Fetches and displays a list of dessert meals sorted alphabetically.
   - Each meal is presented in a simple, scrollable list.
🎯 2. **Detail View**:
   - When a user selects a meal, detailed information is fetched from the API and displayed, including:
     - Meal name
     - Instructions
     - Ingredients and measurements in a clear 1-to-1 format.
🎯 3. **Error Handling**:
   - Graceful handling of API errors with fallback UI messages.

---

## Key Technologies
🚀 - **SwiftUI**: Used for building modern and interactive user interfaces.
🚀 - **Swift Concurrency**: Ensures efficient and clean asynchronous code with `async/await`.
🚀 - **MVVM Architecture**: Separates concerns for better testability and maintainability.
🚀 - **Networking**: Uses `URLSession` to fetch data from TheMealDB API.

---

## Project Structure
```plaintext
Fetch
├── Models
│   └── Meal.swift  ┉ // Model for meal data.
├── ViewModels
│   │── HomeViewModel.swift // Handles desserts list Fetching
│   └── DetailsViewModel.swift // Handles meal detail fetching.
├── Views
│   ├── HomeView.swift   ┉ // Displays the list of meals.
│   └── DetailsView.swift┉ // Displays details for a selected meal.
└── Resources
     └── Assets.xcassets ┉ // Images and colors.
```

---

## Design Guidelines
🖌️ While UI/UX design was not the primary focus, the app adheres to the following principles:
- **User-Friendly Navigation**: Intuitive and clean interface.
- **Responsive Design**: Adapts to various device sizes and orientations.
- **Accessible**: Texts and layouts follow basic accessibility guidelines. 🖌️

---

## Future Enhancements
✨ - Implement search functionality to filter meals dynamically.
✨ - Add support for categories beyond "Dessert."
✨ - Provide offline caching for meal details.

---

## License
📜 This project is licensed under the [MIT License](LICENSE).

---

## Contact
📧 For any questions or feedback, feel free to reach out:
- **Email**: [t1chitashvili@gmail.com](mailto:t1chitashvili@gmail.com)
- **LinkedIn**: [Temuri Chitashvili](https://www.linkedin.com/in/temurchitashvili/) 
- **Medium**: [t1chitashvili](https://medium.com/@t1chitashvili) 
- **X (Twitter)**: [temch1t](https://x.com/temch1t) 
