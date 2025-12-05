import 'dart:io';

// =========  Functions  ==========
String getInput(String prompt) {
  stdout.write(prompt);
  return stdin.readLineSync() ?? "";
}

double getValidDouble(String prompt) {
  while (true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();

    if (input != null && double.tryParse(input) != null) {
      return double.parse(input);
    } else {
      print(" Invalid input. Please enter a valid number.");
    }
  }
}

int getValidInt(String prompt) {
  while (true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();

    if (input != null && int.tryParse(input) != null) {
      return int.parse(input);
    } else {
      print(" Invalid number. Try again.");
    }
  }
}

// ========= OOP Class for SmartFood Navigator ==========
class SmartFoodNavigator {
  // ===== Feature 1: Food Calories Checker =====
  void checkCalories() {
    Map<String, int> foodCalories = {
      "apple": 52,
      "banana": 89,
      "biryani": 290,
      "burger": 354,
      "rice": 130,
      "egg": 78,
      "milk": 42,
    };

    print("\n--- Food Calories Checker ---");
    String item = getInput("Enter food name: ").toLowerCase();

    if (foodCalories.containsKey(item)) {
      print("✔ Calories in $item: ${foodCalories[item]} kcal");
    } else {
      print(" Item not found in database.");
    }
  }

  // ===== Feature 2: Healthy Meal Suggestion =====
  void suggestMeal() {
    print("\n--- Healthy Meal Suggestion ---");

    List<String> meals = [
      "Grilled Chicken + Salad",
      "Boiled Egg + Brown Bread",
      "Fruit Salad + Yogurt",
      "Vegetable Soup",
      "Oatmeal with Honey",
    ];

    print("👉 Your healthy meal for today:");
    print(meals[DateTime.now().second % meals.length]);
  }

  // ===== Feature 3: BMI Calculator =====
  void bmiCalculator() {
    print("\n--- BMI Calculator ---");

    double weight = getValidDouble("Enter weight (kg): ");
    double height = getValidDouble("Enter height (meters): ");

    double bmi = weight / (height * height);

    print("✔ Your BMI: ${bmi.toStringAsFixed(2)}");

    if (bmi < 18.5) {
      print("Underweight ");
    } else if (bmi < 24.9) {
      print("Normal ");
    } else if (bmi < 29.9) {
      print("Overweight ");
    } else {
      print("Obese ⚠");
    }
  }

  // ===== Feature 4: Daily Intake Planner =====
  void intakePlanner() {
    print("\n--- Daily Intake Planner ---");

    double calories = getValidDouble("Enter daily calorie goal: ");
    double consumed = getValidDouble("Enter calories consumed so far: ");

    double remaining = calories - consumed;

    if (remaining < 0) {
      print("⚠ You exceeded your calorie limit by ${remaining.abs()} kcal!");
    } else {
      print("✔ You can still eat $remaining kcal today.");
    }
  }

  // ===== Feature 5: Water Intake Reminder =====
  void waterReminder() {
    print("\n--- Water Intake Reminder ---");

    int glasses = getValidInt(
      "How many glasses of water did you drink today? ",
    );

    if (glasses >= 8) {
      print("✔ Great! You reached your daily goal! ");
    } else {
      print(" Drink ${8 - glasses} more glasses to complete the goal.");
    }
  }

  // ===== Feature 6: Recipe Recommendation =====
  void recipeRecommend() {
    print("\n--- Recipe Recommendation ---");
    String ing = getInput(
      "Enter main ingredient (egg/milk/rice/chicken): ",
    ).toLowerCase();

    Map<String, String> recipes = {
      "egg": "Egg Omelette",
      "milk": "Milk Smoothie",
      "rice": "Vegetable Fried Rice",
      "chicken": "Grilled Chicken",
    };

    if (recipes.containsKey(ing)) {
      print(" Recommended Recipe: ${recipes[ing]}");
    } else {
      print(" No recipe found for this ingredient.");
    }
  }

  // ===== Main Menu Method =====
  void start() {
    print("===================================");
    print("   WELCOME TO SMARTFOOD NAVIGATOR  ");
    print("===================================");
    print("Hello! 👋 I am your food & health helper.");
    print("Let's start your healthy journey!\n");

    while (true) {
      print("""
===============================
            MAIN MENU
===============================
1. Food Calories Checker
2. Healthy Meal Suggestion
3. BMI Calculator
4. Daily Intake Planner
5. Water Intake Reminder
6. Recipe Recommendation
7. Exit
""");

      int choice = getValidInt("Please select an option: ");

      switch (choice) {
        case 1:
          checkCalories();
          break;
        case 2:
          suggestMeal();
          break;
        case 3:
          bmiCalculator();
          break;
        case 4:
          intakePlanner();
          break;
        case 5:
          waterReminder();
          break;
        case 6:
          recipeRecommend();
          break;
        case 7:
          print("Goodbye! 👋 Stay healthy!");
          return;
        default:
          print(" Invalid option. Try again.");
      }

      print("\nPress Enter to continue...");
      stdin.readLineSync();
    }
  }
}

// ========= Main Program ==========
void main() {
  SmartFoodNavigator app = SmartFoodNavigator();
  app.start();
}
