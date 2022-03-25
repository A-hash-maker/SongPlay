//
//  NetworkManager.swift
//  SongPlay
//
//  Created by Mac on 24/03/22.
//

import Foundation
import SwiftyJSON


class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() { }
    
    func callingHTTPApiRequest(word: String, completion: @escaping(_ model: ArtistModel) -> Void) {
        
        var baseURLString = "https://itunes.apple.com/search?term=" + word
        guard let url = URL(string: baseURLString) else {
            return
        }
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            let decoder = JSONDecoder()
            
            guard let data = data else {
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                var obj = JSON(data)
                print(obj)
//                print(json)
            }catch {
                print(error.localizedDescription)
            }
            

            do {
                let jsonData = try decoder.decode(ArtistModel.self, from: data)
                completion(jsonData)
            }catch {
                print("an error in catch")
                print(error.localizedDescription)
            }
            
        }
        dataTask.resume()
    }
    
    func callingDownloadFileHTTPApiRequest(api: String, completion: @escaping((_ success: Bool) -> Void)) {
        
        var baseURLString = api
        guard let audioUrl = URL(string: baseURLString) else {
            return
        }
        
        // then lets create your document folder url
        let documentsDirectoryURL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let destinationUrl = documentsDirectoryURL.appendingPathComponent(audioUrl.lastPathComponent)
        
        URLSession.shared.downloadTask(with: audioUrl, completionHandler: { (location, response, error) -> Void in
            guard let location = location, error == nil else { return }
            do {
                // after downloading your file you need to move it to your destination url
                try FileManager.default.moveItem(at: location, to: destinationUrl)
                print("File moved to documents folder")
                completion(true)
            } catch let error as NSError {
                print(error.localizedDescription)
                completion(false)
            }
            completion(false)
        }).resume()
    }
    
    
    
    
}
