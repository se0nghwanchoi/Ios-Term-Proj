//
//  ViewController.swift
//  RealFinalPJ
//
//  Created by csh on 2024/06/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var heightInput: UITextField!
    @IBOutlet weak var weightInput: UITextField!
    @IBOutlet weak var resultButton: UIButton!
    
    
    // BMI 계산기 관리자 인스턴스
    var bmiManager = BMICalculatorManager()
        
    // BMI 데이터를 저장할 변수
    var bmi: Double?
    var bmiToString: String?
    var bmiColor: UIColor?

    // 뷰가 로드될 때 호출되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 초기 UI 설정
        SettingUI()
        }
        
    // UI를 초기 설정하는 함수
    func SettingUI() {
        heightInput.delegate = self
        weightInput.delegate = self
            
        
        firstLabel.text = "키와 체중을 입력하세요"
        resultButton.clipsToBounds = true
        resultButton.layer.cornerRadius = 5
        resultButton.setTitle("계산하기", for: .normal)
        heightInput.placeholder = "키를 입력하세요(cm)"
        weightInput.placeholder = "체중을 입력하세요(kg)"
        }
    
    @IBAction func resultButtonTapped(_ sender: UIButton) {
        if shouldPerformSegue(withIdentifier: "toResultVC", sender: self) {
                   performSegue(withIdentifier: "toResultVC", sender: self)
               }
    }
    
    // segue 수행 전 입력 값을 검증하는 함수
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
            if heightInput.text == "" || weightInput.text == "" {
                firstLabel.text = "키와 체중을 입력해주세요"
                firstLabel.textColor = .green
                return false
            }
            firstLabel.text = "키와 체중을 입력해주세요"
            firstLabel.textColor = .green
            return true
        }
        
    // segue 수행 전에 데이터를 준비하는 함수
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toResultVC" {
                let resultVC = segue.destination as! SecondViewController
                
                guard let weightT = weightInput.text, let heightT = heightInput.text else {
                    return
                }
                
                resultVC.bmi = bmiManager.getResult(height: heightT, weight: weightT)
            }
            
            // 입력 필드를 초기화
            heightInput.text = ""
            weightInput.text = ""
        }
    }

    // UITextFieldDelegate 확장을 통해 텍스트 필드의 동작을 처리
    extension ViewController: UITextFieldDelegate {
        
        // 숫자 입력만 허용하도록 설정하는 함수
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            return Int(string) != nil
        }
        
        // 리턴 키 동작을 처리하는 함수
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if heightInput.text != "", weightInput.text != "" {
                weightInput.resignFirstResponder()
            } else if heightInput.text != "" {
                weightInput.becomeFirstResponder()
            }
            return false
        }
        
        // 텍스트 필드 외부를 터치했을 때 키보드를 숨기는 함수
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            heightInput.resignFirstResponder()
            weightInput.resignFirstResponder()
        }

}

