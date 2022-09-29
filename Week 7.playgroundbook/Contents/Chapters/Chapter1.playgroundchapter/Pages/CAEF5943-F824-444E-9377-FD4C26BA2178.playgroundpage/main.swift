import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//Currently Tomatoes & Apples are printed synchronously.
//Modify the DispatchQueue's so Tomatoes & Apples are printed Asynchronous. 


DispatchQueue(label: "com.raywenderlich.queue1").sync {
    for i in 0..<10 {
        print("🍅 ", i)
    }
}

DispatchQueue(label: "com.raywenderlich.queue2").sync {
    for i in 100..<110 {
        print("🍏 ", i)
    }
}

