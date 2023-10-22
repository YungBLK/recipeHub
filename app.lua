local lapis = require("lapis")
local app = lapis.Application()
local respond_to = require("lapis.application").respond_to
local types = require("tableshape").types

app:enable("etlua")
app.layout = require "views.layout"

app:match("home", "/", function(self)
    self.my_app_name = "RecipeHub"
    return { render = "index"}
end)

app:match("/signIn", function(self)
   self.my_app_name = "RecipeHub"
   return { render = "signIn"}
end)



-- register/signup --
local user_shape = types.shape{
  first_name = types.string,
  last_name = types.string,
  email = types.pattern("^[w-.]+@([w-]+.)+[w-]{2,4}$"),
  password = types.string,
  confirm_password = types.string,
}

local handleFieldsValidations = function (params)
  if assert(user_shape(params)) then return true else return false end;
end

app:match("/signup", respond_to({
 GET = function (self)
  self.my_app_name = "RecipeHub"
  return { render = "signUp"}
 end,
 POST = function (self)
  handleFieldsValidations(self.params)
  return {}
 end
}))

-- end signup


app:match("/login", respond_to({
 before = function (self)
  return "login2"
 end,
 POST = function (self)
       return { redirect_to = self:url_for("home")}
 end
 }))




return app
