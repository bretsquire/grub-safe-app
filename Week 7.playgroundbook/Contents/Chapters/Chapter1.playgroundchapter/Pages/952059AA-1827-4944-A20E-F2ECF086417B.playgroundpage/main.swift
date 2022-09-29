
import PlaygroundSupport
import Foundation
import UIKit

PlaygroundPage.current.needsIndefiniteExecution = true

//The code below downloads an image from the popular blog swift by sundell
//Using DispatchQueue

//Your Task is to modify the code to use OperationQueue

if let url = URL(string: "https://www.swiftbysundell.com/images/discover/swiftui/icon.png") {
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data, error == nil else { return }
        print("Image data Downloaded \(data)")
        DispatchQueue.main.async { /// execute on main thread
            print(Thread.isMainThread ? "Execution on Main Thread" : "Execution on other Thread" )
            someImageView.image = UIImage(data: data)
        }
    }
    
    task.resume()
}

setupView()
PlaygroundPage.current.liveView = view

