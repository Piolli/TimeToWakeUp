//
//  ViewController.swift
//  TimeToWakeUp
//
//  Created by Alexandr on 05/09/2019.
//  Copyright © 2019 Alexandr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    @IBOutlet weak var calcutedTimesTableView: UITableView!
//    @IBOutlet weak var timePickerView: UIDatePicker!
    @IBOutlet weak var calculatorTypeSwitch: UISegmentedControl!
    
//    private var viewModel: CalculatedResultsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        registerTableViewCell()
//
//
//        calcutedTimesTableView.delegate = self
//        calcutedTimesTableView.dataSource = self
//
//        initViewModel()
    }
//
//    func initViewModel() {
////        let wantToWakeUpAtTimeIndex = 0
////        let wantGoToSleepAtTimeIndex = 1
//
//        let morning = Calendar.current.date(bySettingHour: 8, minute: 0, second: 0, of: Date())!
//        timePickerView.setDate(morning, animated: true)
//        self.viewModel = CalculatedResultsViewModel(goToSleepTime: morning)
//        self.viewModel.wakeUpTime = Date()
////        self.viewModel = CalculatedResultsViewModel(wakeUpTime: Date())
//
//    }
//
//    func setTime(date: Date, switchIndex: Int) {
//        if switchIndex == 0 {
//            viewModel.goToSleepTime = date
//        } else if switchIndex == 1 {
//            viewModel.wakeUpTime = date
//        }
//
//        self.calcutedTimesTableView.reloadData()
//    }
//
//
//
//    @IBAction func didSelectNewDate(_ sender: UIDatePicker) {
//        setTime(date: sender.date, switchIndex: calculatorTypeSwitch.selectedSegmentIndex)
//    }
//
//    func registerTableViewCell() {
//        let nib = UINib(nibName: "CalculatedTimeCell", bundle: nil)
//        calcutedTimesTableView.register(nib, forCellReuseIdentifier: "cell")
//    }
//
//    func getFormattedDate(_ date: Date) -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "HH:mm"
//
//        let formattedDate = dateFormatter.string(from: date)
//
//        return formattedDate
//    }
//
    @IBAction func calculateTypeWasSwitched(_ sender: UISegmentedControl) {
//        let wantToWakeUpAtTimeIndex = 1
//        let wantGoToSleepAtTimeIndex = 0
//        let morning = Calendar.current.date(bySettingHour: 8, minute: 0, second: 0, of: Date())!
//
//        if sender.selectedSegmentIndex == wantGoToSleepAtTimeIndex {
//            timePickerView.setDate(Date(), animated: true)
//            setTime(date: Date(), switchIndex: wantGoToSleepAtTimeIndex)
//        } else if sender.selectedSegmentIndex == wantGoToSleepAtTimeIndex {
//            timePickerView.setDate(Date(), animated: true)
//            setTime(date: morning, switchIndex: wantToWakeUpAtTimeIndex)
//        }
    }
    
}

//extension ViewController : UITableViewDelegate {
//
//}
//
//extension ViewController : UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.countOfResults
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CalculatedTimeCell
//
//        if let cellViewModel = viewModel.createWakeUpTimeViewModel(at: indexPath, switchIndex: calculatorTypeSwitch.selectedSegmentIndex) {
//            cell.leadTimeLabel.text = viewModel.wentToSleepResults[indexPath.row].format()
//            cell.trailingInfoLabel.text = "You sleep for \(cellViewModel.fullSleepTime.format())"
//        }
//
//        return cell
//    }
//
//
//}
