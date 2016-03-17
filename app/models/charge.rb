class Charge < ActiveRecord::Base

  def process_payment
    customer = Stripe::Customer.create email: current_user.email,
                                       card: card_token

    Stripe::Charge.create customer: customer.id,
                          amount: @article.price,
                          description: "Compra de artículo #{@article.id} de NewsPay",
                          currency: 'eur'

  end

end
