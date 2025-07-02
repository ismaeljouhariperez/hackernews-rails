require 'net/http'
require 'json'

class HackerNewsFetcher
  BASE_URL = 'https://hacker-news.firebaseio.com/v0'

  # On récupère les IDs des meilleures stories
  def fetch_top_story_ids
    uri = URI("#{BASE_URL}/topstories.json")
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  # On récupère un item complet par son ID
  def fetch_item(item_id)
    uri = URI("#{BASE_URL}/item/#{item_id}.json")
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  # On va chercher 20 stories et on les enregistre
  def import_top_stories(limit = 20)
    story_ids = fetch_top_story_ids.first(limit)

    story_ids.each do |id|
      item = fetch_item(id)
      puts "Import #{id} - #{item['title']}"
      save_story(item)
    end
  end

  private

  def save_story(data)
    return unless data['type'] == 'story'

    post = Post.find_or_initialize_by(hackernews_id: data['id'])

    post.title = data['title']
    post.url = data['url']
    post.author = data['by']
    post.post_type = data['type']
    post.score = data['score']
    post.published_at = Time.at(data['time'])

    post.save!
  end
end