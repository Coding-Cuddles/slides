### Exercise 1: Sprout a Simple Class

Topic 1: When refactoring legacy code, how do you decide whether to extract a Sprout Method versus 
creating a Sprout Class? What are the trade-offs in terms of testability, cohesion, 
and future maintenance?

Topic 2: How do you recognize when legacy behavior should remain within the current class versus 
when it’s time to sprout a new class for better separation of concerns?

Topic 3: In a large legacy system with high coupling, how can Sprout Method and Sprout Class be 
part of a broader strategy to gradually modernize the codebase?

- **Objective:** Implement the Sprout Method on a simple class.
- **Task:**
  - Create a `Car` class with a `drive()` method that prints `"The car is driving!"`.
  - Use the **Sprout Method** to add new functionality (e.g., adding a `fuel()` method) to the `Car` 
    class, **without modifying** the original `drive()` method.
  - Add a `fuel()` method that prints `"Refueling the car!"`.
  - Extend the `Car` class to call both `drive()` and `fuel()` in the new method 
    `drive_with_fuel()`.

- **Hint:**
  - Focus on isolating the changes to the `drive_with_fuel()` method, while keeping the original 
    `drive()` method intact.

- **Time Limit:** 5-10 minutes

---

### Exercise 2: Implement a Wrap Method

- **Objective:** Apply the **Wrap Method** to enhance functionality.
- **Task:**
  - Create a `Coffee` class with a `cost()` method that prints `"Basic coffee: $5"`.
  - Implement a **Wrap Method** where a new class, `MilkDecorator`, wraps the `Coffee` class to 
    modify its behavior by adding a cost for milk.
  - The `MilkDecorator` class should call the original `cost()` method of `Coffee` and then add an 
    additional cost for milk.
  - After that, create a `MilkDecorator` instance and call the `cost()` method to see the new 
    behavior.

- **Time Limit:** 5-10 minutes

---

### Exercise 3: Wrapping Multiple Behaviors

- **Objective:** Apply the **Wrap Method** to chain multiple decorators.
- **Task:**
  - Building on the previous exercise, extend the `MilkDecorator` to create a `SugarDecorator`.
  - The `SugarDecorator` should add an additional cost for sugar, while still keeping the 
    `MilkDecorator` functionality.
  - Create a `Coffee` object and wrap it with both `MilkDecorator` and `SugarDecorator`.
  - Use the `cost()` method to see the total cost after both decorators are applied.

- **Time Limit:** 5-10 minutes

---

### Exercise 4: Python Decorator for Wrap Method

- **Objective:** Implement a **decorator function** in Python to wrap a method.
- **Task:**
  - Create a `Car` class with a `drive()` method that prints `"The car is driving!"`.
  - Write a **Python decorator function** that adds functionality to the `drive()` method. 
    For instance, before calling the `drive()` method, the decorator could print 
    `"Starting the car..."`.
  - Apply the decorator function to the `drive()` method and call it.

- **Time Limit:** 5-10 minutes

---

### Exercise 5: Refactor with Decorators

- **Objective:** Refactor an existing method to use a decorator for extra functionality.
- **Task:**
  - Given a simple `User` class with a `login()` method that prints `"User logged in"`, write 
    a decorator that logs an additional message such as `"Tracking login time..."` whenever the 
    `login()` method is called.
  - Apply the decorator to the `login()` method and test it.

- **Time Limit:** 5-10 minutes


