if Spree::Config.instance
Spree::Config.set :site_name => "Fusion Glass Company EStore"
Spree::Config.set :logo => "fgc_banner.png"
Spree::Config.set(:allow_ssl_in_development_and_test => false)
Spree::Config.set(:allow_ssl_in_production => true)
end