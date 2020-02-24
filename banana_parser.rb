require 'pry'
require 'mechanize'
require 'rspec'

class BananaParser
  def initialize
    mechanize = Mechanize.new
    @page = mechanize.get 'https://banana.by/index.php'
    @sign_in_button = @page.link_with(class: 'sign_in')
  end

  def call
    sign_in
    parser
  end

  def sign_in
    if !@sign_in_button.nil?
      form = @page.forms[0]
      form.field_with(name: 'login_name').value = 'VPG'
      form.field_with(name: 'login_password').value = '123456'
      @page = form.submit
    end
  end

  def parser
    result = []
    while !(next_button = @page.link_with(class: 'next')).href.nil?
      result << @page.search('span.mp_name').to_a.map{ |x| x.children.to_a[0].content }
      @page = next_button.click
      ######
      break if next_button.href == 'https://banana.by/index.php?cstart=3&'
      ######
    end

    puts result.flatten
  end
end


banana = BananaParser.new
banana.call

# tests = RSpec.describe 'BananaParser' do
#   before do
#     let(:page) { Mechanize::Page.new }
#     let(:sign_in_button) { Mechanize::Page::Link.new('', '', '') }
#   end

#   content 'sign_in' do
#     it '' do
#       banana = BananaParser.new
#       expect(banana.sign_in).to eq(false)
#     end
#   end
# end

# puts tests.run 
