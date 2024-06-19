//
//  HistoryTableViewController.swift
//  RealFinalPJ
//
//  Created by csh on 2024/06/19.
//

// HistoryTableViewController.swift

import UIKit

class HistoryTableViewController: UITableViewController {

    var bmiResults: [BMI] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 히스토리 데이터 로드 (임시 예시 데이터)
        loadBMIResults()
    }
    
    func loadBMIResults() {
        // 예시 데이터 추가
        bmiResults.append(BMI(Rbmi: 22.5, Sbmi: "정상", bmiColor: UIColor(displayP3Red: 210/255, green: 250/255, blue: 120/255, alpha: 1)))
        bmiResults.append(BMI(Rbmi: 27.3, Sbmi: "과체중", bmiColor: UIColor(displayP3Red: 220/255, green: 120/255, blue: 160/255, alpha: 1)))
        bmiResults.append(BMI(Rbmi: 31.8, Sbmi: "1단계 비만", bmiColor: UIColor(displayP3Red: 255/255, green: 140/255, blue: 140/255, alpha: 1)))
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bmiResults.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as! HistoryTableViewCell

        let bmiResult = bmiResults[indexPath.row]
        cell.bmiLabel.text = "BMI: \(bmiResult.Rbmi)"
        cell.descriptionLabel.text = bmiResult.Sbmi
        cell.bmiColorView.backgroundColor = bmiResult.bmiColor

        return cell
    }

    // MARK: - Navigation

  //
}

