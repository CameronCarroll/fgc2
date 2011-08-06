
namespace :fgc do
  
  desc "Raise an error unless the RAILS_ENV is development"
  task :development_environment_only do
    raise "Hey, development only, for thine monkey!" unless RAILS_ENV == 'development'
  end

  desc "Drop, create, migrate then seed the development database"
  task :seed => [
    'environment', 
    'fgc:development_environment_only', 
    'db:drop', 
    'db:bootstrap', 
    'db:migrate', 
    'spree_wholesale:create_role',
    'spree_distribution:create_role',
    'fgc:gen_cat',
    'fgc:gen_options'
    ]

  end #namespace fgc
  
