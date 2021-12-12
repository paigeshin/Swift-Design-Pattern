struct Person {
    let name: String
}

struct Car: Equatable {
    let make: String
    let model: String
    let owner: Person
    
    //lefthandsie, righthandside
    //Magic Glue to enable comparison
    static func == (lhs: Car, rhs: Car) -> Bool {
        return lhs.make == rhs.make && lhs.model == rhs.model && lhs.owner.name.lowercased() == rhs.owner.name.lowercased()
    }
}

let bmw = Car(make: "bmw", model: "M-benz", owner: Person(name: "afraz"))
let benz = Car(make: "bmw", model: "M-benz", owner: Person(name: "Afraz"))

/* Throws Error */
if bmw == benz {
    print("same")
} else {
    print("different")
}
