require "uri"
require "net/http"
require "json"


def request (url, apikey)
    url = URI(url+ "&api_key=" +apikey)
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    request = Net::HTTP::Get.new(url)
    response = https.request(request)
    body = JSON.parse response.read_body
    return body
end


File.write("DB.data", request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=10","Ws49DifG1VJTlnGNoatowCbofaiWNwkaJVB1A8EZ"))
