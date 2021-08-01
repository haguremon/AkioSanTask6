//
//  ViewController.swift
//  AkioSanTask6
//
//  Created by IwasakIYuta on 2021/07/30.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var randomNumberLabel: UILabel!
    
    @IBOutlet private var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomNumberLabel.text = "\(round(Float.random(in: 1...100)))"
        
    }
    private func dialog(decision: String, value: String) {
        let alert = UIAlertController(title: "結果",
                                      message: "\(decision)\nあなたの値は: \(value)",
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "再挑戦", style: .default) { [ weak self ] _ in
            
            self?.randomNumberLabel.text = "\(round(Float.random(in: 1...100)))"
            self?.slider.setValue(50, animated: true)
        
        }
        
        alert.addAction(action)
        present(alert, animated: true)
        
    }
    
    @IBAction func decisionButton(_ sender: UIButton) {
        slider.minimumValue = 1
        slider.maximumValue = 100
        
        let sliderValue = round(slider.value)

        if randomNumberLabel.text == "\(sliderValue)" {
            
            dialog(decision: "正解!", value: "\(sliderValue)")
        
        } else {
            
            dialog(decision: "ハズレ!", value: "\(sliderValue)")
        
        }
        
    }
    
    
}

