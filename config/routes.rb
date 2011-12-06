KyleSwarnerCom::Application.routes.draw do
  root :to => "navbar#home"
  
  match "/aboutme" => "navbar#aboutme"
  match "/resume" => "navbar#resume"
  match "/contact" => "navbar#contact"
end
