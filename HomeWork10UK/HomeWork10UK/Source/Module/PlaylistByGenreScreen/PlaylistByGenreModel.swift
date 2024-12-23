//
//  PlaylistByGenreModel.swift
//  Lesson12HW
//

//

import Foundation

protocol PlaylistByGenreModelDelegate: AnyObject {
    func dataDidLoad()
}

class PlaylistByGenreModel {
    
    weak var delegate: PlaylistByGenreModelDelegate?
    private let dataLoader = DataLoaderService()
    
    var songsByGenre: [SongsByGenre] = []
    
    func loadData() {
        dataLoader.loadPlaylist { playlist in
            let items = playlist?.songs ?? []
            
            for song in items {
                if let index = self.songsByGenre.firstIndex(where: {$0.title == song.genre}) {
                    let item = self.songsByGenre[index]
                    self.songsByGenre[index] = SongsByGenre(title: song.genre, songs: item.songs + [song])
                } else {
                    self.songsByGenre.append(SongsByGenre(title: song.genre, songs: [song]))
                }
            }
            
            self.delegate?.dataDidLoad()
        }
    }
}
