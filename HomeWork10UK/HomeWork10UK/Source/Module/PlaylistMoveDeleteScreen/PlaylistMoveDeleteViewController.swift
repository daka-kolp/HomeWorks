//
//  PlaylistMoveDeleteViewController.swift
//  Lesson12HW
//

//

import UIKit

class PlaylistMoveDeleteViewController: UIViewController {
    
    @IBOutlet weak var contentView: PlaylistMoveDeleteView!
    @IBOutlet weak var isEditable: UISwitch!
    
    var model: PlaylistMoveDeleteModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
        model.loadData()
    }
    
    private func setupInitialState() {
        
        model = PlaylistMoveDeleteModel()
        model.delegate = self
        
        contentView.delegate = self
        
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
    }
    
    @IBAction func onIsEditableChanged(_ sender: UISwitch) {
        contentView.tableView.setEditing(sender.isOn, animated: true)
    }
}

extension PlaylistMoveDeleteViewController: PlaylistMoveDeleteModelDelegate {
    
    func dataDidLoad() {
        contentView.tableView.reloadData()
    }
}

extension PlaylistMoveDeleteViewController: PlaylistMoveDeleteViewDelegate {
    
}

extension PlaylistMoveDeleteViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "song_cell") as? SongCell
        else {
            assertionFailure()
            return UITableViewCell()
        }
        
        let item = model.items[indexPath.row]
        cell.title?.text = item.songTitle
        cell.author?.text = item.author
        cell.album?.text = item.albumTitle
        cell.genre?.text = item.genre
        
        return cell
    }
}

extension PlaylistMoveDeleteViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            model.items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = model.items[sourceIndexPath.row]
        model.items.remove(at: sourceIndexPath.row)
        model.items.insert(movedObject, at: destinationIndexPath.row)
    }
}
