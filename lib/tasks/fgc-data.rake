namespace :fgc do
  
    #// Gen options generates the option value categories and presentations.
    desc "Generates option types"
    task :gen_options do
    load_environment
    #// DATA GOES HERE!
    #//############################
    option_types = {
    'color' => 'Color',
    'swatch' => 'Swatch',
    'type' => 'Type',
    'size' => 'Size',
    'shape' => 'Shape',
    'cord' => 'Chain or Cord',
    'silhouette' => 'Silhouette'
    }

    option_hash = {
      'color' => {
      'pink' => 'Pink',
      'blue' => 'Blue',
      'purple' => 'Purple',
      'green' => 'Green',
      'gold' => 'Gold',
      'black' => 'Black',
      'yellow' => 'Yellow',
      'copper' => 'Copper',
      'red' => 'Red'
      },
      'type' => {
    'clipon' => 'Clip-On',
    'dropon' => 'Drop-On',
    'button' => 'Button',
    'claw' => 'Lobster-claw Clasp',
    'toggle' => 'Toggle Clasp'
    },
    'size' => {
    'tiny' => 'Tiny',
    'small' => 'Small',
    'medium' => 'Medium',
    'large' => 'Large',
    },
    'shape' => {
    'rectangle' => 'Rectangle',
    'circle' => 'Circle',
    },
    'cord' => {
    'sschain' => 'Sterling Silver Chain',
    'suedecord' => 'Faux Suede Cord',
    'leathercord' => 'Faux Leather Cord',
    },
    'silhouette' => {
    'butterfly' => 'Butterfly',
    'dove' => 'Dove in Flight',
    'dolphin' => 'Dolphin',
    'angel' => 'Angel Wings',
    },
    'swatch' => {
    'tst' => 'Test Swatch'
    }
      }#end option_hash
        #// DATA ENDS HERE
        #//##############################


option_types.each do |key, value|    
temp_option_type = OptionType.find_or_create_by_name_and_presentation(key, value)     
  option_hash[key].each do |k, v|
    OptionValue.find_or_create_by_name_and_presentation_and_option_type_id(k, v, temp_option_type.id)
 end
end
  end #task :gen_options
  


    desc "Generates taxonomy structure for website"
  task :gen_cat do
    
    category = Taxonomy.find_or_create_by_name "Category"
    accessories = Taxon.find_or_create_by_name_and_parent_id_and_taxonomy_id("Accessories", category.id, category.id)
    men = Taxon.find_or_create_by_name_and_parent_id_and_taxonomy_id("For Men", category.id, category.id)
    women = Taxon.find_or_create_by_name_and_parent_id_and_taxonomy_id("For Women", category.id, category.id)
    misc = Taxon.find_or_create_by_name_and_parent_id_and_taxonomy_id("Miscellenia", category.id, category.id)
    jewelry = Taxon.find_or_create_by_name_and_parent_id_and_taxonomy_id("Jewelry", women.id, category.id)
    bridal = Taxon.find_or_create_by_name_and_parent_id_and_taxonomy_id("Bridal", category.id, category.id)
    necklaces = Taxon.find_or_create_by_name_and_parent_id_and_taxonomy_id("Necklaces", women.id, category.id)
    bracelets = Taxon.find_or_create_by_name_and_parent_id_and_taxonomy_id("Bracelets", women.id, category.id)
    earrings = Taxon.find_or_create_by_name_and_parent_id_and_taxonomy_id("Earrings", women.id, category.id)
    sets = Taxon.find_or_create_by_name_and_parent_id_and_taxonomy_id("Jewelry Sets", category.id, category.id)
    cords = Taxon.find_or_create_by_name_and_parent_id_and_taxonomy_id("Cords & Chains", misc.id, category.id)
    keys = Taxon.find_or_create_by_name_and_parent_id_and_taxonomy_id("Key Rings", misc.id, category.id)
    dishes = Taxon.find_or_create_by_name_and_parent_id_and_taxonomy_id("Dishes", misc.id, category.id)
    clocks = Taxon.find_or_create_by_name_and_parent_id_and_taxonomy_id("Timekeeping", accessories.id, category.id)
     office = Taxon.find_or_create_by_name_and_parent_id_and_taxonomy_id("For the Office", accessories.id, category.id)
     men = Taxon.find_or_create_by_name_and_parent_id_and_taxonomy_id("For the Bar", accessories.id, category.id)
end #task :generate_taxons
  
  
end #namspace :fgc