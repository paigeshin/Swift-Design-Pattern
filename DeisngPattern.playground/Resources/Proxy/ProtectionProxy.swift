
import Foundation

protocol Vehicle {
    func drive()
}

class Car {
    func drive() {
        print("Car being driven")
    }
}

class CarProxy: Vehicle {
    private let car = Car()
    private let driver: Driver
    
    init(driver: Driver) {
        self.driver = driver
    }
    
    func drive() {
        if driver.age >= 16 {
            car.drive()
        } else {
            print("Driver too young")
        }
    }
}

class Driver {
    
    var age: Int
    init(age: Int) {
        self.age = age
    }
    
}
 
func main() {
    let car: Vehicle = CarProxy(driver: Driver(age: 12))
    car.drive()
}

main()

/*
 This protection proxy is one of a large number of proxies that can be built
 And essentially the idea is that you have a class which implements the same interface
 
 It realizes the same protocol as an ordinary car, but it performs additional checks while at the same time presenting the interface that you expect in this case, the function called drive
 
 */
