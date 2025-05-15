---
title: Working Effectively with Legacy Code
subtitle: Chapter 6 – I Need to Make a Change. What Can I Do?
...

# Pre-work

- Book: *Working Effectively with Legacy Code* by Michael Feathers
- Focus: Chapter 6 change techniques
- Optional: <https://michaelfeathers.silvrback.com/the-sprout-method>

# Chapters

::: columns

:::: column

| Chapter                     | Time     |
| ---------------------------| -------- |
| Warmup                     | 00:00:00 |
| Sprout Method              | 00:05:00 |
| Sprout Class               | 00:15:00 |
| Wrap Method                | 00:25:00 |

::::

:::: column

| Chapter                     | Time     |
| ---------------------------| -------- |
| Wrap Class                 | 00:35:00 |
| Strategy Comparison        | 00:45:00 |
| Summary & Q&A              | 00:55:00 |

::::

:::

# Timetable

| Activity                     | Time   |
| ----------------------------| ------ |
| Warmup & Goals              | 5 min  |
| Sprout Method & Class       | 20 min |
| Wrap Method & Class         | 20 min |
| Compare & Discuss           | 5 min  |
| Summary & Q&A               | 10 min |

# Warmup

- What’s your current strategy when you need to change legacy code?
- Ever added a wrapper instead of modifying directly?
- Share in chat: "Sprout" or "Wrap" — which sounds safer to you?

\note{
Use this to establish mental models and prepare learners to explore change-based techniques.
}

# Sprout Method

- Add new logic in a new method
- Call the new method from existing one
- No edits to original logic

## Example

```python
def charge(customer):
    return new_charge_logic(customer)

def new_charge_logic(customer):
    # New behavior
    return 42
```

# Sprout Class

- Create a new class for new behavior
- Keeps old logic intact
- Ideal for complex changes needing state

## Example

```python
def calculate_invoice(cust):
    return InvoiceCalculator(cust).run()

class InvoiceCalculator:
    def __init__(self, customer):
        self.customer = customer
    def run(self):
        # New logic here
        pass
```

# Wrap Method

- Create a method that wraps (delegates to) the old method
- Adds logic *before* or *after* the call
- Leaves original untouched

## Example

```python
def send_invoice(customer):
    log_invoice(customer)
    real_send_invoice(customer)

def real_send_invoice(customer):
    print("Sending...")
```

# Wrap Method Benefits

- Low risk: no edits to legacy method
- Adds behavior transparently
- Good when you can’t or don’t want to touch legacy

# Wrap Class

- Create a new class that wraps the legacy class
- Delegates calls while injecting new logic
- Helps isolate change when subclassing is risky

## Example

```python
class EmailSenderWrapper:
    def __init__(self, real_sender):
        self.real = real_sender

    def send(self, message):
        self.log(message)
        return self.real.send(message)

    def log(self, msg):
        print("Logging email:", msg)
```

# Decorators and the Wrap Method

- Decorators are a special form of wrapping that allows for dynamic extension.
- In the context of the Wrap Method, decorators provide an elegant solution for layering additional behavior.

### C++ Decorator Pattern Example

```cpp
#include <iostream>
#include <memory>

class Coffee {
public:
    virtual void cost() const { std::cout << "Basic coffee: $5\n"; }
};

class CoffeeDecorator : public Coffee {
protected:
    std::unique_ptr<Coffee> coffee;
public:
    CoffeeDecorator(std::unique_ptr<Coffee> c) : coffee(std::move(c)) {}
    void cost() const override {
        coffee->cost();
    }
};

class MilkDecorator : public CoffeeDecorator {
public:
    MilkDecorator(std::unique_ptr<Coffee> c) : CoffeeDecorator(std::move(c)) {}
    void cost() const override {
        CoffeeDecorator::cost();
        std::cout << "Adding milk: $1\n";
    }
};

int main() {
    auto coffee = std::make_unique<Coffee>();
    MilkDecorator decorated_coffee(std::move(coffee));
    decoratedCoffee.cost();
}
```

\note{
This C++ code shows how decorators wrap an object and add additional behavior. The `MilkDecorator` class extends the `Coffee` class without altering its original structure.
}

# Decorator Pattern in Python

- **Python**: A more dynamic and concise way to implement decorators.
- Can be used to modify methods or class behavior at runtime using functions or class-based decorators.

### Python Decorator Example

```python
class Coffee:
    def cost(self):
        print("Basic coffee: $5")

class CoffeeDecorator:
    def __init__(self, coffee):
        self._coffee = coffee

    def cost(self):
        self._coffee.cost()

class MilkDecorator(CoffeeDecorator):
    def cost(self):
        self._coffee.cost()
        print("Adding milk: $1")

# Usage
coffee = Coffee()
decorated_coffee = MilkDecorator(coffee)
decorated_coffee.cost()
```

\note{
In Python, decorators can be more flexible. The `MilkDecorator` is a class-based decorator that modifies the behavior of the `cost()` method of the `Coffee` class, just as in C++, but with simpler syntax.
}

# Comparison & Benefits

| Feature               | C++                                         | Python                                   |
|-----------------------|---------------------------------------------|------------------------------------------|
| Syntax                | Classes, inheritance, virtual methods       | Functions, classes, dynamic method calls |
| Flexibility           | Requires careful memory management         | More dynamic and flexible               |
| Usage Scenarios       | Performance-sensitive environments          | More dynamic, quick prototyping         |

\note{
Summarize the differences in the implementation of decorators in C++ and Python, emphasizing the trade-offs between the two languages in terms of flexibility and performance.
}

# Code Walkthrough: C++

- Step-by-step breakdown of C++ code:
    - **Coffee**: Base class with the `cost()` method.
    - **CoffeeDecorator**: A wrapper for extending functionality.
    - **MilkDecorator**: Adds the milk cost dynamically.
  
\note{
Take the time to walk through the C++ code. Discuss how decorators encapsulate functionality without modifying the original class and how they can be stacked for layered behaviors.
}

# Code Walkthrough: Python

- Step-by-step breakdown of Python code:
    - **Coffee**: Basic coffee class.
    - **CoffeeDecorator**: The decorator base class.
    - **MilkDecorator**: Adds milk to the cost dynamically.

\note{
Explain how Python decorators are simpler to implement and why this is a great tool for rapid development and cleaner code.
}

# Q&A and Wrap-up

- When would you prefer using decorators over other design patterns (like strategy or composite)?
- What are some potential drawbacks to using decorators excessively?

\note{
Encourage the students to reflect on practical uses and drawbacks. Ask them to think about when they might reach for this pattern in their own projects.
}

# When to Use Each

| Technique        | Use When...                              |
|------------------|-------------------------------------------|
| Sprout Method    | Small change fits in one method           |
| Sprout Class     | Larger change needs state/context         |
| Wrap Method      | Add logic before/after a method safely    |
| Wrap Class       | Insert logic across many methods or state |

\note{
You can draw a 2x2: *Sprout vs Wrap* on one axis, *Method vs Class* on the other.
Helps learners visualize choices.
}

# Summary

- **Sprout** = add new code that old code calls
- **Wrap** = write code that calls into the old code
- Use *Method* for simple logic, *Class* for complex or stateful logic
- These give you *safe entry points* into legacy code

# Final Thought

> "You don't need to clean up the whole kitchen to make a cup of tea. Just clear a spot."
>
> — Inspired by Feathers’ philosophy
