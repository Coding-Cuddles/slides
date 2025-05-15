---
title: Working Effectively with Legacy Code
subtitle: Chapter 6 - I Dont Have Much Time and I Have to Change It
...

# Pre-work

- Book: *Working Effectively with Legacy Code* by Michael Feathers
- Focus: Chapter 6: I Dont Have Much Time and I Have to Change It

# Timetable

| Activity              | Time   |
|-----------------------|--------|
| Greetings, Warmup     | 5 min  |
| Sprout Method & Class | 15 min |
| Exercise 1            | 15 min |
| Wrap Method & Class   | 15 min |
| Exercise 2            | 15 min |
| Summary               | 10 min |
| Closing               | 5 min  |

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

# Legacy Code Example 

```python
class VehicleLogger:
    def log_trip(self, vehicle_type, distance_km, fuel_used_liters):
        print(f"Trip: {distance_km} km")
        if vehicle_type == "gasoline":
            efficiency = distance_km / fuel_used_liters
            print(f"Fuel efficiency: {efficiency:.2f} km/l")
        elif vehicle_type == "electric":
            efficiency = distance_km / fuel_used_liters  # misuse of field
            print(f"Energy efficiency: {efficiency:.2f} km/kWh")
```

# Improved Code Example 

```python
class VehicleLogger:
    def log_trip(self, vehicle_type, distance_km, fuel_or_energy_used):
        print(f"Trip: {distance_km} km")
        self._log_efficiency(vehicle_type, distance_km, fuel_or_energy_used)

    def _log_efficiency(self, vehicle_type, distance_km, amount_used):
        if vehicle_type == "gasoline":
            efficiency = distance_km / amount_used
            print(f"Fuel efficiency: {efficiency:.2f} km/l")
        elif vehicle_type == "electric":
            efficiency = distance_km / amount_used
            print(f"Energy efficiency: {efficiency:.2f} km/kWh")
```
\note{
Benefits:
 Isolated new behavior (_log_efficiency) → easier to test
 Minimal change to existing method → reduced risk
 Future changes (e.g., hybrid logic) can be added safely to the new method
}

# Sprout Class

- Create a new class for new behavior
- Keeps old logic intact
- Ideal for complex changes needing state

# Legacy code Example

```python
class VehicleLogger:
    def log_trip(self, vehicle_type, distance_km, fuel_used_liters):
        print(f"Trip: {distance_km} km")
        if vehicle_type == "gasoline":
            efficiency = distance_km / fuel_used_liters
            print(f"Fuel efficiency: {efficiency:.2f} km/l")
        elif vehicle_type == "electric":
            efficiency = distance_km / fuel_used_liters
            print(f"Energy efficiency: {efficiency:.2f} km/kWh")
```

# Improved code Example

```python
class VehicleLogger:
    def log_trip(self, vehicle_type, distance_km, fuel_or_energy_used):
        print(f"Trip: {distance_km} km")
        if vehicle_type == "electric":
            EVLogger().log_efficiency(distance_km, fuel_or_energy_used)
        elif vehicle_type == "gasoline":
            efficiency = distance_km / fuel_or_energy_used
            print(f"Fuel efficiency: {efficiency:.2f} km/l")

class EVLogger:
    def log_efficiency(self, distance_km, energy_kwh):
        efficiency = distance_km / energy_kwh
        print(f"Energy efficiency: {efficiency:.2f} km/kWh")
```
\note{
Benefits:
 New behavior is isolated in EVLogger
 We avoid changing or bloating the legacy method with EV-specific logic
 EVLogger is easy to test independently
}
# Exercise 1

- Prompt
  - When refactoring legacy code, how do you decide whether to extract a Sprout Method versus 
creating a Sprout Class? What are the trade-offs in terms of testability, cohesion, 
and future maintenance?
- Time limit: 15 minutes

# Wrap Method

- The original method is renamed
- A new method with the same name as the original wraps it
- New logic (e.g. logging, validation) is inserted safely
- No change to existing callers — they still call same method

## Legacy code Example

```python
class Engine:
    def calculate_torque(self, rpm, throttle):
        return (rpm * throttle) / 100.0
```
# Improved code Example

```python
class Engine:
    def _calculate_torque_original(self, rpm, throttle):
        return (rpm * throttle) / 100.0

    def calculate_torque(self, rpm, throttle):
        print(f"[LOG] Inputs: rpm={rpm}, throttle={throttle}")
        torque = self._calculate_torque_original(rpm, throttle)
        print(f"[LOG] Output: torque={torque}")
        return torque
```
\note{
Benefits:
  Add behavior without modifying original logic
  Keep method name unchanged for existing callers
  Enable logging, validation, or instrumentation
  Safe and reversible change
  Supports incremental refactoring
}

# Wrap Class

- Create a new class that wraps the legacy class
- Delegates calls while injecting new logic
- Helps isolate change when subclassing is risky

## Legacy code Example

```python
class Engine:
    def calculate_torque(self, rpm, throttle):
        return (rpm * throttle) / 100.0
```

# Improved code Example

```python
class LoggingEngine(Engine):
    def calculate_torque(self, rpm, throttle):
        print(f"[LOG] Calculating torque: rpm={rpm}, throttle={throttle}")
        torque = super().calculate_torque(rpm, throttle)
        print(f"[LOG] Torque result: {torque}")
        return torque
```
\note{
Benefits:
  Extend behavior via subclassing
  Override methods to add new logic
  Avoid modifying the original class
  Useful for testing or temporary changes
  Keeps legacy code stable while injecting behavior
}

# Usage
```python
engine = LoggingEngine()
engine.calculate_torque(3000, 70)
```

# Exercise 2

- Prompt
  - How do you recognize when legacy behavior should remain within the current class versus 
when it’s time to sprout a new class for better separation of concerns?
- Time limit: 15 minutes

# Decorators and the Wrap Method

- Decorators are a special form of wrapping that allows for dynamic extension.
- In the context of the Wrap Method, decorators provide an elegant solution for layering additional behavior.

### Python Decorator Pattern Example

```python
class Vehicle:
    def drive(self):
        return "Driving"

class VehicleDecorator(Vehicle):
    def __init__(self, vehicle):
        self._vehicle = vehicle

    def drive(self):
        return self._vehicle.drive()

class LoggingDecorator(VehicleDecorator):
    def drive(self):
        action = self._vehicle.drive()
        print(f"[LOG] Action: {action}")
        return action

# Usage
car = LoggingDecorator(Vehicle())
car.drive()
```

\note{
This decorates a Vehicle object to add logging behavior without modifying the original class.
}


# Comparison & Benefits

| Technique     | Location <br/>of Change | Scope | Purpose | Risk | Code Impact |
|---------------|------------|-----------------|-------------------------------|------|---------------------------|
| Sprout Method | Same class | One method      | Isolate new logic             | Low  | Add method,<br/> call it  |
| Sprout Class  | New class  | Functionality   | Extract cohesive<br/>behavior | Low  | New class, <br/>inject it |
| Wrap Method   | Same class | One method      | Insert logic around<br/>method| Low  | Rename + wrap<br/>method  |
| Wrap Class    | Subclass   | Multiple methods| Modify/extend<br/>behavior    | Med  | New subclass<br/>created  |


\note{
Summarize the differences in the implementation of decorators in C++ and Python, emphasizing the trade-offs between the two languages in terms of flexibility and performance.
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
