if Spree::Config.instance
Spree::Config.set :site_name => "Fusion Glass Company"
Spree::Config.set :logo => "fgc_banner.png"
Spree::Config.set(:allow_ssl_in_development_and_test => false)
Spree::Config.set(:allow_ssl_in_production => true)
Spree::Config.set(:products_per_page => 20)
Spree::Config.set(:admin_products_per_page => 20)
Spree::Config.set(:admin_interface_logo => "fgc_banner.png")
end