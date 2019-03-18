json.posts @posts do |post|
  json.id post.id
  json.title post.title
  json.createdAt post.created_at
  json.thumbnail post.thumbnail.service_url
  json.feature post.feature
  json.url post.url
  if post.tournament
    json.league post.tournament.league.abbreviation
  end
end
