class Game
    @@board=Array.new(9)
    attr_accessor:board
    def initialize
        @player1=Player.new('X')
        loop do
            @player2=Player.new('O')
            if @player1.name != @player2.name 
                break
            end
            puts "Nome già scelto!"
        end
    end
    @@board[0]='X'
    def print_board
        @@board.each_with_index do |symbol, index| 
            print "[#{symbol.nil? ? index : symbol}]"
            if (index+1)%3==0
                puts "","----+-----+----"
            else
                print" | "
            end
        end
    end
end

class Player
    def initialize(symbol)
         puts "Seleziona il nome per il giocatore #{symbol} "
         @name=gets.chomp
         @symbol=symbol
    end
    attr_reader:symbol
    attr_reader:name
end

Game.new.print_board