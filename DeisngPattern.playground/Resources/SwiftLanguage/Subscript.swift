import Foundation

struct ClassRoom {
    
    var students = [
        ["Eric", "Peter", "Quagmire", "Randy"],
        ["Messi", "Ronaldo", "Ronaldiho", "Xavi"],
        ["Trey", "Uhser", "Nicki", "Alicia"],
        ["Mark", "Bill", "Elon", "Jeff"],
    ]
    
    subscript(row: Int, col: Int) -> String {
        get {
            return students[row][col]
        }
        set {
            students[row][col] = newValue
        }
    }
    
}

let clas = ClassRoom()
let foundStudent1 = clas.students[1][2]
let foundStudent2 = clas[1, 2]

print(foundStudent1)
print(foundStudent2)

// Subscript
// names["macco"]
