//
//  SettingsViewController.swift
//  AC3.2-GesturesAndControls
//
//  Created by Jason Gresh on 9/29/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
  
  @IBOutlet weak var redSlider: UISlider!
  @IBOutlet weak var greenSlider: UISlider!
  @IBOutlet weak var blueSlider: UISlider!
  @IBOutlet weak var colorPreviewView: UIView!
  @IBOutlet weak var scoreSwitch: UISwitch!
  @IBOutlet weak var stepperCount: UIStepper!
  @IBOutlet weak var numberToWin: UILabel!
  @IBOutlet weak var rightWrong: UISegmentedControl!
  
  var choosingCorrectColor = true
  var choosingWrongColor = false
  
  var storedCorrectRed = 0.5
  var storedCorrectGreen = 0.5
  var storedCorrectBlue = 0.5
  var storedWrongRed = 0.5
  var storedWrongGreen = 0.5
  var storedWrongBlue = 0.5
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  
  
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let gvc = segue.destination as? GesturesViewController {
      if segue.identifier == "settingsSaved" {
        gvc.correctRedColorValue = storedCorrectRed
        gvc.correctGreenColorValue = storedCorrectGreen
        gvc.correctBlueColorValue = storedCorrectBlue
        gvc.wrongRedColorValue = storedWrongRed
        gvc.wrongGreenColorValue = storedWrongGreen
        gvc.wrongBlueColorValue = storedWrongBlue
        gvc.keepingScore = scoreSwitch.isOn
        gvc.stepperWin = Int(stepperCount.value)
      }
    }
  }
  
  @IBAction func redSliderChange(_ sender: UISlider) {
    if choosingCorrectColor {
      storedCorrectRed = Double(sender.value)
    }
    else {
      storedWrongRed = Double(sender.value)
    }
  }
  
  @IBAction func greenSliderChange(_ sender: UISlider) {
    if choosingCorrectColor {
      storedCorrectGreen = Double(sender.value)
    }
    else {
      storedWrongGreen = Double(sender.value)
    }
  }
  
  @IBAction func blueSliderChange(_ sender: UISlider) {
    if choosingCorrectColor {
      storedCorrectBlue = Double(sender.value)
    }
    else {
      storedWrongBlue = Double(sender.value)
    }
  }
  
  
  @IBAction func correctWrongColorPicker(_ sender: UISegmentedControl) {
    switch rightWrong.selectedSegmentIndex {
    case 0:
      choosingCorrectColor = true
      choosingWrongColor = false
      print("true")
    case 1:
      choosingCorrectColor = false
      choosingWrongColor = true
      print("false")
    default:
      break
    }
  }
  
  @IBAction func updateColorPreviewView(_ sender: UISlider) {
    colorPreviewView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1.0)
  }
  
  @IBAction func updateNumberToWin(_ sender: UIStepper) {
    numberToWin.text = "\(String(Int(stepperCount.value))) to win"
  }
  
  
}
