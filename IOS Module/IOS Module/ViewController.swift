import UIKit
import Flutter

class ViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightLabel.text = String(format: "%.2fm", sender.value)
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightLabel.text = String(format: "%.0fKg", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {

       let flutterEngine = ((UIApplication.shared.delegate as? AppDelegate)?.flutterEngine)!;
       let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil);
       self.present(flutterViewController, animated: true, completion: nil)

        
    }

}

