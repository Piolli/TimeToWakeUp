//
//  ViewController.swift
//  TimeToWakeUp
//
//  Created by Alexandr on 05/09/2019.
//  Copyright © 2019 Alexandr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calcutedTimesTableView: UITableView!
    let times = SleepTimeCalculator.shared.getTimesWhenToWakeUpIfWentToSleep(at: Date())

    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTableViewCell()
        
        dump(times)
        
        calcutedTimesTableView.delegate = self
        calcutedTimesTableView.dataSource = self
        
    }

    func registerTableViewCell() {
        let nib = UINib(nibName: "CalculatedTimeCell", bundle: nil)
        calcutedTimesTableView.register(nib, forCellReuseIdentifier: "cell")
    }

    func getFormattedDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"

        let formattedDate = dateFormatter.string(from: date)
        
        return formattedDate
    }
}

extension ViewController : UITableViewDelegate {
    
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return times.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CalculatedTimeCell
        
        cell.leadTimeLabel.text = getFormattedDate(times[indexPath.row])
        cell.trailingInfoLabel.text = "You sleep for 8 hours"
        
        return cell
    }
    
    
}

