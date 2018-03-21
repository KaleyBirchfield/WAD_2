# Ruby code file - All your code should be located between the comments provided.

# Add any additional gems and global variables here
require 'sinatra'
require 'data_mapper'
require 'io/console'
DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/wiki.db")
class User
  include DataMapper::Resource
  property :id, Serial
  property :username, Text, :required => true
  property :password, Text, :required => true
  property :date_joined, DateTime
end

DataMapper.finalize.auto_upgrade!

set :port, 9001

helpers do
  def protected!
    if authorized?
      return
    end
    redirect '/denied'
  end
  def authorized?
    if $credentials != nil
      @Userz = User.first(:username => $credentials[0])
      if @Userz
        return true
      else
        return false
      end
    else
      return false
    end
  end
end
# The file where you are to write code to pass the tests must be present in the same folder.
# See http://rspec.codeschool.com/levels/1 for help about RSpec
require "#{File.dirname(__FILE__)}/wad_dond_gen_01"

# Main program
module DOND_Game
  # @input = STDIN
  # @output = STDOUT
  @input = IO.pipe
  @output = IO.pipe
  g = Game.new(@input, @output)
  playing = true
  input = ""
  menu = ""
  guess = ""
  box = 0
  turn = 0
  win = 0
  deal = 0
  @output.puts "\n" + '-------------------------------------------------------------------------' + "\n"
  @output.puts "\n" + 'Enter "1" runs game in command-line window or "2" runs it in web browser.' + "\n"
  @output.puts "\n" + '-------------------------------------------------------------------------' + "\n"
  game = @input.gets.chomp
  if game == "1"
    @output.puts "\nCommand line game.\n"
  elsif game == "2"
    @output.puts "\nWeb-based game.\n"
  else
    @output.puts "\nInvalid input! No game selected.\n"
    exit
  end

  if game == "1"

    # Any code added to command line game should be added below.

    g.start
    g.resetgame
    g.assignvaluestoboxes
    g.showboxes

    g.displaychosenboxprompt
    g.setchosenbox(g.getinput)
    g.displaychosenbox
    while g.selectedboxes.size < 20 do
      g.showamounts
      g.showboxes
      g.displayselectboxprompt
      g.openbox(g.getinput)
    end
    g.finish
    @output.puts "\n"			#start + reset + new line ; MIGHT NEED TO REFERENCE


#		g.finish				# calls finish method

# Any code added to command line game should be added above.

    exit	# Does not allow command-line game to run code below relating to web-based version
  elsif game == 2

# End modules

# Sinatra routes

# Any code added to web-based game should be added below.


    get '/' do
      erb :home
    end
  end
end