//
//  extension.swift
//  unit-converter
//
//  Created by ippon on 18/07/2022.
//

import Foundation

extension Double {
    func meterToFoot() -> Double {
        return self * 3.28
    }
    
    func meterToMile() -> Double {
        return self / 1609.344
    }
    
    func footToMeter() -> Double {
        return self / 3.28
    }
    
    func footToMile() -> Double {
        return self / 5280
    }
    
    func mileToMeter() -> Double {
        return self * 1609.344
    }
    
    func mileToFoot() -> Double {
        return self * 5280
    }
}
