
import Foundation

class CodeBuilder: CustomStringConvertible {
    
    // why do we decorate buffer? because we are not inheriting `buffer` from super class
    // either with constructor or with default value
    private var buffer: String = "" //decorate buffer
    
    init(){}
    init(_ buffer: String) {
        self.buffer = buffer
    }
    
    func append(_ s: String) -> CodeBuilder {
        buffer.append(s)
        return self
    }
    
    func appendLine(_ s: String) -> CodeBuilder {
        buffer.append("\(s)\n")
        return self
    }
    
    static func +=(cb: inout CodeBuilder, s: String) {
        cb.buffer.append(s)
    }
    
    var description: String {
        return buffer
    }
}

func main() {
    var cb = CodeBuilder()
    cb.appendLine("class Foo")
        .appendLine("{")
    
    cb += "  // testing!\n";
    
    cb.appendLine("}")
    print(cb)
}

main()
