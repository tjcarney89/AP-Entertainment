//
//  FirebaseClient.swift
//  AP Entertainment
//
//  Created by TJ Carney on 12/28/20.
//

import Foundation
import FirebaseDatabase


class FirebaseClient {
    
    static var ref = Database.database().reference()
    
    class func fetchQuestionOfTheDay(completion: @escaping (QuestionOfTheDay) -> ()) {
        ref.child("question-of-the-day").observeSingleEvent(of: .value) { (snapshot) in
            if let data = snapshot.value as? [String:Any] {
                let question = data["question"] as? String ?? ""
                let answer = data["answer"] as? String ?? ""
                let questionOfTheDay = QuestionOfTheDay(question: question, answer: answer)
                completion(questionOfTheDay)
            }
        }
        
    }

    
}
