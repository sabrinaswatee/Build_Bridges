# Build Bridges

### Technologies used:
  1. HTML
  2. CSS
  3. Ruby
  4. Sinatra
  5. Activerecord
  6. SQL


### Approach taken:
~ HTML ~
  * Start by writing doctype and linking the HTML file to css in layout.erb
  * The <body> of HTML is broken is 3 parts, <header>, <main>, and <footer>
  * Most of the html is written in the .erb files
  * <form> and <a> tags are used for routing between .erb and .rb files

~ CSS ~
  * The layout page is connected to main.css
  * Added some styles for the tags written in layout.erb and also for tags linked by ruby from other .erb files

~ Ruby ~
  * The ruby codes within the .erb files are written in <% %> and <%= %>
  * Most of the ruby code in written in main.rb files
  * This file is responsible for getting and sending routes to different .erb files and deploying them
  * It includes all four routes GET, POST, PATCH, and DELETE

~ Sinatra ~
  * Produce sinatra application using `sinatra new app_name -va`
  * Several gems are used such as sinatra-reloader and sinatra-flash

~ Activerecord~
  * This is used in main.rb file
  * Create console.rb, db_config.rb to connect to databse and incule all models
  * Create files under models folder with table names (singular)

~ SQL ~
  * Create a .sql file
  * Include in it sql codes to create tables
  * The sql needs to be pasted on the terminal and having created a database using `create database db_name`


### Installation Instruction:
  1.  Crate a new repository on personal github  
  2.  Add the folder containing the game files (html, css, js) to the repository by
       * Go into the directory of the folder, type `git init` to create an empty git
       repository,
       * Add the origin, `git remote add origin address`
  3.  List all the gems used in the project in Gemfile and save
  4.  Install bundler `gem install bundler` and enter `bundler` to create a Gemfile.lock file
  5.  In db_config.rb file change from "ActiveRecord::Base.establish_connection(options)"
      to "ActiveRecord::Base.establish_connection(ENV('DATABASE_URL') || options)"
  6.  Comment out in all files "require sinatra/reloader", "require pry", and "binding.pry"
  7.  Take a databse dump `pg_dump -Fc --no-acl --no-owner -h localhost -U <db_username> <db_name> > db.dump`
      This should create a new file called db_dump
  8.  Add and commit the folder, `git add -A` and `git commit -m 'comment'`
  9.  Push the files from local to github repository, `git push origin master`
  10. Install heroku by typing the following in terminal
        * `sudo add-apt-repository "deb https://cli-assets.heroku.com/branches/stable/apt ./"`
        * `curl -L https://cli-assets.heroku.com/apt/release.key | sudo apt-key add -`
        * `sudo apt-get update`
        * `sudo apt-get install heroku`
  11. Copy the url to database db_dump on github
  12. Restore the dump on production `heroku pg:backups:restore '<URL_to_database_on_github>' DATABASE_URL`
  14. `heroku create`
  13. Push the files to heroku `git push heroku master`
  15. `heroku apps`
  16. `heroku open`


### Unsolved problems:
  * Personality search is incomplete
  * Some routes were not connected properly, hence have some codes being repeated
  * Include a link to take back to previous page
  * Better CSS styles
  * Would have like to have an error message pop up and disappear, flsh error is not suitable for that


### How to use:
  * Organizations can do the following
     - Create an account
     - Login and logout
     - Add post openings
     - Edit posts
     - Remove enquiries by clicking resolve
  * Anyone can
     - Search for posts by selecting options provided
     - Visit organizations profiles from search page
     - Submit an enquiry
  * Does not allow creation of two accounts with same email
  * Does not allow log in without proper email and password combination
