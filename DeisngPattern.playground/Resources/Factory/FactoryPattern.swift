import Foundation

// Before using factory
class Point: CustomStringConvertible {
    var x, y: Double
    
    private init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    private init(rho: Double, theta: Double) {
        x = rho * cos(theta)
        y = rho * sin(theta)
    }
    
        // little bit more descriptive
    static func createCartesian(x: Double, y: Double) -> Point {
        return Point(x: x, y: y)
    }
        // little bit more descriptive
    static func createPolar(rho: Double, theta: Double) -> Point {
        return Point(rho: rho, theta: theta)
    }
    
    var description: String {
        return "x = \(x), y = \(y)"
    }
    
}

func main() {
    var p = Point.createCartesian(x: 3, y: 3)
    print(p)
}

main()
