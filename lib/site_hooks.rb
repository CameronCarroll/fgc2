class SiteHooks < Spree::ThemeSupport::HookListener
  
insert_before :inside_head, 'shared/styles'

end