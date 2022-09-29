import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//Add appropriate QOS to show avocado Toast is more important than pineapple Pizza

let pineapplePizzaQueue = DispatchQueue(label: "com.raywenderlich.queue1")
let avocadoToastQueue = DispatchQueue(label: "com.raywenderlich.queue2")

pineapplePizzaQueue.async {
    for i in 1..<10 {
        breakfast("🍕🍍")
    }
}

avocadoToastQueue.async {
    for i in 1..<10 {
        breakfast("🥑🥪")
    }
}




PlaygroundPage.current.finishExecution()
