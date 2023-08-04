require "sinatra"
require "sinatra/reloader"
require "http"
require "json"

# STEP 3: Print out the the "code" value (which is the same as symbols.keys) for each currency.

# STEP 4: Create a HOMEPAGE ROUTE for the list of possible conversions.

get("/") do
  # STEP 1: Create variable for API endpoint that returns all available currencies. And pull information from that variable.

  currency_api = "https://api.exchangerate.host/symbols"

  resp = HTTP.get(currency_api)
  #pp resp.to_s
  raw_response = resp.to_s

  # STEP 2: Convert string to JSON and parse out the needed information (all available currency symbols).

  parsed_response = JSON.parse(raw_response)
  #pp parsed_response

  symbols = parsed_response.fetch("symbols")
  #pp symbols.keys

  @code = symbols.keys

  erb(:homepage)
end

# STEP 5: Create a DYNAMIC ROUTE for all the possible conversions for each currency symbol.

get("/:first_symbol") do
  @first_symbol = params.fetch("first_symbol")

  currency_api = "https://api.exchangerate.host/symbols"

  resp = HTTP.get(currency_api)
  #pp resp.to_s
  raw_response = resp.to_s

  # STEP 2: Convert string to JSON and parse out the needed information (all available currency symbols).

  parsed_response = JSON.parse(raw_response)
  #pp parsed_response

  symbols = parsed_response.fetch("symbols")
  #pp symbols.keys

  @code = symbols.keys


  erb(:convert_x)
end


get("/:first_symbol/:second_symbol") do
  @first_symbol = params.fetch("first_symbol")
  @second_symbol = params.fetch("second_symbol")

  exchange_rate = "https://api.exchangerate.host/convert?from=#{@first_symbol}&to=#{@second_symbol}"

  resp = HTTP.get(exchange_rate)
  #pp resp.to_s
  raw_response = resp.to_s

  # STEP 2: Convert string to JSON and parse out the needed information (all available currency symbols).

  parsed_response = JSON.parse(raw_response)
  #pp parsed_response

  info = parsed_response.fetch("info")
  #pp info.keys

  rate = info.fetch("rate")
  @rate = rate.to_s

  erb(:convert_xtox)
end
