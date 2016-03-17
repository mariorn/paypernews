class ChargesController < ApplicationController

def new
  @article = Article.find_by(id: params[:article_id])
  binding.pry
end

def create

  #Amount in cents
  @article = Article.find_by(id: params[:article_id])
  @amount = @article.price

  customer = Stripe::Customer.create(
    :email => current_user.email,
    :card  => params[:stripeToken]
  )

  @charge = Stripe::Charge.create(
    :customer => customer.id,
    # :amount   => @amount.to_i,
    :amount   => 50,
    :description => "Compra artículo #{@article.id} de NewsPay",
    :currency => 'eur'
  )

  current_user.articles << @article
  redirect_to article_path(@article)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_article_charges_path(@article)
end



end



