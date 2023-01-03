---
title: Clean Code Fundamentals
subtitle: Form
...

# Pre-work
* Video: <https://cleancoders.com/episode/clean-code-episode-5>
* Exam: <https://cleancoders.com/episode/clean-code-episode-5/exam>

# Chapters
::: columns

:::: column

| Chapter                 | Time       |
|-------------------------|------------|
| Overview                | `00:00:51` |
| Sol's Pyre              | `00:03:57` |
| Comments                | `00:11:12` |
| Coding Standards        | `00:11:32` |
| Comments should be Rare | `00:13:00` |
| Comments are Failures   | `00:15:23` |
| Comments are Lies       | `00:18:28` |
| Good Comments           | `00:20:08` |
| Bad Comments            | `00:22:53` |
| Explanatory Structures  | `00:31:00` |

::::

:::: column

| Chapter                | Time       |
|------------------------|------------|
| Formatting             | `00:33:23` |
| File Size              | `00:34:23` |
| Vertical Formatting    | `00:37:35` |
| Horizontal Formatting  | `00:41:01` |
| Indentation            | `00:43:28` |
| Classes                | `00:45:53` |
| Data Structures        | `00:53:33` |
| Boundaries             | `00:59:46` |
| The Impedance Mismatch | `01:03:52` |
| Conclusion             | `01:09:20` |

::::

:::

# Timetable
| Activity                   | Time   |
|----------------------------|--------|
| Warmup                     | 5 min  |
| Exercise 1                 | 20 min |
| Exercise 2                 | 30 min |
| Exercise 3                 | 20 min |
| Wrap up                    | 5 min  |

# Warmup
* What are your formatting preferences?
  (e.g. tabs vs spaces, 2 spaces vs 4 spaces, snake_case vs camelCase, etc.)
  * Type in the meeting chat

# Exercise 1
* Prompt
  * Compare classes and data structures
* Time limit: 10 minutes

# Possible answer
* Classes
  * Cohesive data and functions that operate on that data
  * Private data, public functions
  * Tell, don't ask
  * Polymorphism
  * Protects from new types, exposes to new methods
* Data Structures
  * Cohesive data, simple functions like getters and setters
  * Public data
  * Ask, don't tell
  * Switch statements
  * Protects from new methods, exposes to new types

# Exercise 2
* Code-review practice
* Time limit: 20 minutes

# Exercise 3
* Prompt
  *
* Time limit: 10 minutes

# Possible answer
*

# Summary
* Comments
* Formatting
* Classes vs data structures
* Abstraction boundaries

# What is next?
* Expect an e-mail with instructions for upcoming coding dojo

# Final words
> Always leave the code better than you found it.
>
> -- <cite>The Software Craftsmanship Rule</cite>

# Code-review practice
Adopted from [Eder Diaz blog](https://ederdiaz.dev/blog/clean-code-exercises-part-1/)

# Scenario 1
```python
def can_buy_beer(age, money):
    if age >= 21 and money >= 20:
        return True
    return False
```

# Scenario 1 solution
Introduce constants, collapse if statement:
```python
def can_buy_beer(age, money):
    LEGAL_DRINKING_AGE = 21
    BEER_PRICE = 20
    return age >= LEGAL_DRINKING_AGE and money >= BEER_PRICE
```

# Scenario 2
```python
def should_show_image(item_index, article, show_all_images):
    return bool(article.image_url) if item_index in (0, 1, 2) else \
      bool(article.image_url) if show_all_images else False 
```
Ternary operators note:
* C++: `condition ? a : b`
* Python: `a if condition else b`

# Scenario 2 solution
Use explanatory variables:
```python
def should_show_image(item_index, article, show_all_images):
    is_first_three_items = item_index in (0, 1, 2)
    has_image = article.image_url
    return (is_first_three_items or show_all_images) and has_image
```
