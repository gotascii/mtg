require 'cgi'
require 'nokogiri'
require 'open-uri'

class Magiccards
  attr_accessor :doc

  API = "http://magiccards.info"
  CARD_URL = "/autocard.php?card="

  def self.url_for(url)
    "#{API}#{url}"
  end

  def self.card_url(name)
    url = CGI::escape(name)
    url_for("#{CARD_URL}#{url}")
  end

  def initialize(name)
    url = Magiccards.card_url(name)
    @doc = Nokogiri::HTML(open(url))
    found? ? true : false
  end

  def found?
    doc.search('h1').first.content != "no cards found"
  end

  def image_url
    imgs = doc.search('img').collect {|e| e.attributes["src"].value }
    url = imgs.select{|img| img =~ /\/scans.*/}.first
    Magiccards.url_for(url)
  end

  def type
    if info =~ /(^Land)|(^Basic Land)/
      "Land"
    elsif info =~ /^(\w+)\s*-/
      $1
    elsif info =~ /^(\w+),/
      $1
    end
  end

  def info
    doc.search('p').collect {|e| e.content }[6].strip
  end

  def colors
    c = cost.uniq.select{|c| c.to_i == 0 && c != 'X' }
    c << "N" if c.empty?
    c
  end

  def cost
    info =~ /,(.*)\(/
    c = $1.nil? ? '' : $1.strip
    c.scan(/./)
  end

  def cmc
    self.info =~ /\((.*)\)/
    $1.nil? ? 0 : $1
  end

  def expansion
    exp = doc.search('td')[3].content
    if exp == "Planechase"
      doc.search('a')[28].content.strip
    else
      exp
    end
  end
end