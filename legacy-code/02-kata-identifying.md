% Identifying Legacy Code Kata
% Week 2: Practical Session
% Advanced Software Engineering

# Learning Objectives

- Identify characteristics of legacy code
- Assess code for testability
- Plan initial refactoring steps

# Kata Instructions

Work in pairs to analyze and improve the following code examples.

## C++ Starting Point

```cpp
class OrderProcessor {
private:
    static OrderProcessor* instance;
    Database* db;
    EmailService* emailService;
    
    OrderProcessor() {
        db = new Database("production_db");
        emailService = new EmailService();
    }

public:
    static OrderProcessor* getInstance() {
        if (instance == null) {
            instance = new OrderProcessor();
        }
        return instance;
    }

    bool processOrder(Order order) {
        if (!db->isConnected()) {
            db->connect();
        }
        
        bool success = false;
        if (order.getTotal() > 0) {
            success = db->executeQuery(
                "INSERT INTO orders VALUES (" + 
                order.getId() + "," + 
                order.getCustomerId() + "," +
                order.getTotal() + ")"
            );
            
            if (success) {
                emailService->sendEmail(
                    order.getCustomerEmail(),
                    "Order Confirmation",
                    "Your order #" + order.getId() + " has been processed."
                );
            }
        }
        return success;
    }
};
```

## Python Starting Point

```python
class ReportGenerator:
    def __init__(self):
        self.db = Database()
        self.template_engine = TemplateEngine()
        
    def generate_monthly_report(self, month, year):
        # Connect to database
        self.db.connect()
        
        # Get data
        sales_data = self.db.execute_query(
            f"SELECT * FROM sales WHERE MONTH(date) = {month} "
            f"AND YEAR(date) = {year}"
        )
        
        # Process data
        total = sum(sale['amount'] for sale in sales_data)
        avg = total / len(sales_data) if sales_data else 0
        
        # Generate report
        report = self.template_engine.load_template('monthly_report')
        report.set_data({
            'month': month,
            'year': year,
            'sales': sales_data,
            'total': total,
            'average': avg
        })
        
        # Save to file system
        filename = f"report_{month}_{year}.pdf"
        report.save_as_pdf(filename)
        
        # Send email
        email = EmailService()
        email.send(
            to="management@company.com",
            subject=f"Monthly Report {month}/{year}",
            body="Please find attached the monthly report.",
            attachment=filename
        )
```

# Tasks

1. Code Analysis (30 minutes)
   - Identify all dependencies in the code
   - List specific legacy code characteristics
   - Document potential risks in making changes

2. Testability Assessment (30 minutes)
   - Identify what makes the code hard to test
   - List specific changes needed to enable testing
   - Prioritize which parts need testing first

3. Refactoring Plan (30 minutes)
   - Create a step-by-step plan for adding tests
   - Identify seams that could be used
   - Document potential breaking points

4. Discussion (30 minutes)
   - Present findings to another pair
   - Compare different approaches
   - Agree on best practices for similar situations

# Success Criteria

- Comprehensive list of dependencies identified
- Clear testing strategy documented
- Practical refactoring plan created
- Risks and mitigation strategies outlined

# Notes for Facilitators

- Ensure pairs rotate roles during the exercise
- Encourage discussion of real-world examples
- Focus on identifying patterns that can be applied to actual work situations
- Emphasize the importance of small, safe steps

# Follow-up

Prepare for next week's session on:
- Building a safety net
- Writing characterization tests
- Understanding test coverage strategies
