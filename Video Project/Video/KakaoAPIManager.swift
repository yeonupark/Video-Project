//
//  KakaoAPIManager.swift
//  Video Project
//
//  Created by 마르 on 2023/08/17.
//

import UIKit
import Alamofire

class KakaoAPIManager {
    
    static let shared = KakaoAPIManager()
    
    let header: HTTPHeaders = ["Authorization":"KakaoAK \(APIKey.kakaoKey)"]
    
    func callRequest(query: String, completionHandler: @escaping ([Document]) -> Void ) {
        let url = "https://dapi.kakao.com/v2/search/vclip?query=\(query)"
        let text = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        AF.request(url, method: .get, headers: header).validate()
            .responseDecodable(of: VideoClip.self) { response in
                
                switch response.result {
                case .success(let value):
                    completionHandler(value.documents)
                    
                case .failure(let error):
                    print(error)
                }
            }
            
        
    }
}
