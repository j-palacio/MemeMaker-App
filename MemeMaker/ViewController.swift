//
//  ViewController.swift
//  MemeMaker
//
//  Created by juan palacio on 6/9/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topSegmentedControl: UISegmentedControl!
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    @IBOutlet weak var bottomSegmentedControl: UISegmentedControl!
    
    var topChoices = [CaptionOption]()
    var bottomChoices = [CaptionOption]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let coolChoice = CaptionOption(emoji: "🕶️", caption: "You know what's cool?")
        let madChoice = CaptionOption(emoji: "💥", caption: "You know what makes me mad?")
        let loveChoice = CaptionOption(emoji: "💕", caption: "You know what I love?")
        
        topChoices = [coolChoice, madChoice, loveChoice]
        topSegmentedControl.removeAllSegments()
        
        for choice in topChoices {
            topSegmentedControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
        }
        
        topSegmentedControl.selectedSegmentIndex = 0
        
        let catChoice = CaptionOption(emoji: "🐱", caption: "Cats wearing hats")
        let dogChoice = CaptionOption(emoji: "🐶", caption: "Dogs carrying logs")
        let monkeyChoice = CaptionOption(emoji: "🐵", caption: "Monkeys being funky")
        
        bottomChoices = [catChoice, dogChoice, monkeyChoice]
        bottomSegmentedControl.removeAllSegments()
        
        for choice in bottomChoices {
            bottomSegmentedControl.insertSegment(withTitle: choice.emoji, at: bottomChoices.count, animated: false)
        }
        
        bottomSegmentedControl.selectedSegmentIndex = 0
        
        updateCaptions()
    }
    
    func updateCaptions() {
        let topIndex = topSegmentedControl.selectedSegmentIndex
        topCaptionLabel.text = topChoices[topIndex].caption
        
        let bottomIndex = bottomSegmentedControl.selectedSegmentIndex
        bottomCaptionLabel.text = bottomChoices[bottomIndex].caption
    }
    
    @IBAction func segmentedControlChanged(_ sender: Any) {
        updateCaptions()
    }
    
    @IBAction func dragTopLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            topCaptionLabel.center = sender.location(in: view)
        }
    }
    
    @IBAction func dragBottomLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            bottomCaptionLabel.center = sender.location(in: view)
        }
        
    }
    
}

