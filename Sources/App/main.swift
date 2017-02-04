import Vapor

let drop = Droplet()

drop.get { req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "title"]
    ])
}

let postController = PostController()
drop.resource("posts", postController)

drop.get("posts", Post.self, "sentiment", handler: postController.sentiment)
drop.run()
