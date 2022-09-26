import Darwin
import Foundation
// thought struct was inherently a prototype pattern except if it contains a class type property then it's copy retains the reference to the same class object
class Test {
    let id = arc4random()
}
struct ContainClass {
    var test: Test
    var value: String
}
var containClass = ContainClass(test: Test(), value: "one")
var containClass2 = containClass
print(Unmanaged.passUnretained(containClass.test).toOpaque())
print(Unmanaged.passUnretained(containClass2.test).toOpaque())
