import Foundation

class BankAccount: CustomStringConvertible {
    
    private var balance = 0
    private let overdraftLimit = -500
    
    func deposit(_ amount: Int) {
        balance += amount
        print("Deposited \(amount), balance = \(balance)")
    }
    
    func withdraw(_ amount: Int) -> Bool {
        if balance - amount >= overdraftLimit {
            balance -= amount
            print("Withdrew \(amount), balance is now \(balance)")
            return true
        }
        return false
    }
    
    var description: String {
        return "Balance = \(balance)"
    }
    
}

protocol Command {
    func call()
}


class BankAccountCommand: Command {

    private var account: BankAccount
    
    enum Action {
        case deposit
        case withdraw
    }
    
    private var action: Action
    private var amount: Int
    private var succeeded = false
    
    init(_ account: BankAccount, _ action: Action, _ amount: Int) {
        self.account = account
        self.action = action
        self.amount = amount
    }
    
    func call() {
        switch action {
        case .deposit:
            account.deposit(amount)
            succeeded = true
        case .withdraw:
            succeeded = account.withdraw(amount)
        }
    }
    
}

func main() {
    let ba = BankAccount()
    let commands = [
        BankAccountCommand(ba, .deposit, 100),
        BankAccountCommand(ba, .withdraw, 25),
    ]
    
    print(ba)
    
    commands.forEach { $0.call() }

    print(ba)
    
}

main()
