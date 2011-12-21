KyleSwarnerCom::Application.routes.draw do
  root :to => "navbar#home"
  
  match "/submit" => "navbar#submitform"
end
