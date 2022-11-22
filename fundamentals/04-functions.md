---
title: Clean Code Fundamentals
subtitle: Functions
...

# Pre-work
* Video: https://cleancoders.com/episode/clean-code-episode-3
* Exam: https://cleancoders.com/episode/clean-code-episode-3/exam

# Timetable

| Activity            | Time   |
|---------------------|--------|
| Warmup              | 5 min  |
| Discussion prompt 1 | 20 min |
| Discussion prompt 2 | 20 min |
| Discussion prompt 3 | 20 min |
| Wrap up             | 5 min  |

# Warmup
* What are some "landmarks" you look for when you're reading code?

# Discussion prompt 1
* Prompt
  * How to safely refactor code without breaking it? Discuss possible strategies.
  * What to do if code is not covered by tests?
* Time limit: 10 minutes

# Characterization test
* "Characterization test" AKA "Golden Master" AKA "Snapshot test"

# Discussion prompt 2
* Prompt
  * What code behavior do you find suspicious and why?
  * What "code smells" do you find useful and why?
* Time limit: 10 minutes

# Code smells
* "Code smells" are things that indicate a problem in your code
* Example code smells
  * Long functions
  * Feature envy
* Code smells catalog: https://sourcemaking.com/refactoring/smells

# Discussion prompt 3
* Prompt
  * How to define if a function is doing "one thing"?
* Time limit: 10 minutes

# Where classes hide
* Classes hide in long functions with many local variables
* Functions that fill the screen are likely doing more than one thing
* Functions crossing levels of abstraction
  
# "Extract class" refactoring
* Create characterizations test - run often
* Extract function body to a new class's `invoke` method
* Extract local variables to fields
* Extract methods or new classes
* Repeat until you can't extract anymore


# Summary
* Functions should be small
* Functions should do one thing
* Functions should have one level of abstraction
* Functions should have descriptive names

# What is next?
* Expect an e-mail with instructions for upcoming coding dojo

#
* Always leave the code better than you found it.
  * The Software Craftsmanship Rule
