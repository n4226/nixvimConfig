import Foundation

struct Person: Equatable, Hashable {
  var name: String
  var age: Int

  static func == (lhs: Person, rhs: Person) -> Bool {
      return lhs.name == rhs.name &&
             lhs.age == rhs.age
  }
}

func main() {
  let p = Person(name: "Jon", age: 10)
  print("Hello World: \(p.name)")
}

let p1 = Person(name: "Howdy", age: 10)
let p2 = Person(name: "how", age: 10)
let p3 = Person(name: "Hey", age: 10)

if (p1.name != "how") {
  let dict = Dictionary<Person, Int>()
}

