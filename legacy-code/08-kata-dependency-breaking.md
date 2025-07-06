% Dependency Breaking Kata
% Week 8: Practical Session
% Advanced Software Engineering

# Learning Objectives

- Practice breaking dependencies using adapters and seams
- Refactor legacy code for testability
- Safely introduce new interfaces

# Kata Instructions

Work in pairs to break dependencies in the following code.

## C++ Starting Point

```cpp
class EmailSender {
public:
    void send(const std::string& to, const std::string& body) {
        // Directly uses SMTP library
        SmtpClient smtp;
        smtp.connect("smtp.company.com");
        smtp.sendMail(to, body);
        smtp.disconnect();
    }
};
```

## Python Starting Point

```python
class EmailSender:
    def send(self, to, body):
        # Directly uses SMTP library
        smtp = SmtpClient()
        smtp.connect("smtp.company.com")
        smtp.send_mail(to, body)
        smtp.disconnect()
```

# Tasks

1. **Identify Hard Dependencies (15 min)**
   - List all direct dependencies in the code
   - Discuss why they make testing difficult

2. **Introduce Adapters (25 min)**
   - Refactor to use an interface or protocol for the SMTP client
   - Allow injection of a mock or test double

3. **Create Seams (30 min)**
   - Identify and implement seams for testing
   - Write tests using the new seams/adapters

4. **Review and Discuss (20 min)**
   - Share your refactoring and tests with another pair
   - Discuss trade-offs and risks

# Success Criteria

- Dependencies broken via adapters or seams
- Code is testable with mocks or stubs
- Minimal changes to legacy logic
- Risks and trade-offs discussed

# Notes for Facilitators

- Encourage use of interfaces/protocols
- Focus on testability and minimal change
- Discuss real-world applications of these techniques

# Follow-up

Prepare for next week's session on:
- Large-scale refactoring
- Managing technical debt
- Strategic improvement planning
