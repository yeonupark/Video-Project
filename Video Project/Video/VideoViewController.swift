//
//  VideoViewController.swift
//  Video Project
//
//  Created by 마르 on 2023/08/17.
//

import UIKit
import Kingfisher

class VideoViewController: UIViewController {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var videoTableView: UITableView!
    
    var list: [Document] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoTableView.delegate = self
        videoTableView.dataSource = self
        
        videoTableView.rowHeight = 120
    }
}

extension VideoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = videoTableView.dequeueReusableCell(withIdentifier: "VideoTableViewCell", for: indexPath) as? VideoTableViewCell else {
            fatalError("에러 발생")
        }
        cell.titleLabel.text = list[indexPath.row].title
        cell.authorLabel.text = list[indexPath.row].author
        
        let min = Int(list[indexPath.row].playTime)/60
        let sec = Int(list[indexPath.row].playTime)%60
        
        cell.dateLabel.text = "\(list[indexPath.row].datetime.prefix(10)) | \(min)분\(sec)초"
        
        cell.thumbnailImage.kf.setImage(with: URL(string: list[indexPath.row].thumbnail))
        
        return cell
    }
    
    
}

extension VideoViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        list.removeAll()
        view.endEditing(true)
        
        guard let query = searchBar.text else { return }
        
        KakaoAPIManager.shared.callRequest(query: query) { data in
            self.list = data
            self.videoTableView.reloadData()
        }
    }
}
