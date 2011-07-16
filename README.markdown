FusionGlass Co --- Ecommerce website
Cameron Carroll
July 2011

Language & Framework Information:

Spree (Ecommerce framework) running upon Ruby on Rails (Web framework.)

Code maintenance information:

If unfamiliar with Rails, maintenance of this site will be a bit tricky. A reasonable knowledge of Ruby
syntax is needed, along with the correct development environment.
The code sits, currently, in the github repository and also in the Heroku repository. In order to update
the production website, you must push the changes to Heroku git repo.

 --- What's the correct development environment?
use the googles to install the following:
1. Install ruby (1.9 or higher preferably)
2. Install rubygems
3. Install mySQL (development database)
4. Use a text editor with ruby (or even better, rails) syntax highlighting and structuring. Redcar, SciTE,
textmate, et cetera. Or opt for a full rails IDE (netbeans, radrails)
5. use rubygems to install rails [gem install rails]
6. Install git
6. use rubygems to install taps [gem install taps] (you need to install sqlite3 for this to work.)
7. rubygems to install heroku
8. rubygems to install bundler

[this explains how to push spree applications up to heroku, but this plugin is already in gemfile]
https://github.com/lukewendling/spree-heroku

 --- What do I edit?

I anticipate that you'll probably want to change visual elements and/or update hard-coded menus. I don't
have the time or willpower to learn how to automatically fill the dropdown lists from taxon structure,
so I just hard-coded it and pointed the links to the structure created in production database. The files
you're going to want to change are:

[This contains the dropdown menu structure in html lists. You can edit them freely, just remember that you
have to point it at the taxon structure's permalink.]
app/views/shared/_nav_list.html.erb

[stylesheets for front-end]
app/public/stylesheets/site.css & screen.css