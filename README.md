# Refactoring Challenge Development Notes

* In order to allow for easy extension, a RangeCalculator base class was created to find all objects with a certain attribute whose value falls between a start and end date all configurable through input arguments. The TotalSalesCalculator class used in the SalesReport class inherited from the RangeCalculator and used the return value to calculate the total sales between the start and end date. The SOLID design principle of Single Responsibility<sup>1</sup> was kept in mind when designing all of the above classes. The RangeCalculator's single responsibility is to filter out and return an array of objects whose given attribute value falls between the given start and end date. The TotalSalesCalculator's single responsibility is then to find the sum total of the amount. Finally, the OrderReport's responsibility is to return the output of the calculator's execution.

* The calculator classes were also modeled with the Open/Closed principle<sup>2</sup> in mind using the Strategy Design Pattern<sup>3</sup>. The Open/Closed principle states the classes should be open for extension, but closed for modification. Creating a base class with logic that the inheriting classes can use gives the developer a solid base of understanding. A developer can then expand on that knowledge to create other validator and calculator classes. The Strategy Design Pattern implemented correctly gives the developer the ability to swap out different strategies independent from the client that uses it. In my refactoring, the OrderReport class is independent from the calculator class and therefore, any calculator can be used in this class without it breaking. Pretty neat!

*  The validator classes follow a similar principle of Single Responsibility inheriting functionality from a base validator class. Each subclass validates an object based on a single concept.

* Given more time, I would finish implementing the #valid? and #validate for every validator class. This would ensure the code follows the Liskov Substitution<sup>4</sup> principle which states that evert subclass should be substitutable for its base class. As it stands, the base validator class only stands as a shell the validator subclass can use, but then that subclass must implement the #valid? and #validate methods in order for the class to respond to those methods. This is not ideal OO code.

# Before starting

Please run the below command on console.
```
$ bundle
```

# Execute Test

```
$ bundle exec rspec spec
```
