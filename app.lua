local lapis = require("lapis")
local app = lapis.Application()
local respond_to = require("lapis.application").respond_to

app:enable("etlua")
app.layout = require "views.layout"


app:match("/signup", respond_to(require("actions.signup")))

app:match("home", "/", function(self)
    self.my_app_name = "RecipeHub"
    return { render = "index"}
end)



return app
