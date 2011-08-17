class SiteHooks < Spree::ThemeSupport::HookListener
  require 'deface'
insert_before :inside_head, 'shared/styles'
replace :wholesale_index_signup, 'hooks/wholesale_signup'

end