Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_payumoney'
  s.version     = '0.1'
  s.summary     = 'Spree integration with PayUmoney.'
  s.description = 'Spree integration with PayUmoney.'

  s.author    = 'Santosh Singh'
  s.email     = 'santosh.singh@freshmonk.com'
  s.homepage  = 'https://github.com/isantoshsingh/spree_payumoney'

  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 3.0'
  s.add_dependency 'offsite_payments'
end