
import Foundation

// Before using factory
class Point: CustomStringConvertible {
    var x, y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    init(rho: Double, theta: Double) {
        x = rho * cos(theta)
        y = rho * sin(theta)
    }

    
    var description: String {
        return "x = \(x), y = \(y)"
    }
    
}


class PointFactory {

    // you can either make it static or not
    static func createCartesian(x: Double, y: Double) -> Point {
        return Point(x: x, y: y)
    }
    
    static func createPolar(rho: Double, theta: Double) -> Point {
        return Point(rho: rho, theta: theta)
    }
    
}



func main() {
    let p = PointFactory.createCartesian(x: 1, y: 2)
}

main()
