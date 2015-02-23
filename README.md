# Dummy forum app #learning

## Features
- Users can create posts
  - they can modify only their posts  
- Everyone can comment posts
- recaptcha
- WYSIWYG editor
- Authors can ban comments on their posts  
- Everyone can see user profiles
  - In the user profile everyone can see user's last activities: posts and comments

## Setup
Add your recaptcha keys to `/config/initializers/recaptcha.rb`

## TODO
- add Categories to posts (tree-categories)
- Improve UX: 
  - ban comments via axaj
  - require recaptcha field (client-side check)