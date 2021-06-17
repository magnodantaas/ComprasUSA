//
//  TaxesCalculator.swift
//  ComprasUSA
//
//  Created by Magno Miranda Dantas on 19/04/21.
//

import Foundation

class TaxesCalculator {
    
    static let shared = TaxesCalculator()
    var dolar: Double = 3.5
    var iof: Double = 6.38
    var stateTax: Double = 7.0
    var shoppingValue: Double = 0
    let formatter = NumberFormatter()
    
    var shoppingValueInReal: Double {
        return shoppingValue * dolar
    }
    
    var stateTaxesValue: Double {
        return shoppingValue * (stateTax/100)
    }
    
    var iofValue: Double {
        return (shoppingValue + stateTax) * iof/100
    }
    
    private init() {
        formatter.usesGroupingSeparator = true
    }
    
    func convertToDouble(_ string: String) -> Double {
        formatter.numberStyle = .none
        return formatter.number(from: string)!.doubleValue
    }
    
    func getformattedValue(of value: Double, whithCurrency currency: String) -> String{
        formatter.numberStyle = .currency
        formatter.currencySymbol = currency
        formatter.alwaysShowsDecimalSeparator = true
        return formatter.string(for: value)!
    }
    
    func calculate(useCreditCard: Bool) -> Double {
        var finalValue = shoppingValue + stateTaxesValue
        if useCreditCard {
            finalValue += iofValue
        }
        
        return finalValue * dolar
    }
}
