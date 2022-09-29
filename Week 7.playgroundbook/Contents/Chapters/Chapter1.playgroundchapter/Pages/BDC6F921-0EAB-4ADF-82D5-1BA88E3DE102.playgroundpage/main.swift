
import PlaygroundSupport
import Foundation

PlaygroundPage.current.needsIndefiniteExecution = true

func getActorTask() {
    print("Start Actors task: Get Actors for best Oscar movie")
    Thread.sleep(until: Date().addingTimeInterval(10))
    print("End Actors task")
}

func getMovieTask() {
    print("Start Movie task: Get movie list from the Cinema")
    Thread.sleep(until: Date().addingTimeInterval(2))
    print("End Movie task")
}



let group = DispatchGroup()
let myGlobalQueue = DispatchQueue.global(qos: .userInitiated)

myGlobalQueue.async(group: group) {
    getMovieTask()
}

myGlobalQueue.async(group: group) {
    getActorTask()
}

//Modify DispatchGroup timeout to get "All tasks completed" printed out
if group.wait(timeout: .now() + 5) == .timedOut {
    print("Hey, I've been waiting too long!")
} else {
    print("All tasks completed")
}

//Schedule a notification block to be submitted to the myGlobalQueue
//when all tasks associated with the dispatch group have been completed.
//The notification block will print "Done" to the console output



PlaygroundPage.current.finishExecution()
