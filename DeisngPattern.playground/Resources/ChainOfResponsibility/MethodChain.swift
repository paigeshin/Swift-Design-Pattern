
import Foundation

class Creature: CustomStringConvertible {
    
    var name: String
    var attack: Int
    var defense: Int
    
    init(_ name: String, _ attack: Int, _ defense: Int) {
        self.name = name
        self.attack = attack
        self.defense = defense
    }
    
    var description: String {
        return "Name: \(name), A = \(attack), D = \(defense)"
    }
    
}

class CreatureModifier {
    
    let creature: Creature
    var next: CreatureModifier?
    
    init(_ creature: Creature) {
        self.creature = creature
    }
    
    func add(_ cm: CreatureModifier) {
        if next != nil {
            next!.add(cm)
        } else {
            next = cm
        }
    }
    
    func handle() {
        next?.handle()
    }
    
}

class DoubleAttackModifier: CreatureModifier {
    
    override func handle() {
        print("Doubling \(creature.name)'s attack")
        creature.attack *= 2
        super.handle()
    }
    
}

class IncreaseDefenseModifier: CreatureModifier {
    
    override func handle() {
        print("Increasing \(creature.name)'s defense")
        creature.defense += 3
        super.handle()
    }
    
}

class NoBonusesModifier: CreatureModifier {
    
    override func handle() {
        // handle not called, nothing will be propogated
    }
    
}

func main() {
    let goblin = Creature("Goblin", 2, 2)
    print(goblin)
    
    let root = CreatureModifier(goblin)
    
//    root.add(NoBonusesModifier(goblin))
    
    print("Let's double the goblin's attack")
    root.add(DoubleAttackModifier(goblin))
    print(goblin)
    
    print("Let's increase goblin's defense")
    root.add(IncreaseDefenseModifier(goblin))
    print(goblin)
    
    root.handle()
    print(goblin)
    
}

main()
