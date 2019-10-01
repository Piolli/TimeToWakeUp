//
//  CalculatedTimeResultsViewController.swift
//  TimeToWakeUp
//
//  Created by Alexandr on 27/09/2019.
//  Copyright © 2019 Alexandr. All rights reserved.
//

import UIKit

class CalculatedTimeResultsViewController: UIViewController {
    
    let cellIdentifier = "cell"
    
    var viewModel: TimeCalculatorViewModel? {
        didSet {
            viewModel?.results.bind({ [weak self] (results) in
                
                self?.resultsTableView.reloadData()
            })
            viewModel?.calculate()
        }
    }
    
    var datePickerView: UIDatePicker!
    var resultsTableView: UITableView!
    var tableHeaderTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureDatePicker()
        configureTableView()
    }
    
    func configureDatePicker() {
        datePickerView = UIDatePicker()
        datePickerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(datePickerView)
        
        NSLayoutConstraint.activate([
            datePickerView.topAnchor.constraint(equalTo: view.topAnchor),
            datePickerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            datePickerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            ])
        
        datePickerView.datePickerMode = .time
        datePickerView.minuteInterval = 5
        datePickerView.addTarget(self, action: #selector(wasChangedDate(_:)), for: .valueChanged)
    }
    
    @objc func wasChangedDate(_ sender: UIDatePicker) {
        print("new selected date: \(sender.date)")
        viewModel?.calculateWith(time: sender.date)
    }
    
    func configureTableView() {
        resultsTableView = UITableView()
        resultsTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultsTableView)
        
        resultsTableView.dataSource = self
        resultsTableView.delegate = self
        resultsTableView.estimatedRowHeight = 44
        resultsTableView.rowHeight = UITableView.automaticDimension
    
        let abovePicker = CGFloat(8)
        let guide = view.safeAreaLayoutGuide
        
        //register xib
        let nib = UINib(nibName: "CalculatedTimeCell", bundle: nil)
        resultsTableView.register(nib, forCellReuseIdentifier: cellIdentifier)
        resultsTableView.register(Header.self, forHeaderFooterViewReuseIdentifier: "header")
        
        NSLayoutConstraint.activate([
            resultsTableView.topAnchor.constraint(equalTo: datePickerView.bottomAnchor, constant: abovePicker),
            resultsTableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            resultsTableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            resultsTableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
            ])
    }
}

extension CalculatedTimeResultsViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.results.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CalculatedTimeCell
        
        cell.leadTimeLabel.text = viewModel?.results.value?[indexPath.row].calculatedTimeFormatted ?? ""
        cell.trailingInfoLabel.text = viewModel?.results.value?[indexPath.row].diffentTimeFormatted ?? ""
        
        return cell
    }

}

extension CalculatedTimeResultsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = ResultsTableHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 50))
        headerView.label.text = viewModel?.calculateDescription
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
}

class Header : UITableViewHeaderFooterView {
    
    override func layoutSubviews() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        label.text = "Something..."
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: bottomAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        
        textLabel?.text = "sfksdfksdfj"
        backgroundColor = .yellow
    }
}

