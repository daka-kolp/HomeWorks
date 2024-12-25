//
//  PlaylistByGenreViewController.swift
//  Lesson12HW
//

//

import UIKit

class PlaylistByGenreViewController: UIViewController {
    
    @IBOutlet weak var contentView: PlaylistByGenreView!
    var model: PlaylistByGenreModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
        model.loadData()
    }
    
    private func setupInitialState() {
        
        model = PlaylistByGenreModel()
        model.delegate = self
        
        contentView.delegate = self
        
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
    }
}

extension PlaylistByGenreViewController: PlaylistByGenreModelDelegate {
    
    func dataDidLoad() {
        contentView.tableView.reloadData()
    }
}

extension PlaylistByGenreViewController: PlaylistByGenreViewDelegate {
    
}

extension PlaylistByGenreViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.songsByGenre.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return model.songsByGenre[section].title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.songsByGenre[section].songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "song_cell") as? SongCell
        else {
            assertionFailure()
            return UITableViewCell()
        }
        
        let item = model.songsByGenre[indexPath.section].songs[indexPath.row]
        cell.title?.text = item.songTitle
        cell.author?.text = item.author
        cell.album?.text = item.albumTitle
        cell.genre?.text = item.genre
        
        return cell
    }
}

extension PlaylistByGenreViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
