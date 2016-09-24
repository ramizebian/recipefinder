class Recipe 
  include HTTParty

  default_options.update(verify: false) # Turn off SSL verification
  key_value = ENV['67d929f333d411596b63e7c79fea3382']
  hostport = ENV['www.food2fork.com:80'] || 'www.food2fork.com'
  base_uri "http://#{hostport}/api/search"
  default_params key: key_value
  format :json

  def self.for term
    get("", query: { q: term})["recipes"]
  end
end

