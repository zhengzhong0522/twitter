//
//  TweetViewController.swift
//  Twitter
//
//  Created by zhong zheng on 2/2/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    @IBOutlet weak var tweetField: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tweetButton(_ sender: Any) {
        if !(tweetField.text.isEmpty) {
            
            TwitterAPICaller.client?.postTweet(tweeting: tweetField.text!, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (Error) in
                print("Failed to tweet!")
                print(Error)
                self.dismiss(animated: true, completion: nil)
            })
        }
        else {
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
