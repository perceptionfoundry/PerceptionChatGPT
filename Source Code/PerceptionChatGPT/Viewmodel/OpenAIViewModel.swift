//
//  OpenAIViewModel.swift
//  PerceptionChatGPT
//
//  Created by Perception on 08/04/2023.
//

import Foundation
import Alamofire
import Combine


class OpenAIViewModel{
    let baseUrl = "https://api.openai.com/v1/"
    
    func sendMessage(message: String) -> AnyPublisher<OpenAICompletionResponse,Error>{
        let body = OpenAICompletionBody(model: "text-davinci-003", prompt: message, temperature: 0.7, max_tokens: 256)
        let header : HTTPHeaders = [
            "Authorization": "Bearer \(Constant.openAIAPIKey)"
        ]
        
        return Future{ [weak self] promise in
            guard let self = self else{return}
            AF.request(self.baseUrl + "completions", method: .post, parameters: body, encoder: .json, headers: header)
    //            .responseString { resp in
    //                print(resp.result)
    //            }
                .responseDecodable(of: OpenAICompletionResponse.self) { response in
                        //print(response.result)
                    switch response.result{
                    case .success(let result):
                        promise(.success(result))
                    case .failure(let err):
                        promise(.failure(err))
                    }
                }
        }
        .eraseToAnyPublisher()
      
    }
}
