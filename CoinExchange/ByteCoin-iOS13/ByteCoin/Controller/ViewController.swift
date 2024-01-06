import UIKit

 class ViewController: UIViewController{
     
    @IBOutlet weak var pickerViewCurrency: UIPickerView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    
    var coinManager = CoinManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinManager.delegate = self
        pickerViewCurrency.dataSource = self
        pickerViewCurrency.delegate = self
    }
}

extension ViewController: CoinManagerDelegate{
    
    func didUpdateCurrency(_ currencyManager: CoinManager, currency: CoinModel) {
        DispatchQueue.main.async{
            self.priceLabel.text = currency.rateString
            
        }
    }
}
 
extension ViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
}

extension ViewController: UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = coinManager.currencyArray[row]
        coinManager.fetchCurrency(selectedCurrency)
        self.currencyLabel.text = selectedCurrency
    }
}
