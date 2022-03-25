//
//  SecondViewModel.swift
//  SongPlay
//
//  Created by Mac on 25/03/22.
//

import Foundation


class SecondViewModel: NSObject {
    
    var audio: String = ""
    
    func downloadFile(completion: @escaping (_ sucess: Bool) -> Void) {
        
        if let audioUrl = URL(string: audio) {
            
            // then lets create your document folder url
            let documentsDirectoryURL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            
            // lets create your destination file url
            let destinationUrl = documentsDirectoryURL.appendingPathComponent(audioUrl.lastPathComponent)
            print(destinationUrl)
            
            if FileManager.default.fileExists(atPath: destinationUrl.path) {
                print("The file already exists at path")
                completion(true)
            } else {
                NetworkManager.shared.callingDownloadFileHTTPApiRequest(api: audio) { success in
                    if success {
                        print("File is downloaded successfully")
                        completion(true)
                    }else {
                        completion(false)
                    }
                }
            }
        }
        
    }
    
}

