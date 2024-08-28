---
title: Clean Code SOLID
subtitle: The Single Responsibility Principle
...

# Pre-work

- Video: <https://cleancoders.com/episode/clean-code-episode-9>
- Exam: <https://cleancoders.com/episode/clean-code-episode-9/exam>

# Chapters

::: columns

:::: column

| Chapter                    | Time     |
| -------------------------- | -------- |
| Overview                   | 00:01:01 |
| General Relativity         | 00:03:54 |
| Responsibility             | 00:10:05 |
| It's About Users           | 00:12:50 |
| It's About Roles           | 00:14:37 |
| Reprise                    | 00:15:50 |
| The Two Values of Software | 00:16:19 |
| Friction                   | 00:20:01 |
| CM Collision               | 00:20:58 |
| Fan Out                    | 00:22:41 |
| Colocation is Coupling     | 00:24:15 |
| Encroaching Fragility      | 00:26:49 |
| SRP                        | 00:27:51 |

::::

:::: column

| Chapter                | Time     |
| ---------------------- | -------- |
| Examples               | 00:30:12 |
| Conclusion             | 00:39:58 |
| Solutions              | 00:41:15 |
| Invert Dependencies    | 00:41:38 |
| Extract Classes        | 00:42:45 |
| Facade                 | 00:44:05 |
| Interface Segregation  | 00:45:02 |
| Welcome to Engineering | 00:45:53 |
| Case Study             | 00:48:06 |
| Architecture           | 00:53:47 |
| Design                 | 00:55:20 |
| Faking it              | 00:57:01 |
| Conclusion             | 01:00:14 |

::::

:::

# Timetable

| Activity               | Time   |
| ---------------------- | ------ |
| Greetings, Warmup      | 5 min  |
| Separation of concerns | 10 min |
| Exercise 1             | 10 min |
| Group discussion       | 10 min |
| SPR overview           | 10 min |
| Exercise 2             | 15 min |
| Group discussion       | 10 min |
| Exercise 3             | 5 min  |
| Group discussion       | 10 min |
| Summary                | 10 min |
| Closing                | 5 min  |

# Warmup

- What are the common challenges that you face when creating unit tests for your code?
  - Type in the meeting chat

\note{
Dependency management: Unit tests require a clear understanding of the
dependencies of the code being tested. It can be challenging to manage these
dependencies and ensure that they are properly isolated for testing
purposes.

Choosing the right test cases: It can be difficult to determine the right
test cases to use to ensure that the code is working as expected. This
requires a deep understanding of the code and its expected behavior.

Keeping tests up to date: As code evolves over time, it can be challenging to
keep unit tests up to date with the latest changes. Developers need to
continually update their tests to ensure that they accurately reflect the
behavior of the code.

Time constraints: Creating comprehensive unit tests can be time-consuming,
especially for complex code. Developers need to balance the need for thorough
testing with the time constraints of the project.)

Integration testing: Unit tests are only one part of a comprehensive testing
strategy. Developers also need to perform integration testing to ensure that
all the components of the system are working together as expected.
Coordinating these different types of tests can be challenging.
}

# Separation of Concerns

- How?
  - Reduce artificial dependencies
  - Simplify change
- What?

  - Split
  - Segregate
  - Extract

- Orthogonality
- Cohesion
- Single Responsibility Principle (SRP)

\note{
The term separation of concerns was introduced by Edsger W. Dijkstra in his
1974 paper "On the role of scientific thought".

In computer science, separation of concerns is a design principle for
separating a computer program into distinct sections. Each section addresses
a separate concern, a set of information that affects the code of a computer
program. A concern can be as general as "the details of the hardware for an
application", or as specific as "the name of which class to instantiate". A
program that embodies SoC well is called a modular program. Modularity,
and hence separation of concerns, is achieved by encapsulating information
inside a section of code that has a well-defined interface. Encapsulation is
a means of information hiding. Layered designs in information systems are
another embodiment of separation of concerns; e.g., presentation layer,
business logic layer, data access layer, persistence layer.

One of the best and proven solutions to separate concerns is to reduce
artificial dependencies and simplify change.

Systems that are broken up into small, well-named, understandable pieces
enable faster work. The core of the idea is to split, segregate, or extract
pieces of functionality.

The intent behind separation of concerns is to better understand and manage
complexity and thus design more modular software. This idea is probably as
old as software itself and hence has been given many different names.

For instance, the same idea is called orthogonality by the Pragmatic
Programmers. They advise separating orthogonal aspects of software. Tom
DeMarco -- early developer of structured analysis in the 1970s. -- calls it
cohesion. Cohesion is a measure of the strength of association of the
elements inside a module. A highly cohesive module is a collection of
statements and data items that should be treated as a whole, because they are
so closely related.) Any attempt to divide them up would only result in
increased coupling and decreased readability.) In the SOLID principles one of
the most established sets of design principles, the idea is known as the
Single-Responsibility Principle,

You can see here a reference to the Simon Sinek’s first and most popular book
Start with WHY. It is in the New York Times and Wall Street Journal
bestseller lists. In this book, Simon shows that the leaders who’ve had the
greatest influence in the world all think, act, and communicate the same
way—and it’s the opposite of what everyone else does. Simon calls this
powerful idea The Golden Circle, and it provides a framework upon which
organizations can be built, movements can be led, and people can be
inspired. And it all starts with WHY, following by How and What.
}

# Exercise 1

- Prompt

  - Rooms 1, 3, 5, 7, 9
    - Describe the method to define responsibilities.
    - What to do if class has multiple functions?
    - Are all of them a separate responsibility?
  - Rooms 2, 4, 6, 8, 10
    - How users/actors/roles/responsibilities correlate?
    - Are they the same? Could they differ?
    - Provide example of same and different combinations of
      users, actors, roles, and responsibilities.

