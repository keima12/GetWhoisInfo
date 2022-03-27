require 'rubygems'
require 'sinatra'
require 'json'
require "sinatra/base"
require 'sinatra/reloader' if development?

require './GetWhoisInfo'
class MyApp < Sinatra::Base
  get '/get_whois_info' do
    dn = params['name']
    dn = [dn] if dn.instance_of?(String)
    wi = get_whois(dn)
    JSON.pretty_generate(wi)
  end
  not_found do
    '404 not found'
  end
end
