$:.unshift File.expand_path "."
require 'spec_helper'


describe "Problem 1:" do
  it "http://superstar.admin.com should return 200 status" do
     response = request_to_superstar
     response.code.to_i.should be_equal(200)
     response.body.should match("Awesome!")
  end

  ip_list_file = File.open("/challenges/ip_list.txt")
     ips = ip_list_file.readlines
     ips = ips.collect {|n| n.strip}
     ips.each do |ip|
       it "should not allow traffic from blocked IP addresses (#{ip})" do
         cmd ="(hping3  -S --count 1 -a #{ip} -i eth0 -p 80 -q  superstar.admin.com ) 2>&1 | grep \"packet loss\" | cut -d\, -f3"
         `#{cmd}`.should match("100% packet loss")
       end
  end
end
