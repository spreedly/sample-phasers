CoreSample::Application.routes.draw do

  match 'buy_phaser' => 'phasers#buy_phaser'
  match 'transparent_redirect_complete' => 'phasers#transparent_redirect_complete'
  match 'successful_purchase' => 'phasers#successful_purchase'

  get 'about' => "home#about"
  root :to => "home#index"

end
