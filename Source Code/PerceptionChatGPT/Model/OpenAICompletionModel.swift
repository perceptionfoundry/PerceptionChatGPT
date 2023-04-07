//
//  OpenAICompletionModel.swift
//  PerceptionChatGPT
//
//  Created by Perception on 08/04/2023.
//

import Foundation


struct OpenAICompletionBody:Encodable{
    let model : String
    let prompt : String
    let temperature : Float?
    let max_tokens : Int?
}

struct OpenAICompletionResponse:Decodable{
    let id : String
    let choices : [OpenAICompletionChoices]
}

struct OpenAICompletionChoices:Decodable{
    let text: String
}
