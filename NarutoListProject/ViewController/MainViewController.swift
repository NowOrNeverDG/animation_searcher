//
//  MainViewController.swift
//  NarutoListProject
//
//  Created by Ge Ding on 8/1/21.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tview: UITableView!
    var vm: MainViewModel! {
        didSet {
            vm?.fetchData(endPoint: .search) { [weak self] _ in
                DispatchQueue.main.async {
                    self?.tview.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Result Page"
        
        
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? MainTableViewCell else {return UITableViewCell()}
        cell.episodeObject = vm?.getAnimeForCell(at: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm?.getAnimesCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}

extension MainViewController:UITextViewDelegate {
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        return false
    }
    
    
}
