//
//  AddEventViewController.swift
//  Countdown counter
//
//  Created by Damian Mikołajczak on 12/05/2021.
//

import UIKit

class AddEventViewController: UIViewController {

    public var completitionHandler: ((String, Date, EventTag, String?) -> Void)?
    public var eventToEdit: Event?
    var tag: EventTag = EventTag(tag: .fiveMinutes)
    
    @IBOutlet weak var eventDate: UIDatePicker!
    @IBOutlet weak var eventName: UITextField!
    @IBOutlet weak var tagColor: UIImageView!
    @IBOutlet weak var tagName: UIButton!
    @IBOutlet weak var eventDescription: UITextView!
    
    @IBAction func pickEventTag() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "EventTagPicker") as! EventTagPickerViewController
        vc.modalPresentationStyle = .fullScreen
        vc.complitionHandler = { tag in
            self.tag = EventTag(tag: tag.tag)
        }
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func returnToMain() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveEvent(_ sender: Any) {
        if eventName.text! == "" {
            let alert = UIAlertController(title: "Empty event name", message: "Please type at least a name of an event", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if eventDate.date.timeIntervalSinceNow < 0 {
            let alert = UIAlertController(title: "This event already expired", message: "Are you sure that you want save an expired event?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "No", style: .default, handler: { action in return}))
        }
        
        let name = eventName.text!
        let date = eventDate.date
        var description: String? = nil
        
        if eventDescription.text != "" {
            description = eventDescription.text
        }
        
        completitionHandler?(name, date, tag, description)
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardGesture()
        
        
        // Do any additional setup after loading the view.
        if eventToEdit != nil {
            eventName.text = eventToEdit!.name
            eventDate.date = eventToEdit!.date
            tagColor.tintColor = eventToEdit!.tag.tagColor
            tagName.setTitle(eventToEdit?.tag.tagName, for: .normal)
            tag = eventToEdit!.tag
        }
        
        tagColor.tintColor = tag.tagColor
        tagName.setTitle(tag.tagName, for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if eventToEdit != nil {
            eventName.text = eventToEdit!.name
            eventDate.date = eventToEdit!.date
            tagColor.tintColor = eventToEdit!.tag.tagColor
            tagName.setTitle(eventToEdit?.tag.tagName, for: .normal)
        }
        
        tagColor.tintColor = tag.tagColor
        tagName.setTitle(tag.tagName, for: .normal)
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
