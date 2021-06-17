//
//  TaxesViewController.swift
//  ComprasUSA
//
//  Created by Magno Miranda Dantas on 19/04/21.
//

import UIKit

class TaxesViewController: UIViewController {

    @IBOutlet weak var lbDolar: UILabel!
    @IBOutlet weak var lbStateTaxes: UILabel!
    @IBOutlet weak var lbStateTaxesDescription: UILabel!
    @IBOutlet weak var lbIOF: UILabel!
    @IBOutlet weak var lbIOFDescription: UILabel!
    @IBOutlet weak var swCreditCard: UISwitch!
    @IBOutlet weak var lbReal: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        calculateTaxes()
    }

    @IBAction func changeIOF(_ sender: Any) {
        calculateTaxes()
    }
    
    func calculateTaxes() {
        lbStateTaxesDescription.text = "Imposto do estado (\(tc.getformattedValue(of: tc.stateTax, whithCurrency: ""))%)"
        lbIOFDescription.text = "IOF (\(tc.getformattedValue(of: tc.iof, whithCurrency: ""))%)"
        lbDolar.text = tc.getformattedValue(of: tc.stateTaxesValue, whithCurrency: "US$ ")
        lbIOF.text = tc.getformattedValue(of: tc.iof, whithCurrency: "US$ ")
        lbStateTaxes.text = tc.getformattedValue(of: tc.iofValue, whithCurrency: "US$ ")
        
        let real = tc.calculate(useCreditCard: swCreditCard.isOn)
        lbReal.text = tc.getformattedValue(of: real, whithCurrency: "R$ ")
        
    }
}
