local types = require("tableshape").types

local signup_shape = types.shape{
  first_name = types.string,
  last_name = types.string,
  email = types.pattern("^[%w.]+@%w+%.%w+$"),
  password = types.pattern("[A-Za-z]") *  types.pattern("[0-9]") *  types.pattern("[>!&+$@#]"),
  confirm_password = types.string:is_optional(),
}

local validateFields = function (fields)
 assert(signup_shape(fields.params))
end

return {
  GET = function (self)
   self.my_app_name = "RecipeHub"
   return { render = "signup"}
  end,
  POST = function (self)
   validateFields(self)
  end
}


