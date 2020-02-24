require 'pry'
require 'mechanize'

mechanize = Mechanize.new
page = mechanize.get 'https://banana.by/index.php'
sign_in_button = mechanize.current_page.link_with(class: 'sign_in')

binding.pry