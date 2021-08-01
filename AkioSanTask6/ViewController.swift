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

    private var randomNumber = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        slider.minimumValue = 1
        slider.maximumValue = 100

        randomNumber = makeRandomNumber()
        
        randomNumberLabel.text = "\(randomNumber)"
    }

    private func makeRandomNumber() -> Int {
        Int.random(in: 1...100)
    }

    private func presentDialog(decision: String, value: Int) {
        let alert = UIAlertController(title: "結果",
                                      message: "\(decision)\nあなたの値は: \(value)",
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "再挑戦", style: .default) { [weak self] _ in
            self?.retry()
        }
        
        alert.addAction(action)
        present(alert, animated: true)
    }

    private func retry() {
        randomNumber = makeRandomNumber()
        randomNumberLabel.text = "\(randomNumber)"
        slider.setValue(50, animated: true)
    }
    
    @IBAction func decisionButton(_ sender: UIButton) {

        let sliderValue = Int(slider.value)

        if sliderValue == randomNumber {
            presentDialog(decision: "正解!", value: sliderValue)
        } else {
            presentDialog(decision: "ハズレ!", value: sliderValue)
        }
    }
}
