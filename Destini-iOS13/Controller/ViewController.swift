//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var storyBrain: StoryBrain!
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        storyBrain = StoryBrain()
        updateUI(with: storyBrain.currentStory)
    }

    func updateUI(with story: Story) {
        storyLabel.text = story.title
        choice1Button.setTitle(story.choice1, for: .normal)
        choice2Button.setTitle(story.choice2, for: .normal)
    }
    
    @IBAction func choiceMad(_ sender: UIButton){
        guard let buttonId = sender.restorationIdentifier else { return }
        
        storyBrain.nextStory(choice: buttonId)
        
        updateUI(with: storyBrain.currentStory)
    }
}

