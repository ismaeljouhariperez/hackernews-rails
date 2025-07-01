# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing data
puts "🗑️  Cleaning database..."
Vote.destroy_all
Comment.destroy_all
Post.destroy_all
User.destroy_all

puts "👥 Creating users..."

# Create test users
users = [
  { email: 'john@example.com', username: 'johnhacker', password: 'password' },
  { email: 'sarah@example.com', username: 'sarahdev', password: 'password' },
  { email: 'mike@example.com', username: 'mikecoder', password: 'password' },
  { email: 'lisa@example.com', username: 'lisatech', password: 'password' },
  { email: 'david@example.com', username: 'davidjs', password: 'password' },
  { email: 'anna@example.com', username: 'annaruby', password: 'password' },
  { email: 'chris@example.com', username: 'chrispy', password: 'password' },
  { email: 'emma@example.com', username: 'emmadata', password: 'password' }
]

created_users = users.map do |user_attrs|
  User.create!(user_attrs)
end

puts "📝 Creating posts..."

# Sample Hacker News style posts
posts_data = [
  {
    title: "Show HN: I built a Rails clone of Hacker News",
    url: "https://github.com/example/hackernews-rails",
    author: "johnhacker",
    score: 127,
    post_type: "story",
    hackernews_id: nil
  },
  {
    title: "Why SSL was renamed to TLS in late 90s (2014)",
    url: "https://tim.dierks.org/2014/05/security-standards-and-name-changes.html",
    author: "sarahdev",
    score: 290,
    post_type: "story",
    hackernews_id: nil
  },
  {
    title: "Ask HN: What are your favorite Rails gems in 2024?",
    url: "",
    author: "mikecoder",
    score: 85,
    post_type: "ask",
    hackernews_id: nil
  },
  {
    title: "Tailwind CSS v4.0 is now in beta",
    url: "https://tailwindcss.com/blog/tailwindcss-v4-beta",
    author: "lisatech",
    score: 456,
    post_type: "story",
    hackernews_id: nil
  },
  {
    title: "Show HN: A better way to handle CSS variables",
    url: "https://github.com/example/css-vars",
    author: "davidjs",
    score: 78,
    post_type: "story",
    hackernews_id: nil
  },
  {
    title: "PostgreSQL 16 released with major performance improvements",
    url: "https://www.postgresql.org/about/news/postgresql-16-released-2715/",
    author: "annaruby",
    score: 234,
    post_type: "story",
    hackernews_id: nil
  },
  {
    title: "Ask HN: How do you stay motivated as a solo developer?",
    url: "",
    author: "chrispy",
    score: 156,
    post_type: "ask",
    hackernews_id: nil
  },
  {
    title: "The future of web development: Hotwire vs React",
    url: "https://example.com/hotwire-vs-react",
    author: "emmadata",
    score: 189,
    post_type: "story",
    hackernews_id: nil
  },
  {
    title: "Show HN: Terminal-based task manager built with Ruby",
    url: "https://github.com/example/ruby-tasks",
    author: "johnhacker",
    score: 92,
    post_type: "story",
    hackernews_id: nil
  },
  {
    title: "Stimulus 3.2.0: Better Performance and New Features",
    url: "https://stimulus.hotwired.dev/releases/3.2.0",
    author: "sarahdev",
    score: 145,
    post_type: "story",
    hackernews_id: nil
  }
]

created_posts = posts_data.map do |post_data|
  # Add some time variance to make it realistic
  created_at = rand(7.days.ago..Time.current)
  
  Post.create!(
    title: post_data[:title],
    url: post_data[:url],
    author: post_data[:author],
    score: post_data[:score],
    post_type: post_data[:post_type],
    hackernews_id: post_data[:hackernews_id],
    created_at: created_at,
    updated_at: created_at
  )
end

puts "💬 Creating comments..."

# Create some comments
comments_data = [
  {
    content: "Great work! The design really captures the HN feel. How did you handle the voting system?",
    post: created_posts[0],
    user: created_users[1]
  },
  {
    content: "This is really interesting. I never knew about the SSL/TLS naming history.",
    post: created_posts[1],
    user: created_users[2]
  },
  {
    content: "For Rails 7+, I highly recommend: devise, sidekiq, image_processing, and stimulus-rails.",
    post: created_posts[2],
    user: created_users[3]
  },
  {
    content: "Finally! The performance improvements in v4 are incredible. Can't wait to migrate.",
    post: created_posts[3],
    user: created_users[4]
  },
  {
    content: "Love the simplicity of this approach. Much cleaner than traditional CSS var handling.",
    post: created_posts[4],
    user: created_users[5]
  }
]

comments_data.each do |comment_data|
  Comment.create!(
    content: comment_data[:content],
    post: comment_data[:post],
    user: comment_data[:user],
    created_at: rand(6.days.ago..Time.current)
  )
end

puts "⬆️  Creating votes..."

# Create some votes to make scores realistic
created_posts.each do |post|
  # Random number of users vote on each post
  voters = created_users.sample(rand(3..6))
  
  voters.each do |user|
    Vote.create!(
      user: user,
      post: post,
      created_at: rand(post.created_at..Time.current)
    )
  end
end

puts "✅ Seed completed!"
puts "Created:"
puts "  - #{User.count} users"
puts "  - #{Post.count} posts"
puts "  - #{Comment.count} comments"
puts "  - #{Vote.count} votes"
puts ""
puts "🚀 You can now run: ./bin/dev"
puts "📧 Test login: john@example.com / password"
