//
//  RecordViewController.swift
//  RealFinalPJ
//
//  Created by csh on 2024/06/19.
//

import UIKit

class RecordViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var bmiRecords: [BMIRecord] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // BMI 기록 가져오기
        bmiRecords = BMIRecordManager.shared.getBMIRecords()
        
        // 테이블뷰 설정
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bmiRecords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BMIRecordCell", for: indexPath)
        
        let record = bmiRecords[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = dateFormatter.string(from: record.date)
        
        cell.textLabel?.text = "날짜: \(dateString), BMI: \(record.bmi.Rbmi)"
        
        return cell
    }
}
