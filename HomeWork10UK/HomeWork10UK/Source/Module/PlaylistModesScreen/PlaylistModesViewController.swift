//
//  PlaylistModesViewController.swift
//  Lesson12HW
//

//

import UIKit

class PlaylistModesViewController: UIViewController {
    
    @IBOutlet weak var contentView: PlaylistModesView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    var model: PlaylistModesModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
        model.loadData()
    }
    
    private func setupInitialState() {
        
        model = PlaylistModesModel()
        model.delegate = self
        
        contentView.delegate = self
        
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
    }
    
    @IBAction func onModeChanged(_ sender: Any) {
        contentView.tableView.reloadData()
    }
}

extension PlaylistModesViewController: PlaylistModesModelDelegate {
    
    func dataDidLoad() {
        contentView.tableView.reloadData()
    }
}

extension PlaylistModesViewController: PlaylistModesViewDelegate {

}

extension PlaylistModesViewController: UITableViewDataSource {
    enum SongMode: String {
        case all = "All"
        case genre = "Genre"
        case author = "Author"
    }
    
    private var mode: SongMode {
        get {
            let selectedIndex = segmentedControl.selectedSegmentIndex
            switch selectedIndex {
            case 0:
                return .all
            case 1:
                return .genre
            case 2:
                return .author
            default:
                return .all
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.songsByGenre.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch mode {
        case .all:
            return nil
        case .genre:
            return model.songsByGenre[section].title
        case .author:
            return model.songsByAuthor[section].author
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch mode {
        case .all:
            return model.all.count
        case .genre:
            return model.songsByGenre[section].songs.count
        case .author:
            return model.songsByAuthor[section].songs.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "song_cell") as? SongCell
        else {
            assertionFailure()
            return UITableViewCell()
        }
        
        var item: Song
        switch mode {
        case .all:
            item = model.all[indexPath.row]
        case .genre:
            item = model.songsByGenre[indexPath.section].songs[indexPath.row]
        case .author:
            item = model.songsByAuthor[indexPath.section].songs[indexPath.row]
        }
        
        cell.title?.text = item.songTitle
        cell.author?.text = item.author
        cell.album?.text = item.albumTitle
        cell.genre?.text = item.genre
        
        return cell
    }
}

extension PlaylistModesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
