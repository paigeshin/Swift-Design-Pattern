// By using dummy database, you can avoid singleton database's testability issue

import Foundation
import XCTest

protocol Database {
    
    func getPopulation(_ name: String) -> Int
    
}

class SingletonDatabase: Database {
    
    var capitals = [String: Int]()
    static var instanceCount = 0
    
    // singleton
    static var instance = SingletonDatabase()
    
    private init() {
        type(of: self).instanceCount += 1
        print("initializing database")
    
        let path = "/mnt/c/Dropbox"
        if let text = try? String(contentsOfFile: path, encoding: String.Encoding.utf8) {
            let strings = text.components(separatedBy: .newlines)
                .filter{!$0.isEmpty}
                .map{$0.trimmingCharacters(in: .whitespaces)}
            for i in 0..<(strings.count/2) {
                capitals[strings[i*2]] = Int(strings[i*2 + 1])!
            }
        }
    }
    
    func getPopulation(_ name: String) -> Int {
        return capitals[name]!
    }
    
}

class SingletonRecordFinder {
    func totalPopulation(_ names: [String]) -> Int {
        var result = 0
        for name in names {
            result += SingletonDatabase.instance.getPopulation(name)
        }
        return result
    }
}

func main_old() {
    var db = SingletonDatabase.instance
    var city = "Tokyo"
    print("\(city) has population \(db.getPopulation(city))")
    
    let db2 = SingletonDatabase.instance
    city = "Manila"
    print("\(city) has population \(db.getPopulation(city))")
    print(SingletonDatabase.instanceCount)
}

// Dependency Injection
class ConfigurableRecordFinder {
    let database: Database
    init(_ database: Database) {
        self.database = database
    }
    func totalPopulation(_ names: [String]) -> Int {
        var result = 0
        for name in names {
            result += database.getPopulation(name)
        }
        return result
    }
}

class DummyDatabase: Database {

    func getPopulation(_ name: String) -> Int {
        return ["alpha": 1, "beta": 2, "gamma": 3][name]!
    }
    
}
    
class SingletonTests: XCTestCase {
    
    static var allTests = [
        ("test_singletonPopulation", test_singletonPopulation),
        ("test_dependantTotalPopulationTest", test_dependantTotalPopulationTest),
    ]
    
    func test_singletonPopulation() {
        let rf = SingletonRecordFinder()
        let names = ["Seoul", "Mexico City"]
        let tp = rf.totalPopulation(names)
        XCTAssertEqual(17_500_000 + 17_400_000, tp, "Population Size must match")
    }
    
    func test_dependantTotalPopulationTest() {
        let db = DummyDatabase()
        let names = ["alpha", "gamma"]
        let rf = ConfigurableRecordFinder(db)
        XCTAssertEqual(4, rf.totalPopulation(names))
    }
    
}

func main() {
    XCTMain([testCase(SingletonTests.allTests)])
}

main()
