PhasersSample::Application.routes.draw do

  match 'buy_phaser' => 'phasers#buy_phaser', via: [:get, :post]
  match 'transparent_redirect_complete' => 'phasers#transparent_redirect_complete', via: [:get, :post]
  match 'successful_purchase' => 'phasers#successful_purchase', via: [:get, :post]

  get 'about' => "home#about"
  root :to => "home#index"

end
