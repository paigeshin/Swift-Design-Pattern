import Foundation

protocol Copying {
    
    init(copyFrom other: Self)
    
}

class Address: CustomStringConvertible, Copying {
    
    var streetAddress: String
    var city: String
    
    init(_ streetAddress: String, _ city: String) {
        self.streetAddress = streetAddress
        self.city = city
    }
    
    required init(copyFrom other: Address) {
        streetAddress = other.streetAddress
        city = other.city
    }
    
    var description: String {
        return "\(streetAddress), \(city)"
    }
}

class Employee: CustomStringConvertible, Copying {
    var name: String
    var address: Address
    
    init(_ name: String, _ address: Address) {
        self.name = name
        self.address = address
    }
    
    required init(copyFrom other: Employee) {
        name = other.name
        address = Address(copyFrom: other.address)
    }
    
    var description: String {
        return "My name is \(name) and I love at \(address)"
    }
}

func main() {
    
    var john = Employee("John", Address("123 Paris Read", "London"))
    
    // copy john
    var chris = Employee(copyFrom: john)
    chris.name = "chris"
    chris.address.streetAddress = "1234 London Road"
    
    print(john)
    print(chris)
    
}

main()

