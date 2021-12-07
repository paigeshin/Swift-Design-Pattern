import Foundation

class Person : CustomStringConvertible {
    var id: Int
    var name: String
    
    init(called name: String, withId id: Int)
    {
        self.name = name
        self.id = id
    }
    
    var description: String {
        return "\(id), \(name)"
    }
    
}

class PersonFactory
{
    
    var index = 0
    
    func createPerson(name: String) -> Person {
        let newIndex = index
        self.index += 1
        return Person(called: name, withId: newIndex)
    }
}

func main() {
    
    let pf = PersonFactory()
    let p1 = pf.createPerson(name: "paige")
    print(p1)
    let p2 = pf.createPerson(name: "sunghee")
    print(p2)
    let p3 = pf.createPerson(name: "shin sunghee")
    print(p3)
}


main()
