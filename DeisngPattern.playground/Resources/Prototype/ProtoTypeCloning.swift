
import Foundation

protocol Copying {
    func clone() -> Self
}

class Address: CustomStringConvertible, Copying {

    var streetAddress: String
    var city: String
    
    init(_ streetAddress: String, _ city: String) {
        self.streetAddress = streetAddress
        self.city = city
    }
    
    
    var description: String {
        return "\(streetAddress), \(city)"
    }
    
    func clone() -> Self {
        return cloneImpl()
    }
    
    private func cloneImpl<T>() -> T {
        return Address(streetAddress, city) as! T
    }
    
}

class Employee: CustomStringConvertible, Copying {
    
    var name: String
    var address: Address
    
    init(_ name: String, _ address: Address) {
        self.name = name
        self.address = address
    }
    
    
    var description: String {
        return "My name is \(name) and I love at \(address)"
    }
    
    func clone() -> Self {
        return cloneImpl()
    }
    
    private func cloneImpl<T>() -> T {
        return Employee(name, Address(address.streetAddress, address.city)) as! T
    }
    
}

func main() {
    
    var john = Employee("John", Address("123 Paris Read", "London"))

    var chris = john.clone()
    chris.name = "Chris"
    chris.address.city = "Manchester"
    
    print(john)
    print(chris)
    
}

main()

