# RailsLivejs

Update any ActiveRecord value as it gets updated in the database.

### Setup

Gemfile
```ruby
gem 'rails_livejs'
```

application.js
```ruby
//= require 'rails_livejs'
```

models/post.rb
```ruby
class Post < ActiveRecord::Base
	include RailsLivejs::ModelExtension
end
```

views/post/show.html.haml

```ruby
%h2 Post
=live :h3 @post, :title
=live :p @post, :body
```

Now open another page and change the post value you are watching at.
