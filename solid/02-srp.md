---
title: Clean Code SOLID
subtitle: The Single Responsibility Principle
...

# Pre-work

* Video: <https://cleancoders.com/episode/clean-code-episode-9>
* Exam: <https://cleancoders.com/episode/clean-code-episode-9/exam>


# Chapters

Timing for chapters in the downloaded version of the video.

::: columns

:::: column

| Chapter                    | Time     |
|----------------------------|----------|
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
|------------------------|----------|
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

| Activity   | Time   |
|------------|--------|
| Warmup     | 5 min  |
| Exercise 1 | 15 min |
| Exercise 2 | 20 min |
| Exercise 3 | 20 min |
| Wrap up    | 5 min  |

# Warmup

* Have you ever encountered difficulty in crafting a unit test for your code?
  What was causing these problems?
    * Type in the meeting chat

# Responsibility
* Responsibility that your software has is the responsibility to serve different groups of
  customers who consumes those services.
* Responsibility is the source of change.
* To find responsibilities, find families of functions with the similar
  audience/users requesting changes.

# Roles
* Separate users of your software from the roles they playing
* Responsibilities are tied to the actors, not the users
* Actor - single source of change

# Two values of software
1. Ability to change frequently - primary value
2. Expected behavior - secondary value

# Exercise 1

* Prompt
    * Rooms 1, 5, 9: Describe the method to define responsibilities.
    * Rooms 2, 6, 10: What to do if class has multiple functions? Are all of them a separate responsibility?
    * Rooms 3, 7, 11: How users/actors/responsibilities correlate? Are they the same? Could they differ?
    * Rooms 4, 8, 12: Provide example of same and different combinations of users/actors/responsibilities.
* Time limit: 10 minutes

# SRP

Module should have one and only one reason to change (responsibility)

* How to design software:
  * Identify the actors
  * Responsibilities that serve those actors
  * Allocate those responsibilities in modules
  * Structure the software so that responsibilities became a plugins to the rest of the application
  * Separate source files

# Exercise 2

* Code review practice
* Use the worksheet
* Based on the code below suggest code improvements, explain why.
  Use the worksheet to record your suggestions
* Time limit: 10 minutes

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
        order = Order(customer=customer, product=product, quantity=quantity, total=total)
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


def calculate_order_total(product, quantity):
    return product.price * quantity


def check_customer_credit(customer, order_total):
    if customer.credit < order_total:
        raise ValueError("Insufficient credit")
 ```

# Exercise 2 solutioni (cont'd)

```python
def reduce_customer_credit(customer, order_total):
    customer.credit -= order_total


def create_order(customer, product, quantity, order_total):
    return Order(customer=customer, product=product, quantity=quantity, total=order_total)


def add_order_to_database(order):
    db.add_order(order)


def update_product_inventory(product, quantity):
    product.inventory -= quantity
    db.update_product(product)


def send_email_confirmation(customer, order):
    email.send_confirmation_email(customer.email, order)
```

# Exercise 3

* Propose the code changes for the following code snippet:

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

# Exercise 3 solution

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

# Discussion

* Groups to share their findings

# Summary

* Conformance with SRP might require pulling apart code/functions/classes/components
* Potential solutions:
  * Dependency inversion
  * Extract classes
  * Facade pattern
  * Interface segregation
* None of the solution are perfect
* Carefully allocating responsibilities to classes and modules we keep the primary value of software high
* When module has more than one responsibility, the system tends to became fragile

# What is next?

* Next session
  * Coding dojo to practice SRP
* Expect an e-mail with instructions for upcoming coding dojo

# Final words

> Always leave the code better than you found it.
>
> -- <cite>The Software Craftsmanship Rule</cite>
