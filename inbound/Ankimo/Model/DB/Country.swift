import Realm
import ObjectMapper

class Country: RLMObject, Mappable {

	dynamic var ID: Int = 0
	dynamic var CountryID: String = ""
	dynamic var CountryName: String = ""
	dynamic var ValidFlg: Bool = false
	dynamic var DelFlg: Bool = false

    override init!() {
        super.init()
    }

    required convenience init?(_ map: Map) {
        self.init()
        mapping(map)
    }

    func mapping(map: Map) {
        ID    <- map["Country.ID"]
        CountryID    <- map["Country.CountryID"]
        CountryName    <- map["Country.CountryName"]
        ValidFlg    <- map["Country.ValidFlg"]
        DelFlg    <- map["Country.DelFlg"]
    }
}
