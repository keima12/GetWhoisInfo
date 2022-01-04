require 'rubygems'
require 'sinatra'
require 'json'

require './GetWhoisInfo'
get '/get_whois_info' do
  dn = params['name']
  dn = [dn] if dn.instance_of?(String)
  wi = get_whois(dn)
  JSON.pretty_generate(wi)
end
