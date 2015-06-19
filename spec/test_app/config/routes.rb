Rails.application.routes.draw do

  mount PathRewrite::Engine, at: '/'

end
