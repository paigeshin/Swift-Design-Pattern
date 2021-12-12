
import Foundation

class Property<T: Equatable> {
    
    private var _value: T
    
    public var value: T {
        get { return _value }
        set {
            if newValue == _value { return }
            print("Setting value to \(newValue)")
            _value = newValue
        }
    }
    
    init(_ value: T) {
        _value = value
    }
    
}

extension Property: Equatable {}

func == <T>(lhs: Property<T>, rhs: Property<T>) -> Bool {
    return lhs.value == rhs.value
}

class Creature {
    private let _agility = Property<Int>(0)
    
    var agility: Int {
        get {
            return _agility.value
        }
        set { _agility.value = newValue }
    }
}

func main() {
    
    let c = Creature()
    c.agility = 10
    print(c.agility)
    
}

main()
