class Recipe 
  include HTTParty

  default_options.update(verify: false) # Turn off SSL verification
  
  key_value = "67d929f333d411596b63e7c79fea3382"
  hostport = "www.food2fork.com"

  ENV['FOOD2FORK_KEY'] = key_value
  ENV['FOOD2FORK_SERVER_AND_PORT'] = hostport

  base_uri "http://#{hostport}/api/search"
  default_params key: "67d929f333d411596b63e7c79fea3382"
  format :json

  def self.for term
    get("", query: { q: term})["recipes"]
  end
end

