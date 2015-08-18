import Realm
import ObjectMapper

class Friend: RLMObject, Mappable {

	dynamic var ID: Int = 0
	dynamic var UserID: String = ""
	dynamic var FriendId: String = ""

    override init!() {
        super.init()
    }

    required convenience init?(_ map: Map) {
        self.init()
        mapping(map)
    }

    func mapping(map: Map) {
        ID    <- map["Friend.ID"]
        UserID    <- map["Friend.UserID"]
        FriendId    <- map["Friend.FriendId"]
    }
}
