//
//  BMIRecordManager.swift
//  RealFinalPJ
//
//  Created by csh on 2024/06/19.
//

import UIKit
import Foundation

class BMIRecordManager {
    
    static let shared = BMIRecordManager()
    
    private var records: [BMIRecord] = []
    
    private init() {}
    
    // BMI 기록 추가
    func addBMIRecord(height: Double, weight: Double, bmi: BMI) {
        let record = BMIRecord(date: Date(), height: height, weight: weight, bmi: bmi)
        records.append(record)
    }
    
    // 저장된 BMI 기록 가져오기
    func getBMIRecords() -> [BMIRecord] {
        return records
    }
}

