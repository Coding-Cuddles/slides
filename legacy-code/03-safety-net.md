% Building a Safety Net
% Week 3: Discussion Session
% Advanced Software Engineering

# Learning Objectives

- Understand the importance of characterization tests
- Learn techniques for safely adding tests to legacy code
- Master the art of identifying and creating seams

# Understanding Characterization Tests

## What are they?
- Tests that describe current behavior
- Document "what is" rather than "what should be"
- First line of defense when working with legacy code

## Why do we need them?
- Capture existing behavior
- Provide safety for refactoring
- Document system behavior
- Enable incremental improvement

# Discussion Questions

1. How do characterization tests differ from traditional unit tests? When would you prefer one over the other?

2. What strategies can be employed when the legacy code seems impossible to test? How do you balance pragmatism with best practices?

3. How do you determine the appropriate level of characterization testing before beginning refactoring? What factors influence this decision?

# Code Examples

## C++ Example: Adding Characterization Tests

```cpp
// Original Legacy Code
class InvoiceCalculator {
public:
    double calculateTotal(const std::vector<LineItem>& items) {
        double total = 0;
        for (const auto& item : items) {
            total += item.quantity * item.price;
            if (item.quantity > 10) {
                total *= 0.95;  // Bulk discount
            }
            if (total > 1000) {
                total *= 0.90;  // Large order discount
            }
        }
        return total;
    }
};

// Characterization Test
TEST_CASE("InvoiceCalculator preserves existing behavior") {
    InvoiceCalculator calc;
    std::vector<LineItem> items = {
        {5, 100.0},   // Regular case
        {11, 100.0},  // Bulk discount case
        {1, 1001.0}   // Large order case
    };
    
    // Capture current behavior
    double result = calc.calculateTotal(items);
    
    // Document the exact current behavior
    REQUIRE(result == Approx(1850.95));
    // Note: This might not be correct behavior,
    // but it's what the system currently does
}
```

## Python Example: Characterization Testing Technique

```python
# Original Legacy Code
class TaxCalculator:
    def calculate_tax(self, income, state):
        if state == "NY":
            base_rate = 0.04
            if income > 50000:
                base_rate += 0.02
            if income > 100000:
                base_rate += 0.03
        elif state == "CA":
            base_rate = 0.03
            if income > 75000:
                base_rate += 0.04
        else:
            base_rate = 0.01
        
        return income * base_rate

# Characterization Tests
def test_capture_current_tax_behavior():
    calc = TaxCalculator()
    
    # Test cases to capture current behavior
    test_cases = [
        (30000, "NY"),
        (60000, "NY"),
        (120000, "NY"),
        (50000, "CA"),
        (80000, "CA"),
        (45000, "TX")
    ]
    
    # Store current behavior
    results = {
        case: calc.calculate_tax(*case)
        for case in test_cases
    }
    
    # Verify behavior remains unchanged
    for case in test_cases:
        assert calc.calculate_tax(*case) == results[case], \
            f"Behavior changed for {case}"
```

# Key Techniques

1. Capturing Current Behavior
   - Use automated tools where possible
   - Document exact current outputs
   - Include edge cases

2. Creating Seams
   - Extract Method
   - Extract Interface
   - Parameterize Constructor
   - Break Dependencies

3. Testing Strategies
   - Start with broad integration tests
   - Gradually add more specific tests
   - Use approval testing for complex output

# Required Reading

- Chapters 8-10 of "Working Effectively with Legacy Code"
- Focus on:
  - Breaking Dependencies
  - Sensing and Separation
  - Test Organization

# Next Week

Prepare for hands-on kata:
- Writing effective characterization tests
- Creating seams in legacy code
- Organizing test suites effectively
