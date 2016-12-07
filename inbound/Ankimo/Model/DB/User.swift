import Realm
import ObjectMapper

class User: RLMObject, Mappable {

	dynamic var ID: Int = 0
	dynamic var UserID: Int = 0
	dynamic var UserName: String = ""
	dynamic var CountryID: Int = 0
	dynamic var ValidFlg: Bool = false
	dynamic var DelFlg: Bool = false

    override init!() {
        super.init()
    }

    override class func primaryKey() -> String {
        return "ID"
    }
    
    required convenience init?(_ map: Map) {
        self.init()
        mapping(map)
    }

    func mapping(map: Map) {
        ID    <- map["ID"]
        UserID    <- map["UserID"]
        UserName    <- map["UserName"]
        CountryID    <- map["CountryID"]
        ValidFlg    <- map["ValidFlg"]
        DelFlg    <- map["DelFlg"]

    }
    
    func jsonToRealm(){
    
        let path : String = NSBundle.mainBundle().pathForResource("data2", ofType: "json")!
        let fileHandle : NSFileHandle = NSFileHandle(forReadingAtPath: path)!
        let data : NSData = fileHandle.readDataToEndOfFile()
        let jsonString = NSString(data: data, encoding: NSUTF8StringEncoding)
        println(jsonString)
        
        let dic = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil) as! NSDictionary
        
        let usersAry: NSArray = dic["User"] as! NSArray
        
        
        

        let mapper = Mapper<User>()
        let users:[User] = mapper.mapArray(usersAry)!
        println(users)
        
        let realm = RLMRealm.defaultRealm()
        
        realm.transactionWithBlock { () -> Void in
            realm.addOrUpdateObjectsFromArray(users)
        }
    
    
    }
    
    
}









