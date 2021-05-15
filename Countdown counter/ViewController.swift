//
//  ViewController.swift
//  Countdown counter
//
//  Created by Damian Mikołajczak on 12/05/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    

    let myEvents:[String] = ["Urodziny","Koniec studiów", "Rozpoczęcie pracy", "Obrona pracy magisterskiej"]
    var eventsData = Array<Event>()
    var events = [Array<Event>(), Array<Event>()]
    
    @IBOutlet weak var eventsTable: UITableView!
    
    @IBAction func AddEvent() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "EventAddScreen") as! AddEventViewController
        vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        vc.completitionHandler = { name, date, tag, description in
            let newEvent = Event(name: name, date: date, tag: tag, description: description)
            self.eventsData.append(newEvent)
        }
        present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        eventsData.append(Event(name: "Próba", date: Date(), tag: EventTag(tag: .oneHour), description: nil))
        
        events[0].removeAll()
        events[1].removeAll()
        for event in eventsData {
            if event.expired {
                events[1].append(event)
            } else {
                events[0].append(event)
            }
        }
        
        eventsTable.dataSource = self
        eventsTable.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        events[0].removeAll()
        events[1].removeAll()
        for event in eventsData {
            if event.expired {
                events[1].append(event)
            } else {
                events[0].append(event)
            }
        }
        
        eventsTable.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! EventTableViewCell
        
        let formater = DateFormatter()
        formater.dateStyle = .short
        
        cell.eventName.text = events[indexPath.section][indexPath.row].name
        cell.eventDate.text = formater.string(from: events[indexPath.section][indexPath.row].date)
        cell.eventTag.tintColor = events[indexPath.section][indexPath.row].tag.tagColor
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let event = events[indexPath.section][indexPath.row]
        let vc = storyboard?.instantiateViewController(identifier: "EventDetail") as! EventDetailViewController
        vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        vc.event = event
        present(vc, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Upcoming events"
        case 1:
            return "Expired events"
        default:
            return "Something went wrong"
        }
    }
}
