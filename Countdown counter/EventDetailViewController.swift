//
//  EventDetailViewController.swift
//  Countdown counter
//
//  Created by Damian Mikołajczak on 12/05/2021.
//

import UIKit

class EventDetailViewController: UIViewController {
    public var event:Event?
    
    @IBOutlet weak var daysLeft: UILabel!
    @IBOutlet weak var hoursLeft: UILabel!
    @IBOutlet weak var minutesLeft: UILabel!
    @IBOutlet weak var secondsLeft: UILabel!
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventDescription: UITextView!
    @IBOutlet weak var tagColor: UIImageView!
    @IBOutlet weak var tagName: UILabel!
    
    @IBAction func returnToMain() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editEvent() {
        let vc = storyboard?.instantiateViewController(identifier: "EventAddScreen") as! AddEventViewController
        
        vc.modalPresentationStyle = .fullScreen
        vc.eventToEdit = self.event
        vc.completitionHandler = { name, date, tag, description in
            self.event?.name = name
            self.event?.date = date
            self.event?.tag = tag
            self.event?.description = description
            
        }
        present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let formater = DateFormatter()
        formater.dateStyle = DateFormatter.Style.medium
        
        eventName.text = event?.name
        eventDate.text = formater.string(from: event!.date)
        
        if let description = event?.description {
            eventDescription.text = description
        }
        eventDescription.isEditable = false
        
        tagColor.tintColor = event?.tag.tagColor
        tagName.text = event?.tag.tagName
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { time in
            let timeLeftInSeconds = Int(self.event!.date.timeIntervalSinceNow)
            let daysLeft = timeLeftInSeconds/86400
            let hoursLeft = (timeLeftInSeconds-daysLeft*86400)/3600
            let minutesLeft = (timeLeftInSeconds-(daysLeft*86400+hoursLeft*3600))/60
            let secondsLeft = (timeLeftInSeconds-(daysLeft*86400+hoursLeft*3600+minutesLeft*60))
            
            self.daysLeft.text = "\(daysLeft) d:"
            self.hoursLeft.text = "\(hoursLeft) h:"
            self.minutesLeft.text = "\(minutesLeft) m:"
            self.secondsLeft.text = "\(secondsLeft) s"
            
            //self.countdownCounter.text = String(Int(timeLeftInSeconds))
        })
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let formater = DateFormatter()
        formater.dateStyle = DateFormatter.Style.medium
        
        eventName.text = event?.name
        eventDate.text = formater.string(from: event!.date)
        
        if let description = event?.description {
            eventDescription.text = description
        }
        eventDescription.isEditable = false
        
        tagColor.tintColor = event?.tag.tagColor
        tagName.text = event?.tag.tagName
        
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
