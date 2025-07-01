# 📰 Hacker News Rails

A simple Hacker News clone built with Ruby on Rails 7 and Tailwind CSS v4.

Import posts from HackerNews API, vote, comment, and react with emojis.

![Rails](https://img.shields.io/badge/Rails-7.1.5-red?logo=ruby-on-rails)
![Tailwind CSS](https://img.shields.io/badge/Tailwind-v4.1-blue?logo=tailwind-css)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15-blue?logo=postgresql)
![Stimulus](https://img.shields.io/badge/Stimulus-3.2-green?logo=stimulus)

## ✨ Features

- 🔐 **User Authentication** - Login/signup with username (Devise)
- 📥 **HackerNews API Import** - Fetch posts from HackerNews
- ⬆️ **Voting System** - Upvote posts (toggle functionality)
- 💬 **Comments** - Add comments to posts
- 😀 **Emoji Reactions** - React to comments with emojis
- 📱 **Responsive Design** - Modern interface with Tailwind CSS v4
- ⚡ **Interactive Navigation** - Mobile menu and dropdown with Stimulus
- 🎨 **Authentic Colors** - Official Hacker News Orange (#FF6600)

## 🛠 Modern Tech Stack

- **Ruby on Rails 7.1.5** - Web framework
- **PostgreSQL 15+** - Database
- **Devise** - Authentication
- **Tailwind CSS v4.1** - Modern styling (5x faster)
- **Stimulus 3.2** - Lightweight JavaScript
- **ImportMap** - JavaScript module management
- **Heroicons 1.2** - SVG icons
- **Simple Form** - Forms
- **HackerNews API** - Data source

## 🚀 Tailwind CSS v4 - Next Generation

### ⚡ Exceptional Performance

- **5x faster** full compilation
- **100x faster** incremental builds (microseconds)
- **Auto-detection** of content (no more `content` configuration)

### 🎨 CSS-first Configuration

```css
@import "tailwindcss";

@theme {
  --color-primary: #ff6600; /* Hacker News Orange */
  --color-secondary: #828282; /* Hacker News Gray */
  --color-background: #f6f6ef; /* Hacker News Beige */
  --spacing: 0.25rem; /* Dynamic spacing scale */
}
```

### 🆕 New v4 Features

- **Container queries** built-in
- **Native CSS cascade layers**
- **3D transforms**
- **CSS variables** for all tokens
- **P3 color space** support

## 🧑‍💻 Development

### Launch the application

```bash
# Development server with ultra-fast Tailwind v4 watcher
./bin/dev

# Or start processes separately
rails server                    # Rails server
rails tailwindcss:watch        # Tailwind v4 watcher (microseconds)
```

### Essential Commands

```bash
# Asset compilation
rails tailwindcss:build        # Compile Tailwind CSS v4 (ultra-fast)
rails assets:precompile        # Full asset compilation

# Database
rails db:migrate               # Run migrations
rails db:reset                 # Reset with seed data

# Tests
rails test                     # Run test suite
rails test:system              # System tests

# Linting
bundle exec rubocop            # Ruby linting
```

### 🎯 JavaScript Architecture

```javascript
// app/javascript/controllers/navbar_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["mobileMenu", "profileMenu"];

  toggleMobile() {
    this.mobileMenuTarget.classList.toggle("hidden");
  }
}
```

## 📊 Database

### Model Structure

- **User** : Authentication with username (Devise)
- **Post** : Articles with score, type, and HackerNews metadata
- **Comment** : Hierarchical comments
- **Vote** : Voting system (upvote only)
- **Reaction** : Emoji reactions on comments

### Relationships

```ruby
# User model
has_many :posts, foreign_key: :author, primary_key: :username
has_many :comments, dependent: :destroy
has_many :votes, dependent: :destroy
has_many :voted_posts, through: :votes, source: :post

# Post model
belongs_to :author, class_name: 'User', foreign_key: :author, primary_key: :username
has_many :comments, dependent: :destroy
has_many :votes, dependent: :destroy

# Comment model
belongs_to :user
belongs_to :post
has_many :reactions, dependent: :destroy
```

## 🚀 Quick Start

### Prerequisites

- **Ruby 3.3.6+**
- **Rails 7.1+**
- **Node.js 18+** (for ImportMap and Stimulus)
- **PostgreSQL 15+**

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/your-username/hackernews-rails.git
   cd hackernews-rails
   ```

2. **Install dependencies**

   ```bash
   bundle install
   ```

3. **Setup database**

   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. **Start development server**

   ```bash
   ./bin/dev
   ```

5. **Visit the application**
   ```
   http://localhost:3000
   ```

## 📝 API Integration

This project fetches posts from the HackerNews API and allows users to:

- Vote on imported posts
- Add comments to posts
- React with emojis to comments

See [HackerNews API Documentation](https://github.com/HackerNews/API) for details.

## 🎨 Hacker News Styling

### Authentic Color Palette

```css
/* Official Hacker News colors */
--color-primary: #ff6600; /* Orange (255, 102, 0) */
--color-secondary: #828282; /* Gray for metadata */
--color-background: #f6f6ef; /* Beige background */
--color-text: #000000; /* Black text */
```

### Component Examples

```html
<!-- Upvote button with HN styling -->
<button class="btn-upvote">⬆ Upvote</button>

<!-- Primary action button -->
<button class="btn-primary">Submit</button>

<!-- Link with HN hover effect -->
<a href="#" class="link-primary">Read more</a>
```

## 🎯 Tailwind v4 vs v3

### Migration completed

```diff
- gem "tailwindcss-rails", "~> 2.7"   # v3
+ gem "tailwindcss-rails", "~> 4.2"   # v4

- config/tailwind.config.js            # No longer needed
+ app/assets/tailwind/application.css  # Native CSS config

- @tailwind base;                      # Old directives
- @tailwind components;
- @tailwind utilities;
+ @import "tailwindcss";               # Simple v4 import
```

### Performance improvements

- **v3 compilation** : ~500ms
- **v4 compilation** : ~33ms ⚡
- **Incremental builds** : microseconds

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 📚 Documentation

- [Tailwind v4 Migration](docs/tailwind_migration.md)
- [Tailwind v4 Features](docs/tailwind_v4_features.md)
- [Database Schema](docs/database_schema.md)

---

**Built with ❤️ using Rails 7 + Tailwind v4** | [HackerNews Original](https://news.ycombinator.com/)
