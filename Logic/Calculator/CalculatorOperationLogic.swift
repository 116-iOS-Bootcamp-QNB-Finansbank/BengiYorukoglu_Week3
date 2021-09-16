//
//  CalculatorOperationLogic.swift
//  BasicUIComponents
//
//  Created by 109895 on 16.09.2021.
//

import Foundation

class CalculatorOperationLogic{

    private var _lastValue:Double = 0;
    private var _lastOperation:Int32 = -1;
    var lastValue: Double {
        get {
            return _lastValue
        }
        set {
            _lastValue = newValue
        }
    }
    var lastOperation: Int32 {
        get {
            return _lastOperation
        }
        set {
            _lastOperation = newValue
        }
    }
    required init() {
        
    }
    
    func doOperation(opVal:Double,operation:Int32) ->Double?{
        let currentValue = opVal
       
        if self.lastOperation > 0 {
           
            var result = self.lastValue;
            switch self.lastOperation {
            case 10:
                result = result + currentValue
            case 11:
                result = result - currentValue
            case 12:
                result = result * currentValue
            case 13:
                result = result / currentValue
            case 14:
                self.lastValue = result
                self.lastOperation = operation
                return result
        
            default:
                self.lastValue = result
            }
            self.lastValue = result
            self.lastOperation = operation
            return result
        }else {
            
            self.lastOperation = operation
            self.lastValue = opVal
            return nil
            
        }
        
    }
}
