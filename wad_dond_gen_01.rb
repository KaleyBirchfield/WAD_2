# Ruby code file - All your code should be located between the comments provided.

# Main class module
module DOND_Game
  # Input and output constants processed by subprocesses. MUST NOT change.
  GOES = 5

  class Game
    attr_reader :sequence, :selectedboxes, :openedboxes, :chosenbox, :selectedbox, :turn, :input, :output, :winner, :played, :wins, :losses, :guess, :values, :amounts
    attr_writer :sequence, :selectedboxes, :openedboxes, :chosenbox, :selectedbox, :turn, :input, :output, :winner, :played, :wins, :losses, :guess, :values, :amounts

    def initialize(input, output)
      @input = input
      @output = output
    end

    def getinput
      s = @input.gets
      puts s
      x = s.chomp
      puts x
      y = x.upcase
      puts y
      y
    end

    def storeguess(guess)
      if guess != ""
        @selectedboxes = @selectedboxes.to_a.push "#{guess}"
      end
    end

    # Any code/methods aimed at passing the RSpect tests should be added below.

    def start
      @output.puts "Welcome to Deal or No Deal!"
      @output.puts "Designed by: #{created_by}"
      @output.puts "StudentID: #{student_id}"
      @output.puts "Starting game..."
    end

    def created_by
      studentname = "Jakub Kuncak & Kaley Birchfield"
      return studentname
    end

    def student_id
      studentId = "51769065, 51767255"
      return studentId
    end

    def displaymenu 	#show menu to choose from
      @output.puts "Menu: (1) Play | (2) New | (3) Analysis | (9) Exit"
    end

    def resetgame		#restart the key collectors values
      @output.puts "New game..."
      @sequence = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
      @selectedboxes = []
      @openedboxes = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
      @chosenbox = 0
      @selectedbox = 0
      @turn = 0
      @winner = 0
      @played = 0
      @wins = 0
      @losses = 0
      @guess = ""
      @values = [0.01,0.10,0.50,1.00,5.00,10.00,50.00,100.00,250.00,500.00,750.00,1000.00,3000.00,5000.00,10000.00,15000.00,20000.00,35000.00,50000.00,75000.00,100000.00,250000.00]
      @amounts = values
    end

    def assignvaluestoboxes				#randomly put value to boxes (when initiating game)
      @sequence = @values
      @sequence.shuffle!				#might need to reference? (ruby-doc.org array html)
    end


    def showboxes						#list boxes w/ their status
      for i in 0..21 do
        g = ""
        b = i + 1

        if b == @chosenbox			#case - box chosen
          g = "*#{b}*"
        elsif @selectedboxes	.include?(b)				#case - opened
          g = "|#{b}|"
        else         #case - closed
          g = "[#{b}]"
        end
        @output.print "#{g} "
      end
    end

    def showamounts						#produces 2 columns with the values in ascending order
      c1 = ""
      c2 = ""
      for i in 0..10 do
        c1 = sequence[i]
        c2 = sequence[i + 11]
        @output.puts "#{c1}   #{c2}"
      end
    end

    def removeamount(value)				#replace a value with big space
      @sequence[value] = "----"
    end

    def setchosenbox(b)					#b - user input, to mark a box as chosen
      @chosenbox = b.to_i
    end

    def getchosenbox 					#to return chosen box to work with
      return @chosenbox
    end

    def displaychosenbox
      @output.puts "Chosen box: [#{getchosenbox}]"
    end

    def displaychosenboxvalue
      @output.puts "Chosen box: [#{getchosenbox}] contains: #{sequence[getchosenbox-1]}"
    end

    def displaychosenboxprompt
      @output.puts "\nEnter the number of the box you wish to keep."
    end

    def displaychosenboxerror
      @output.puts "Error: Box number must be 1 to 22."
    end

    def displayanalysis
      @output.puts "Game analysis..."

      s = ""
      g = ""
      for i in (0..21) do
        b = i + 1
        if @openedboxes[i] == 0
          s = "Closed"
          g = "[#{b}]"
        else
          s = "Opened"
          g = "|#{b}|"
        end
        @output.puts "#{g} Status: #{s}"
      end
    end

    def boxvalid(box)
      guess = box.to_i
      if guess > 0 && guess <= 22
        valid = 0
      else
        valid = 1
      end
    end

    def showselectedboxes
      @output.puts "Log: #{selectedboxes}"
    end

    def displayselectboxprompt
      @output.puts "\nEnter the number of the box you wish to open. Enter returns to menu."
    end

    def openbox(guess)
      box = guess.to_i
      index = @sequence[box]
      @output.puts "Value in box: #{index}"
      @selectedboxes.push(box)
      removeamount(box)
    end

    def bankerphoneswithvalue(offer)
      @output.puts "Banker offers you for your chosen box: #{offer}"
    end

    def bankercalcsvalue
      value = rand(2..100000)
      offers = value / 2
      bankerphoneswithvalue(offers)
    end

    def dealornodealprompt
      @output.puts "Do you accept this offer?"
      end

    def dealornodealresponse(answer)
      if answer == "yes"

      end
    end

    def numberofboxesclosed
      num = 0
      for i in 0..21
        if @openedboxes[i] == 0
          num = num + 1
        end
      end
      return num
    end

    def incrementturn
      @turn = @turn + 1
    end

    def getturnsleft
      goes = 5
      turnsleft = goes - @turn
    end

    def finish
      @output.puts "... game finished."
    end

    # Any code/methods aimed at passing the RSpect tests should be added above.

  end
end





























