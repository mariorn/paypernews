class Charge < ActiveRecord::Base

  def self.totalArticlesBuy(user, days)
    from = (Date.today - days + 1).to_time
    to = (Date.today + 1).to_time

    @transactions = user.transactions.where(created_at: from..to)
    @transactions_by_days =
                          {
                           Monday: {total: 0, total_price: 0},
                           Tuesday: {total: 0, total_price: 0},
                           Wednesday: {total: 0, total_price: 0},
                           Thursday: {total: 0, total_price: 0},
                           Friday: {total: 0, total_price: 0},
                           Saturday: {total: 0, total_price: 0},
                           Sunday: {total: 0, total_price: 0}
                          }

    @transactions.each do |transaction|
      price = Article.find(transaction.article_id).price
      day = transaction.created_at.to_time.strftime("%A")
      @transactions_by_days[day.to_sym][:total] += 1
      @transactions_by_days[day.to_sym][:total_price] += price
    end

    @transactions_by_days
  end


  def self.totalArticlesSold(user, days)
    from = (Date.today - days + 1).to_time
    to = (Date.today + 1).to_time

    @transactions = Transaction.where(created_at: from..to)
    @articles = Article.where(user_id: user.id).pluck('id')
    @transactions_by_days =
                          {
                           Monday: {total: 0, total_price: 0},
                           Tuesday: {total: 0, total_price: 0},
                           Wednesday: {total: 0, total_price: 0},
                           Thursday: {total: 0, total_price: 0},
                           Friday: {total: 0, total_price: 0},
                           Saturday: {total: 0, total_price: 0},
                           Sunday: {total: 0, total_price: 0}
                          }

     @transactions.each do |transaction|
       if(@articles.include?(transaction.article_id))
         price = Article.find(transaction.article_id).price
         day = transaction.created_at.to_time.strftime("%A")
         @transactions_by_days[day.to_sym][:total] += 1
         @transactions_by_days[day.to_sym][:total_price] += price
       end
     end

    @transactions_by_days
  end

end
