import LinkShareEnums.Seriousness
import com.ig.LinkShare.DocumentResource
import com.ig.LinkShare.LinkResource
import com.ig.LinkShare.ReadingItem
import com.ig.LinkShare.Resource
import com.ig.LinkShare.Topic
import com.ig.LinkShare.User
import com.ig.LinkShare.Subscription
//import sun.plugin.javascript.navig.Link

class BootStrap {

    def bootStrapService
    def readingItemService

    def init = { servletContext ->
        bootStrapService.createUser()
        readingItemService.markReadingItems()
    }


    def destroy = {
    }


}