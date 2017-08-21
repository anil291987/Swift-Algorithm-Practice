//: Playground - noun: a place where people can play

class Person {
    let name: String
    var apartment: Apartment?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) is being deinitialisation")
    }
}
class Apartment {
    let number: Int
    weak var tenant: Person?
    init(number: Int) {
        self.number = number
    }
    deinit {
        print("Apartment \(number) is being deinitialisation")
    }
}
var bob:Person? = Person(name : "Bob")
var apartment: Apartment? = Apartment(number: 232)
apartment?.tenant = bob
bob?.apartment = apartment

bob = nil
apartment = nil
