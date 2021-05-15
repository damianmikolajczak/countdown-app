//
//  EventTagPickerViewController.swift
//  Countdown counter
//
//  Created by Damian Mikołajczak on 13/05/2021.
//

import UIKit

class EventTagPickerViewController: UIViewController {
    
    var eventTag: EventTag?
    public var complitionHandler:((EventTag)->Void)?
    
    @IBAction func pickGreenColor(){
        eventTag = EventTag(tag: .oneWeek)
        complitionHandler?(eventTag!)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pickBlueColor(){
        eventTag = EventTag(tag: .oneDay)
        complitionHandler?(eventTag!)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pickYellowColor(){
        eventTag = EventTag(tag: .oneHour)
        complitionHandler?(eventTag!)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pickOrangeColor(){
        eventTag = EventTag(tag: .thirtyMinutes)
        complitionHandler?(eventTag!)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pickRedColor(){
        eventTag = EventTag(tag: .fiveMinutes)
        complitionHandler?(eventTag!)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
