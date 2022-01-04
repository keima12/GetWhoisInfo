require 'rubygems'
require 'simpleidn'
require 'whois-parser'
require 'public_suffix'
require 'date'
require 'pp'

# サブドメインを除いたドメイン名を取得する
def get_domain_name(domain_name)
  PublicSuffix.domain(domain_name)
end

# whois情報から必要な情報を取得する。
def get_whois_info(domain_name)
  record = Whois.whois(domain_name)
  parser = record.parser
  r = {
    'domainname' => domain_name,
    'status' => parser.status,
    'expires_on' => parser.expires_on
  }
  r
end

# 入力されたドメイン名のリストに対応するwhois情報を取得する。
def get_whois(domain_names)
  r = []
  domain_names.each do |domain_name|
    dn = get_domain_name(domain_name)
    wi = get_whois_info(dn)
    r.push(wi)
  end
  r
end

# 
def main
  r = get_domain_name("www.google.o.jp")
  PP.pp r
  r = get_whois_info(r)
  PP.pp r
end

if __FILE__ == $0
  main
end