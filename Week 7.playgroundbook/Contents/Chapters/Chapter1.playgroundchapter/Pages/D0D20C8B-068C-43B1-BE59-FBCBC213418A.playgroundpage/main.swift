
import PlaygroundSupport
import Foundation

PlaygroundPage.current.needsIndefiniteExecution = true
// Below are the funcitons of a Data processing App.

func performDownload() {
    // perform download here
    Thread.sleep(forTimeInterval: 2)
    print("downloading JSON")
}

func performJSONParsing() {
    // JSON parsing here
    Thread.sleep(forTimeInterval: 4)
    print("parsing JSON")
}

func performDBUpdate() {
    // update DB here
    Thread.sleep(forTimeInterval: 1)
    print("update DB")
}


// Queues
let dataProcessQueue = OperationQueue()
dataProcessQueue.qualityOfService = .userInitiated
dataProcessQueue.maxConcurrentOperationCount = 3

// Using blocks with OperationQueue result in the wrong order. 

dataProcessQueue.addOperation {
    performDownload()
}

dataProcessQueue.addOperation {
    performJSONParsing()
}

dataProcessQueue.addOperation {
    performDBUpdate()
}

//Using BlockOperations fix the order of Data processing. 
