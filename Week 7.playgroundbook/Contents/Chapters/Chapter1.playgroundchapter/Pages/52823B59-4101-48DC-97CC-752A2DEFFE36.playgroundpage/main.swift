
import PlaygroundSupport
import Foundation

PlaygroundPage.current.needsIndefiniteExecution = true
// Below are the funcitons from a MovieApp.
func getActorTask() {
    print("Start Actors task: Get Actors for best Oscar movie")
    Thread.sleep(until: Date().addingTimeInterval(5))
    print("End Actors task")
}

func getMovieTask() {
    print("Start Movie task: Get movie list from the Cinema")
    Thread.sleep(until: Date().addingTimeInterval(12))
    print("End Movie task")
}


// create a work item for both task 



// Add the getActorTask and getMovieTask to the Dispatch Work Item created 


// cancel the work item after 10 seconds using the asyncAfter provided. 
DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(10)) {
    print("workItem canceled")
    // Add Code to cancel workItem here
}


// call perform on the workitem 


PlaygroundPage.current.finishExecution()


// Qestion: why is the Movie task completed yet the dispatch work item has been cancelled ?
