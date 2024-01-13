import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var labelTimerText: UILabel!
    var timer = Timer()
    let progressView = CircularProgressView(frame: CGRect(x: 0, y: 0, width: 250, height: 250), lineWidth: 15, rounded: false)
    
    let currentDate = Date()
    let date = Date(timeInterval: self.seconds, since: self.currentDate)
    

    var seconds = 6000.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

                // Convert timestamp to Date
       

        // Create a date formatter
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm:ss" // Customize the date format as per your requirement

        // Format the date and set it to the label
        let formattedDate = dateFormatter.string(from: date)
        labelTimerText.text = formattedDate
        
        setUpCircularProgressBarView()
    }
    
    func setUpCircularProgressBarView() {
            progressView.progressColor = .blue
            progressView.trackColor = .lightGray
            progressView.center =  view.center
            progressView.progress = 0.6
            view.addSubview(progressView)
    }
    
    @objc func updateCounter(){
        seconds -= 1
        }
    
    func secondsToHoursMinutesSeconds(_ seconds: Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    
    @IBAction func btnStart(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    

}

