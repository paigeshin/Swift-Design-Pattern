protocol Vehicle {
    var description: String { get }
    var brand: String { get }
    init(brand: String)
    func start()
    func stop()
}

extension Vehicle {
    
    func getBrand() -> String {
        return brand
    }

}

protocol Engine {
    var hasFuel: Bool { get }
    var isServied: Bool { get }
}
