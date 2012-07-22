# Weather
# Reads the argument from command line
# And returns the weather for the location
argv = require('optimist').argv
http = require('http')
xml2js = require('xml2js')

parser = new xml2js.Parser()

location = argv._[0]
query = "?weather=#{location}"

requestOptions =
  host: 'www.google.com'
  port: 80
  path: "/ig/api#{query}"
  method: 'GET'

req = http.request(requestOptions)
req.end()

req.on 'response', (response) ->
  response.setEncoding('utf-8')
  response.on 'data', (chunk) ->
    parser.parseString chunk, (err, result) ->
      console.log(result)