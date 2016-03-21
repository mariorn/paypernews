class Charge < ActiveRecord::Base

  def process_payment
    customer = Stripe::Customer.create email: current_user.email,
                                       card: card_token

    Stripe::Charge.create customer: customer.id,
                          amount: @article.price,
                          description: "Compra de artículo #{@article.id} de NewsPay",
                          currency: 'eur'
  end


  def self.totalArticlesRead(user, days)

    from = (Date.today - days).to_time
    to = Date.today.to_time

    @transactions = user.transactions.where(created_at: from..to)
    @transactions_by_week ={"Monday": {total: 0, total_price: 0},
                           "Tuesday": {total: 0, total_price: 0},
                           "Wednesday": {total: 0, total_price: 0},
                           "Thursday": {total: 0, total_price: 0},
                           "Friday": {total: 0, total_price: 0},
                           "Saturday": {total: 0, total_price: 0},
                           "Sunday": {total: 0, total_price: 0}
                         }

    @transactions.each do |transaction|
      price = Article.find(transaction.article_id).price
      day = transaction.created_at.to_time.strftime("%A")
      @transactions_by_week[day.to_sym][:total] += 1
      @transactions_by_week[day.to_sym][:total_price] += price
    end

    @transactions_by_week
  end


  def self.totalArticlesWrite(user, days)

    from = (Date.today - days).to_time
    to = Date.today.to_time

    @articles = Article.where(created_at: from..to).where(user_id: user.id)

    @transactions_by_week = {"Monday": {total: 0, total_price: 0},
                             "Tuesday": {total: 0, total_price: 0},
                             "Wednesday": {total: 0, total_price: 0},
                             "Thursday": {total: 0, total_price: 0},
                             "Friday": {total: 0, total_price: 0},
                             "Saturday": {total: 0, total_price: 0},
                             "Sunday": {total: 0, total_price: 0}
                           }

    @articles.each do |article|
      day = article.created_at.to_time.strftime("%A")
      @transactions_by_week[day.to_sym][:total] += 1
      @transactions_by_week[day.to_sym][:total_price] +=
        Article.find(article.id).transactions.count * article.price
    end

    @transactions_by_week
  end




end
