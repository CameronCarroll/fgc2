class SiteHooks < Spree::ThemeSupport::HookListener
  
#insert_before :inside_head, 'shared/styles'
Deface::Override.new(:virtual_path => 'layouts/spree_application',
                      :name => 'stylesheets',
                      :insert_before => "[data-hook='inside_head']",
                      :partial => "shared/_styles")
                  
#replace :wholesale_index_signup, 'hooks/wholesale_signup'
Deface::Override.new(:virtual_path => 'wholesalers/index',
                      :name => 'wholesale_signup_text',
                      :replace => "[data-hook='wholesale_index_signup']",
                      :partial => "hooks/_wholesale_signup")
end