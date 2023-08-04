require "sinatra"
require "sinatra/reloader"

# STEP 1: Create variable for API endpoint that returns all available currencies. And pull information from that variable.

require "http"

currency_api ="https://api.exchangerate.host/symbols"

resp = HTTP.get(currency_api)
#pp resp.to_s
raw_response = resp.to_s

# STEP 2: Convert string to JSON and parse out the needed information (all available currency symbols).

require "json"

parsed_response = JSON.parse(raw_response)
#pp parsed_response

symbols = parsed_response.fetch("symbols")
#pp symbols.keys

code = symbols.keys
index = 0

# STEP 3: Print out the the "code" value (which is the same as symbols.keys) for each currency.

=begin -- Transfer code into homepage.erb using the ERB tags
code.each do |@the_code|
  pp @the_code
end
=end

# HOMEPAGE ROUTE

get("/") do
  require

  erb(:homepage)
end
