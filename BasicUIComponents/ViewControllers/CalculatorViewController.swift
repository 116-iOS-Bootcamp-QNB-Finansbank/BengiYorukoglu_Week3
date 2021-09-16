//
//  CalculatorViewController.swift
//  BasicUIComponents
//
//  Created by Semih Emre ÜNLÜ on 11.09.2021.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    //@IBOutlet var digitButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.calculatorLogic = CalculatorOperationLogic()
    }
    
    private var calculatorLogic:CalculatorOperationLogic?
    private var isTyping: Bool = false
    private var lastValue:Double = 0;
    private var lastOperation:Int32 = -1;
    
    @IBAction func digitButtonTapped(_ sender: UIButton) {
        let digit = String(sender.tag)
        let digVal = NSString(string: digit).intValue
        let displayText = resultLabel.text ?? ""
        if digVal < 10 {
            
            if isTyping {
                resultLabel.text = displayText + digit
            } else {
                resultLabel.text = digit
                isTyping.toggle()
            }
        }
        else{
         
            doOperation(operation:digVal);
        }
    }
    
    @IBAction func actionButtonTapped(_ sender: UIButton) {
        
        let value = NSString(string: resultLabel.text ?? "0").doubleValue
        resultLabel.text = String(sqrt(value))
    }
    
    func doOperation( operation: Int32){
       
        let currentValue = NSString(string: resultLabel.text ?? "0").doubleValue
        let result: Double? = calculatorLogic?.doOperation(opVal: currentValue, operation: operation)
        if result == nil{
            resultLabel.text = "";
        }
        else{
            resultLabel.text = String(result!)
        }
    
        isTyping.toggle();
        return;
 
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