- Time limit: 10 minutes

# Definitions

- Actor - single source of change
  - Roles
  - Separate users of your software from the roles they playing
- Responsibility
  - Responsibility, that your software has, is the responsibility to serve
    different groups of customers who consumes those services.
  - Responsibility is the source of change.
  - Responsibilities are tied to the actors, not the users
  - To find responsibilities, find families of functions with the similar
    audience/users requesting changes.
- Two values of software
  - Ability to change frequently - primary value
  - Expected behavior - secondary value

# SRP Overview

- Group only those things that truly belong together, and separate everything
  that does not strictly belong

- How to design software:
  - Identify the actors
  - Responsibilities that serve those actors
  - Allocate those responsibilities in modules
  - Structure the software so that responsibilities became a plugins to the
    rest of the application
  - Separate source files

# Exercise 2

- Code review practice:
  - Use the worksheet
  - Based on the code, suggest code improvements, explain why.
  - Use the worksheet to record your suggestions
- Time limit: 15 min

# Exercise 2 code for review

```python
def place_order(customer, product, quantity):
    # Calculate the order total
    total = product.price * quantity

    # Check if the customer has enough credit
    if customer.credit >= total:
        # Reduce the customer's credit
        customer.credit -= total

        # Create an order object and add the order to the database
        order = Order(
            customer=customer, product=product, quantity=quantity, total=total
        )
        db.add_order(order)

        # Update the product inventory
        product.inventory -= quantity
        db.update_product(product)

        # Send an email confirmation to the customer
        email.send_confirmation_email(customer.email, order)
        return order
    else:
        raise ValueError("Insufficient credit")
```

# Group discussion

- Groups to share their findings

[//]: # "Facilitators to rate how many people mentioned particular pattern/idiom"

# Exercise 2 solution

```python
def place_order(customer, product, quantity):
    order_total = calculate_order_total(product, quantity)
    check_customer_credit(customer, order_total)
    reduce_customer_credit(customer, order_total)
    order = create_order(customer, product, quantity, order_total)
    add_order_to_database(order)
    update_product_inventory(product, quantity)
    send_email_confirmation(customer, order)
    return order


def check_customer_credit(customer, order_total):
    if customer.credit < order_total:
        raise ValueError("Insufficient credit")


def reduce_customer_credit(customer, order_total):
    customer.credit -= order_total
```

\note{
As you can see, each function now has a single responsibility. The
`place_order` function orchestrates the order placement process by calling
each of the functions in a specific order. Each of the functions is
responsible for a single task, such as calculating the order total or
updating the product inventory.

By refactoring the code in this way, we have improved its readability and
maintainability. It is now easier to understand the code and make changes to
it if needed. Additionally, if one of the functions needs to be changed or
updated, it can be done without affecting the other functions or the overall
behavior of the place_order function.

- Users: Customers, System Administrators
- Actors: Customer object, Product object, Order object, db object, email
  object
- Roles:
  - Customer: Initiates the order by placing the order, provides credit
    for payment
  - Order: Represents the order object with details of the product,
    quantity, and total cost
  - Inventory: Adds the order to the database and updates the product
    inventory, provides the product information and current inventory)
  - Confirmation sender: Sends email confirmation to the customer
- Responsibilities:
  _Customer: financial status
  _ Product: Provides product information, updates inventory
  _Order: Represents the order with details of the product, quantity,
  and total cost
  _ Confirmation: Sends email confirmation to the customer
  }

# Exercise 2 solution (cont'd)

```python
def calculate_order_total(product, quantity):
    return product.price * quantity


def create_order(customer, product, quantity, order_total):
    return Order(
        customer=customer, product=product, quantity=quantity, total=order_total
    )


def add_order_to_database(order):
    db.add_order(order)


def update_product_inventory(product, quantity):
    product.inventory -= quantity
    db.update_product(product)


def send_email_confirmation(customer, order):
    email.send_confirmation_email(customer.email, order)
```

# Exercise 3

- Code review practice:
  - Propose the code changes for the code snippet
- Use the worksheet to record your suggestions
- Time limit: 5 min

# Exercise 3 code

```python
class Car:
    def __init__(self, engine_size, num_doors):
        self.engine_size = engine_size
        self.num_doors = num_doors

    def start(self):
        # code to start the car's engine

    def lock_doors(self):
        # code to lock the car's doors

    def play_music(self):
        # code to play music in the car
```

# Group discussion

- Groups to share their findings

\note{Facilitators to rate how many people mentioned particular pattern or
idiom.}

# Exercise 3 potential solution

```python
class Car:
    def __init__(self, engine_size, num_doors):
        self.engine_size = engine_size
        self.num_doors = num_doors
        self.engine = Engine()
        self.music_player = MusicPlayer()
        self.doors = DoorLocks()


class Engine:
    def start(self):
        # code to start the car's engine


class MusicPlayer:
    def play_music(self):
        # code to play music in the car


class DoorLocks:
    def lock(self):
        # code to lock the car's doors
```

# Summary

- Conformance with SRP might require pulling apart
  code/functions/classes/components
- Potential solutions:
  - Dependency inversion
  - Extract classes
  - Use design patterns (facade)
  - Interface segregation
- None of the solution are perfect
- Carefully allocating responsibilities to classes and modules we keep the
  primary value of software high
- When module has more than one responsibility, the system tends to become
  fragile

# What is next?

- Coding dojo to practice the Single Responsibility Principle
- Expect an e-mail with instructions for upcoming coding dojo

# Final words

> Always leave the code better than you found it.
>
> -- <cite>The Software Craftsmanship Rule</cite>
