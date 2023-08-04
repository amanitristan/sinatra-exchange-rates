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
#pp symbols

# STEP 3: Parse out the the "code" for each cyrrency symbol




# HOMEPAGE ROUTE

get("/") do
  require

  erb(:homepage)
end
