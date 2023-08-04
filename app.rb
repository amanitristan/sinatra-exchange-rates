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

@code = symbols.keys
index = 0


# STEP 3: Print out the the "code" value (which is the same as symbols.keys) for each currency.

#=begin -- Transfer code into homepage.erb using the ERB tags
@code.each do |the_code|
  pp "Convert 1 #{the_code} to..."
end
#=end


# STEP 4: Create a HOMEPAGE ROUTE for the list of possible conversions.

get("/") do
  erb(:homepage)
end


# STEP 5: Create a DYNAMIC ROUTE for all the possible conversions for each currency symbol.

get("/:first_symbol") do
  erb(:convert_x)
end

get("/:first_symbol/:second_symbol") do
  erb(:convert_xtox)
end
