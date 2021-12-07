// Data
class Document {
    
}

// Rather Large Protocol
protocol Machine {
    func print(d: Document)
    func scan(d: Document) throws
    func fax(d: Document) throws
}

class MFP: Machine {
    func print(d: Document) {
        
    }
    
    func scan(d: Document) {
        
    }
    
    func fax(d: Document) {
        
    }
}

enum NoRequiredFunctionality: Error {
    case doesNotFax
    case doesNotScan
}

class OldFashionedPrint: Machine {

    // ok
    func print(d: Document) {
        
    }
    
    // this does not work here
    func scan(d: Document) throws {
        throw NoRequiredFunctionality.doesNotFax
    }
    
    // this does not work here
    func fax(d: Document) throws {
        throw NoRequiredFunctionality.doesNotFax
    }
    
}


/* Interface Segregation Applied */
protocol Printer {
    func print(d: Document)
}

protocol Scanner {
    func scan(d: Document)
}

protocol Fax {
    func fax(d: Document)
}

class OrdinaryPrinter: Printer {
    func print(d: Document) {
        
    }
}

class PhotoCopier: Printer, Scanner {
    
    func print(d: Document) {
        
    }
    
    func scan(d: Document) {
        
    }
    
}

protocol MultiFunctionDevice: Printer, Scanner, Fax {
    
}

class MultiFunctionMachine: Printer, Scanner, Fax {
    
    let printer: Printer
    let scanner: Scanner
    
    init(printer: Printer, scanner: Scanner) {
        self.printer = printer
        self.scanner = scanner
    }
    
    func print(d: Document) {
        printer.print(d: d) // Decorator
    }
    
    func scan(d: Document) {
        
    }
    
    func fax(d: Document) {
        
    }
    
}
