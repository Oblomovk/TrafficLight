//
//  ViewController.swift
//  TraficLight
//
//  Created by Konstantin Oblomov on 16.12.2024.
//

import UIKit

enum LightState {
    case red
    case yellow
    case green
}

final class ViewController: UIViewController {

    @IBOutlet var redLigth: UIView!
    @IBOutlet var yellowLigth: UIView!
    @IBOutlet var greenLigth: UIView!
    
    @IBOutlet var switchButtonLigth: UIButton!
    
    
    private var lightState = LightState.red
    private let ligthOn = 1.0
    private let ligthOff = 0.5
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switchButtonLigth.layer.cornerRadius = 10
        
        redLigth.layer.cornerRadius = redLigth.frame.height / 2
        yellowLigth.layer.cornerRadius = yellowLigth.frame.height / 2
        greenLigth.layer.cornerRadius = greenLigth.frame.height / 2

        redLigth.alpha = ligthOff
        yellowLigth.alpha = ligthOff
        greenLigth.alpha = ligthOff
        
    }

    @IBAction func switchButtomLigthTapped(_ sender: UIButton) {
        if switchButtonLigth.currentTitle == "START" {
            switchButtonLigth.setTitle("NEXT", for: .normal)
        }
        
        switch lightState {
        case .red:
            greenLigth.alpha = ligthOff
            redLigth.alpha = ligthOn
            lightState = .yellow
        case .yellow:
            redLigth.alpha = ligthOff
            yellowLigth.alpha = ligthOn
            lightState = .green
        case .green:
            yellowLigth.alpha = ligthOff
            greenLigth.alpha = ligthOn
            lightState = .red
        }
    }
}

