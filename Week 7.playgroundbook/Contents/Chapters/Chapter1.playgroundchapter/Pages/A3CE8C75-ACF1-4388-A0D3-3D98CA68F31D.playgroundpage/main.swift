
import SwiftUI
import PlaygroundSupport

let waiterQueue = DispatchQueue(label: "waiter")
let bondQueue = DispatchQueue(label: "James Bond")

//The code below causes a deadlock
//Fix it by choosing which queues should perform a synchronous execution &
//which ones should perform an asynchronous execution
//N.B. The solution code must be a mix of sync & async execution

waiterQueue.sync {
    print("waiter: Can i get you a drink dear Sir")
    
    bondQueue.sync {
        print("James Bond: sure thing! vodka; & add a slice of lemon peel.")
        
        waiterQueue.sync {
            print("waiter: Shaken or Stirred?")
        }
    }
}


