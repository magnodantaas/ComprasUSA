//
//  ViewController.swift
//  ComprasUSA
//
//  Created by Magno Miranda Dantas on 18/04/21.
//

import UIKit

class ShoppingViewController: UIViewController {

    @IBOutlet weak var tfDolar: UITextField!
    @IBOutlet weak var lbRealDescription: UILabel!
    @IBOutlet weak var lbReal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setAmmount()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        setAmmount()
    }
    
    func setAmmount() {
        tc.shoppingValue = tc.convertToDouble(tfDolar.text!)
        lbReal.text = tc.getformattedValue(of: tc.dolar * tc.shoppingValue, whithCurrency: "R$ ")
        let dolar = tc.getformattedValue(of: tc.dolar, whithCurrency: "")
        lbRealDescription.text = "Valor sem impostos (dólar \(dolar))"
    }
    
    


}

