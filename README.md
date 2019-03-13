# Backend Technical Test
## Santiago Figueiras

### Context
A company rents bikes under following options:
1. Rental by hour, charging $5 per hour
2. Rental by day, charging $20 a day
3. Rental by week, changing $60 a week
4. Family Rental, is a promotion that can include from 3 to 5 Rentals (of any type) with a
discount of 30% of the total price

### Assigment:
1. Implement a set of classes to model this domain and logic
2. Add automated tests to ensure a coverage over 85%
3. Use GitHub to store and version your code
4. Apply all the recommended practices you would use in a real project
5. Add a README.md file to the root of your repository to explain: your design, the development
practices you applied and how run the tests.
Note: we don't expect any kind of application, just a set of classes with its automated tests.

### Design
Given the definition was open, I took several assumptions in order to make 
the decision-making process easier. It should be noted that in an agile 
development process the doubts would be presented and resolve with the
team and/or customer in order get a clear sense on where the solution is headed.
Having clarified the issue, the assumptions where the following:

1. In a future, discounts could be more than one, and one order of rental
could have more than one discount applied.
2. Project should simulate a real world application development, thus
taking into account **readability**, **maintainability**, **expressiveness** and in 
some lesser degree **performance** and **documentation**.
3. Orders should be passed once as a list (Array), there would be no dinamic
order building.

The above assumptions facilitated the following decisions:

1. Build a solution that could scale to N discounts, building the first
version of a Discount interface. Separating the discount from the order.
The Discount implementation could be also a Decorator, but the Array syntax
seemed more scalable and flexible (see spec/order_processor_spec.rb).

2. Testing is the first step towards maintainability, using Test Driven 
Development allowed me to think first of the interface and the usage
of the components and then focus on the implementation. The other is 
a little bit of documentation on the key components to facilitate on boarding to
new programmers. Performance was an issue only when thinking about having
price and total items being calculated each time that they were needed, or calculating and
storing them in the initialize method. Assumption number 3 helped on this decision.

3. Not having this assumption would may have involved having add and remove
interface for an order, taking the solution to far from scope.

The solution could be developed in a less complex way (less classes, 
structure), and also could have further improvements. The point in 
which it is know is a level that can showcase most of the best 
practices without being it over-design.

#### Structure
The code itself is self-explanatory, but the main classes to look at
are OrderProcessor, Discount and Rental. Between the tests and the documentation
there is plenty of information to understand interface, implementation
and decisions.

#### About state and classes
Maybe with a simpler way to define interfaces the Discount
and Rental subclasses could be replaced, thus replacing inheritance
by composition.
Also, reducing application state storage would improve maintainability,
this could be some of the next steps in refactoring.

### Development Practices

- Test Driven Development (using RSpec and SimpleCov)
- SOLID principles
- Inline Documentation (using TomDoc style)
- Custom Errors to improve experience
- RuboCop for Syntax Checking following community guidelines

### Tests
```bash
$ bundle install
$ rspec
```
