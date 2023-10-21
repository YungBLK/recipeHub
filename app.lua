local lapis = require("lapis")
local app = lapis.Application()

app:enable("etlua")
app.layout = require "views.layout"

app:match("/", function(self)
    self.my_app_name = "RecipeHub"
    return { render = "index"}
end)
app:match("/signIn", function(self)
  return { render = "signIn"}
end)
app:match("/signUp", function(self)
  return { render = "signUp"}
end)



return app
