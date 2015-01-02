//
//  QuestionDataManager.swift
//  swift2
//
//  Created by takeshi on 2015/01/02.
//  Copyright (c) 2015年 jp.co.sakura.charorin. All rights reserved.
//

import Realm

class QuestionDataManager: NSObject {
   
    let realm = RLMRealm.defaultRealm()

    class var sharedInstance : QuestionDataManager {
        struct Static {
            static let instance : QuestionDataManager = QuestionDataManager()
        }
        return Static.instance
    }
    
    func exec () -> RLMResults {
        
        println("realm.defaultRealmPath  \(RLMRealm.defaultRealmPath()) ")
        
        let questions = Question.allObjects()
        
//        for tmp in questions {
//            var question = tmp as Question
//            println( question.questionText )
//            
//        }

        return Question.allObjects()
        
    }
    
    func find(id:String) -> Question? {
        let result = Question.objectsWithPredicate(NSPredicate(format: "id = %@", id))
        if let question = result {
            return question.firstObject() as? Question
        }
        return nil
    }

    func makeData () {
        
        var questions = Array<Question>()
        
        var question = Question()
        question.id = "0"
        question.questionText = "q0"
        question.answerText = "a0"
        questions.append(question)
        
        question = Question()
        question.id = "1"
        question.questionText = "q1"
        question.answerText = "a1"
        questions.append(question)
        
        question = Question()
        question.id = "2"
        question.questionText = "q2"
        question.answerText = "a2"
        questions.append(question)
        
        question = Question()
        question.id = "3"
        question.questionText = "q3"
        question.answerText = "a3"
        questions.append(question)
        
        question = Question()
        question.id = "4"
        question.questionText = "q4"
        question.answerText = "a4"
        questions.append(question)

        question = Question()
        question.id = "5"
        question.questionText = "q5"
        question.answerText = "a5"
        questions.append(question)

        question = Question()
        question.id = "6"
        question.questionText = "q6"
        question.answerText = "a6"
        questions.append(question)

        let realm = RLMRealm.defaultRealm()
        
        println(realm.path)
        
        for question in questions {
            realm.beginWriteTransaction()
            Question.createOrUpdateInDefaultRealmWithObject(question)
            realm.commitWriteTransaction()
        }
        
    }

}
