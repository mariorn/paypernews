namespace :asyncjobs do
  desc "Generate ranking most viewed!"
  task createrankingviews: :environment do
    # find the most viewed
    # serialize info
    articles = Article.all.order(visits: :desc)[0..9].to_json
    # store in a redis key
    $redis.set("rankingviews", articles)
  end

  desc "Generate ranking most recents!"
  task createrankingrecents: :environment do
    articles = Article.all.order(publish_at: :desc)[0..9].to_json
    $redis.set("rankingrecents", articles)
  end

  desc "Generate ranking most score!"
  task createrankingscore: :environment do
    articles = Article.all.order(score: :desc)[0..9].to_json
    $redis.set("rankingscore", articles)
  end
end
