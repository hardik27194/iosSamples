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
    
    func objectAtIndex(idx: Int) -> Question {
        let questions =  Question.objectsWhere("id = %d", idx)
        let question = (questions.firstObject() as Question)
        return question
    }
    
    func allObjects () -> RLMResults {
        println("realm.defaultRealmPath  \(RLMRealm.defaultRealmPath()) ")
        let questions = Question.objectsWhere("dispFlg = true")
        return Question.objectsWhere("dispFlg = true")
    }
    
    func maxId() -> Int {
        return Question.allObjects().maxOfProperty("id").integerValue
    }

    func allObjectCount() -> Int {
        return Int(Question.allObjects().count)
    }
    
    func find(id:Int) -> Question? {
        let result = Question.objectsWithPredicate(NSPredicate(format: "id = %d", id))
        if let question = result {
            return question.firstObject() as? Question
        }
        return nil
    }
    
    func registQuestion(question:Question){
        
        var questions = Array<Question>()
        questions.append(question)
        
        for question in questions {
            realm.beginWriteTransaction()
            Question.createOrUpdateInDefaultRealmWithObject(question)
            realm.commitWriteTransaction()
        }
        
    }
    
    func maxIdQuestion(){
        //        NSPredicate(format: "", <#args: CVarArgType#>...)
        //        Question.objectsWithPredicate(<#predicate: NSPredicate!#>)
        let tmp1 = Question.allObjects()
        let tmp2 = tmp1.maxOfProperty("id") as String
        
        println("max id -> \(tmp2)")
        
    }
    
    func makeData () {
        
        var questions = Array<Question>()
        
        var question = Question()
        question.id = 0
        question.questionText = "She answered (me) that she would be happy to come"
        question.answerText = "彼女は喜んでお伺いしますと(私に)返事をよこした."
        questions.append(question)
        
        question = Question()
        question.id = 1
        question.questionText = "I'm fine, thank you,\" she answered."
        question.answerText = "元気です, ありがとう」と彼女は答えた."
        question.dispFlg = true
        questions.append(question)
        
        question = Question()
        question.id = 2
        question.questionText = "He didn't answer a word (to me). "
        question.answerText = "彼は(私に)ひと言も答えなかった."
        questions.append(question)
        
        question = Question()
        question.id = 3
        question.questionText = "I phoned but nobody answered."
        question.answerText = " 電話をかけたがだれも出なかった."
        questions.append(question)
        
        question = Question()
        question.id = 4
        question.questionText = "A newspaper answered for a tablecloth."
        question.answerText = " 新聞紙 1 枚でテーブルクロスの代わりになった."
        questions.append(question)
        
        question = Question()
        question.id = 5
        question.questionText = "Her answer to my greeting was a smile."
        question.answerText = " 私のあいさつに答えて彼女はにっこり笑った."
        questions.append(question)
        
        /*
        question = Question()
        question.id = "6"
        question.questionText = "Figure out the answer to this calculus problem."
        question.answerText = " この微積分問題の答えを出しなさい."
        questions.append(question)

        
        question = Question()
        question.questionText = "Figure out the answer to this calculus problem."
        question.answerText = " この微積分問題の答えを出しなさい."
        questions.append(question)

        question = Question()
        question.questionText = "Figure out the answer to this calculus problem."
        question.answerText = " この微積分問題の答えを出しなさい."
        questions.append(question)

        question = Question()
        question.questionText = "Figure out the answer to this calculus problem."
        question.answerText = " この微積分問題の答えを出しなさい."
        questions.append(question)
        */
        
        let realm = RLMRealm.defaultRealm()
        
        println(realm.path)
        
        for question in questions {
            realm.beginWriteTransaction()
            Question.createOrUpdateInDefaultRealmWithObject(question)
            realm.commitWriteTransaction()
        }
        
    }
    
}
