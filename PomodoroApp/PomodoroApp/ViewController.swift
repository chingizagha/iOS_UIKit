import UIKit

class ViewController: UIViewController {
    
    private var startDate = Date()
       private var timer: Timer?
    
    
    @IBOutlet weak var labelTimerText: UILabel!
    let progressView = CircularProgressView(frame: CGRect(x: 0, y: 0, width: 250, height: 250), lineWidth: 15, rounded: false)


    override func viewDidLoad() {
        super.viewDidLoad()
       

        startTimer()
        setUpCircularProgressBarView()
    }
    
    func setUpCircularProgressBarView() {
            progressView.progressColor = .blue
            progressView.trackColor = .lightGray
            progressView.center =  view.center
            progressView.progress = 0.6
            view.addSubview(progressView)
    }
    
  
    private func startTimer() {
            // Set up a timer to update the UI every second
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
                guard let self = self else { return }
                self.updateCounter()
            }

            // Manually trigger the timer to update the UI immediately
            timer?.fire()
        }

        private func updateCounter() {
            // Calculate the time difference between the current date and the start date
            let currentDate = Date()
            let elapsedTime = currentDate.timeIntervalSince(self.startDate + 60)

            // Format the elapsed time in the desired format
            let formattedTime = formatTimeInterval(elapsedTime)

            // Update the UI with the formatted time
            labelTimerText.text = formattedTime
        }

        private func formatTimeInterval(_ timeInterval: TimeInterval) -> String {
            let formatter = DateComponentsFormatter()
            formatter.unitsStyle = .positional
            formatter.allowedUnits = [.minute, .second]
            formatter.zeroFormattingBehavior = .pad

            return formatter.string(from: timeInterval) ?? "00:00"
        }

        deinit {
            // Invalidate the timer to prevent memory leaks
            timer?.invalidate()
        }

}

