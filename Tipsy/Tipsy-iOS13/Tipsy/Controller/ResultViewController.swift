import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var billTotalLabel: UITextField!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var btnFirst: UIButton!
    @IBOutlet weak var btnSecond: UIButton!
    @IBOutlet weak var btnThird: UIButton!
    
    var tip: Double = 0.1
    var totalAmount: Double = 56
    var calculateBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnTip(_ sender: UIButton) {
        billTotalLabel.endEditing(true)
        
        btnFirst.isSelected = false
        btnSecond.isSelected = false
        btnThird.isSelected = false
        sender.isSelected = true
        
        let stringTip = sender.currentTitle!
        let stringTipWithoutLast = stringTip.dropLast()
        let stringTipDouble = Double(stringTipWithoutLast)
        tip = stringTipDouble! / 100
        
    }
    

    @IBAction func btnStepper(_ sender: UIStepper) {
        billTotalLabel.endEditing(true)
        
        splitLabel.text = String(format: "%.0f", sender.value)
    }
    
    
    @IBAction func btnCalculate(_ sender: UIButton) {
        if(billTotalLabel == nil){
            print("AA")
        }
        totalAmount = Double(billTotalLabel.text!) ?? 56.0
        let split = Double(splitLabel.text!)!
        
        calculateBrain.calculateBill(amount: totalAmount, tip: tip, split: split)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! CalculatorViewController
            destinationVC.amountPerson = calculateBrain.getBill()
            destinationVC.titleText = calculateBrain.getText()
        }
    }
}

