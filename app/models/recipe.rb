class Recipe 
  include HTTParty

  default_options.update(verify: false) # Turn off SSL verification
  
  ENV['FOOD2FORK_KEY'] = "67d929f333d411596b63e7c79fea3382"
  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'

  base_uri "http://#{hostport}/api/search"
  default_params key: ENV['FOOD2FORK_KEY']
  format :json

  def self.for term
    get("", query: { q: term})["recipes"]
  end
end

