module ApplicationHelper

  def get_categories
    Category.all.limit(9)
  end

  def get_redis
    @redis_recents = JSON.parse($redis.get("rankingrecents"))
    @redis_score = JSON.parse($redis.get('rankingscore'))
    @redis_views = JSON.parse($redis.get('rankingviews'))
  end



end
