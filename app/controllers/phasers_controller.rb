
class PhasersController < ApplicationController

  def buy_phaser
    @credit_card = CreditCard.new
  end

  def transparent_redirect_complete
    return if error_saving_card

    response = SpreedlyCore.get_payment_method(params[:token])
    return render_unable_to_retieve_card(response) unless response.code == 200

    @credit_card = CreditCard.new(response)
    return render_buy_phaser unless @credit_card.valid?

    response = SpreedlyCore.purchase(params[:token], amount_to_charge )
    return redirect_to(successful_purchase_url) if response.code == 200

    render_unable_to_purchase(response)
  end

  def successful_purchase

  end


  private
  def render_unable_to_retieve_card(response)
    flash.now[:error] = response["errors"]["error"]["__content__"]
    render_buy_phaser
  end

  def render_unable_to_purchase(response)
    return render_unable_to_retieve_card(response) if response["errors"]
    flash.now[:error] = "#{response['transaction']['response']['message']} #{response['transaction']['response']['error_detail']}"

    render_buy_phaser
  end

  def error_saving_card
    return false if params[:error].blank?

    flash.now[:error] = params[:error]
    render_buy_phaser
    true
  end

  def render_buy_phaser
    @credit_card = CreditCard.new unless @credit_card
    render(:action => :buy_phaser)
  end

  def amount_to_charge
    (( 0.02 * @credit_card.how_many.to_i ) * 100).to_i
  end

end
