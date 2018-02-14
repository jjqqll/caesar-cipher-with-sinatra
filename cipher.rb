require "sinatra"
require "sinatra/reloader" if development?
require "erb"

def caesar_cipher(str, num)
  num = num.to_i
  str = "" if str == nil
  str.split("").collect do |char|
    if char.match(/[a-z]/) && char.ord + num > "z".ord
      (char.ord - 26 + num).chr
    elsif char.match(/[a-z]/) && char.ord + num <= "z".ord
      (char.ord + num).chr
    elsif char.match(/[A-Z]/) && char.ord + num > "Z".ord
      (char.ord - 26 + num).chr
    elsif char.match(/[A-Z]/) && char.ord + num <= "Z".ord
      (char.ord + num).chr
    else
      (char)
    end
  end.join
end

get '/' do
  @string = params[:string]
  @num = params[:num]
  @output = caesar_cipher(@string, @num)
  erb :index, layout: :main
end
