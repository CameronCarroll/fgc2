
namespace :fgc do
  
desc "Generates taxonomy structure for website"
  task :gen do
    load_environment
    
    metacategory = Taxonomy.find_or_create_by_name "Metacategory"
    category = Taxon.find_or_create_by_name_and_parent_id_and_taxonomy_id("Category", metacategory.id, metacategory.id)
    accessories = Taxon.find_or_create_by_name_and_parent_id_and_taxonomy_id("Accessories", category.id, category.id)
    men = Taxon.find_or_create_by_name_and_parent_id_and_taxonomy_id("For Men", category.id, category.id)
    women = Taxon.find_or_create_by_name_and_parent_id_and_taxonomy_id("For Women", category.id, category.id)
    misc = Taxon.find_or_create_by_name_and_parent_id_and_taxonomy_id("Miscellenia", category.id, category.id)
    jewelry = Taxon.find_or_create_by_name_and_parent_id_and_taxonomy_id("Jewelry", women.id, category.id)
    Taxon.find_or_create_by_name_and_parent_id_and_taxonomy_id("Bridal", category.id, category.id)
    Taxon.find_or_create_by_name_and_parent_id_and_taxonomy_id("Necklaces", women.id, category.id)
    Taxon.find_or_create_by_name_and_parent_id_and_taxonomy_id("Bracelets", women.id, category.id)
    Taxon.find_or_create_by_name_and_parent_id_and_taxonomy_id("Earrings", women.id, category.id)
    Taxon.find_or_create_by_name_and_parent_id_and_taxonomy_id("Jewelry Sets", category.id, category.id)
   
   setting = Taxon.find_or_create_by_name_and_parent_id_and_taxonomy_id("Setting", metacategory.id, metacategory.id)
    Taxon.find_or_create_by_name_and_parent_id_and_taxonomy_id("For The Office", setting.id, setting.id)
    Taxon.find_or_create_by_name_and_parent_id_and_taxonomy_id("For The Bar", setting.id, setting.id)
     Taxon.find_or_create_by_name_and_parent_id_and_taxonomy_id("For The Wedding", setting.id, setting.id)
    end #task :generate_taxons
  

  desc "Raise an error unless the RAILS_ENV is development"
  task :development_environment_only do
    raise "Hey, development only you monkey!" unless RAILS_ENV == 'development'
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
    ]

  end
  
