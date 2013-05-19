require 'rspec'
require 'net/http'


def request_to_superstar
     url = URI.parse('http://superstar.admin.com/')
     req = Net::HTTP::Get.new(url.path)
     res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
     }
     res
end
