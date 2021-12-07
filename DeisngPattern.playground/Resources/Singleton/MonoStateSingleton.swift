import Foundation

// MONO STATE -> really bad idea
class CEO: CustomStringConvertible {
    
    private static var _name = ""
    private static var _age = 0
    
    var name: String {
        get {
            return type(of: self)._name
        }
        set {
            type(of: self)._name = newValue
        }
    }
    
    var age: Int {
        get {
            return type(of: self)._age
        }
        set {
            type(of: self)._age = newValue
        }
    }
    
    
    var description: String {
        return "\(name) is \(age) years old"
    }
    
}


func main() {
    
    var ceo = CEO()
    ceo.name = "Adam Smith"
    ceo.age = 55
    
    var ceo2 = CEO()
    ceo2.age = 65
    
    print(ceo)  // 65 years old
    print(ceo2) // 65 years old
    
}

main()
