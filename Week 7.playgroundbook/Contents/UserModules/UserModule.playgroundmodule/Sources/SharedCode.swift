// Code inside modules can be shared between pages and other source files.

import UIKit

public let someImageView = UIImageView(frame: CGRect(x: 400, y: 200, width: 200, height: 200))

public let view = UIView()

public func setupView() {
    view.backgroundColor = .white
    view.addSubview(someImageView)
    let label = UILabel()
    label.frame = CGRect(x: 150, y: 200, width: 200, height: 0)
    label.text = "Hello Crusty!"
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 48.0)
    label.backgroundColor = UIColor.yellow
    label.textAlignment = .center
    label.font = label.font.boldItalic
    
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.distribution = .fillProportionally
    view.addSubview(stackView)
    
    stackView.addArrangedSubview(label)
    stackView.addArrangedSubview(someImageView)
    
    // autolayout constraint
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
}

extension UIFont {
    var bold: UIFont {
        return with(.traitBold)
    }
    
    var italic: UIFont {
        return with(.traitItalic)
    }
    
    var boldItalic: UIFont {
        return with([.traitBold, .traitItalic])
    }
    
    
    
    func with(_ traits: UIFontDescriptor.SymbolicTraits...) -> UIFont {
        guard let descriptor = self.fontDescriptor.withSymbolicTraits(UIFontDescriptor.SymbolicTraits(traits).union(self.fontDescriptor.symbolicTraits)) else {
            return self
        }
        return UIFont(descriptor: descriptor, size: 0)
    }
    
    func without(_ traits: UIFontDescriptor.SymbolicTraits...) -> UIFont {
        guard let descriptor = self.fontDescriptor.withSymbolicTraits(self.fontDescriptor.symbolicTraits.subtracting(UIFontDescriptor.SymbolicTraits(traits))) else {
            return self
        }
        return UIFont(descriptor: descriptor, size: 0)
    }
}

//To prevent thread print to mix output in the console
//Using a serial DispatchQueue to serialize your print calls 
private let printQueue = DispatchQueue(label: "aprint", qos: .utility)

public func breakfast(_ message: String){
    printQueue.async {
        print(message)
    }
}
