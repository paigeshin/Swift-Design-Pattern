import Foundation

protocol HotDrink {
    func consume()
}

class Tea: HotDrink {
    
    func consume() {
        print("This tea is nice but I'd prefer it with milk.")
    }
    
}

class Coffee: HotDrink {
    
    func consume() {
        print("This coffee is delicious!")
    }
    
}

protocol HotDrinkFactory {
    
    init()
    func prepare(amount: Int) -> HotDrink

}

public class TeaFactory: HotDrinkFactory {
    
    required init() {}
    
    func prepare(amount: Int) -> HotDrink {
        print("Put in tea bag, boil water, pour \(amount)ml, andd lemon, enjoy!")
        return Tea()
    }
    
}

public class CoffeeFactory: HotDrinkFactory {
    
    required init() {}
    
    func prepare(amount: Int) -> HotDrink {
        print("Grind some beans, boil water, pour \(amount)ml, add cream and sugar")
        return Coffee()
    }
    
}

class HotDrinkMachine {
    
    enum AvailabeDrink: String { // breaks OCP
        case coffee = "Coffee"
        case tea = "Tea"
        
        static let all = [coffee, tea]
    }
    
    internal var factories = [AvailabeDrink: HotDrinkFactory]()
    internal var namedFactories = [(String, HotDrinkFactory)]()
    
    init() {
        for drink in AvailabeDrink.all {
            guard let appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") else {
                fatalError("Cant find app name")
            }
            print("app name: \(appName)")
            let className = "\(appName).\(drink.rawValue)Factory"
            print("class name: \(className)")
            guard let type = NSClassFromString(className) else {
                fatalError("Can't find a class")
            }
            print("type to be cast: \(type)")
            guard let hotDrinkFactoryType = type as? HotDrinkFactory.Type else {
                fatalError("Cannot cast to Hot Factory")
            }
            print("type to be initialized: \(hotDrinkFactoryType)")
            let factory = hotDrinkFactoryType.init()
            
            factories[drink] = factory
            namedFactories.append((drink.rawValue, factory))
        }
    }
    
    func makeDrink() -> HotDrink {
        print("Avilable drinks: ")
        for i in namedFactories.indices {
            let tuple = namedFactories[i]
            print("\(i): \(tuple.0)")
        }
        let input = Int(readLine()!)!
        return namedFactories[input].1.prepare(amount: 250)
    }
    
}

public func main() {
    
    let machine = HotDrinkMachine()
    print(machine.namedFactories.count)
    let drink = machine.makeDrink()
    drink.consume()
    
}


main()
