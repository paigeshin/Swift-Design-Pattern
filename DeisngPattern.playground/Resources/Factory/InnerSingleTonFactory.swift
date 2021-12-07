
import Foundation

// Before using factory
class Point: CustomStringConvertible {

    private var x, y: Double
    
    private init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    private init(rho: Double, theta: Double) {
        x = rho * cos(theta)
        y = rho * sin(theta)
    }

    var description: String {
        return "x = \(x), y = \(y)"
    }
    
    static let factory = PointFactory.instance
    
    class PointFactory {

        private init() {}
        static let instance = PointFactory()
        
        // you can either make it static or not
        func createCartesian(x: Double, y: Double) -> Point {
            return Point(x: x, y: y)
        }
        
        func createPolar(rho: Double, theta: Double) -> Point {
            return Point(rho: rho, theta: theta)
        }
        
    }
    
}


func main() {
    let p = Point.factory.createCartesian(x: 1, y: 2)
    print(p.description)
}

main()
