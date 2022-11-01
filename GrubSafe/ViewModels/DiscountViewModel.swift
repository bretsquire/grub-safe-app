//
//  DiscountViewModel.swift
//  GrubSafe
//
//  Created by Bret Squire on 9/5/22.
//

enum DiscountViewModel: Double {
    case `default` = 0.05
    case thanksgiving = 0.10
    case christmas = 0.15
    case newYear = 0.20

    var description: String {
        get {
            switch self {
            case .`default`:
                return "Default discount (5%)"
            case .thanksgiving:
                return "Thanksgiving discount (10%)"
            case .christmas:
                return "Christmas discount (15%)"
            case .newYear:
                return "New year discount (20%)"
            }
        }
    }
    
    func applyDiscount(_ total: Double) -> Double {
        return total - total * self.rawValue
    }
}
