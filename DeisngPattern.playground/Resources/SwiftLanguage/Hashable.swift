struct Person {
    let name: String
}

struct UserAccount: Hashable {

    let accountIdentifier: Person
     
    func hash(into hasher: inout Hasher) {
        hasher.combine(accountIdentifier.name)
    }
    
    static func == (lhs: UserAccount, rhs: UserAccount) -> Bool {
        return lhs.accountIdentifier.name == rhs.accountIdentifier.name
    }

}

struct Post {
    let text: String
}

// Generic struct 'Dictionary' requires that 'UserAccount' conform to 'Hashable'
//var dictionary = [UserAccount: [Post]]()

var dictionary = [
    UserAccount(accountIdentifier: Person(name: "a")) : [
        Post(text: "first")
    ],
    UserAccount(accountIdentifier: Person(name: "b")) : [
        Post(text: "first")
    ],
]

// Need to get a unique hash to identify
let posts = dictionary[UserAccount(accountIdentifier: Person(name: "a"))]
print(posts)
