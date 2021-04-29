LINES = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
class Game
    def initialize
        @board=Array.new(9)
        @player1=Player.new('X')
        loop do
            @player2=Player.new('O')
            if @player1.name != @player2.name 
                break
            end
            puts "Nome già scelto!"
        end
    end
    attr_accessor:board
    #@board[0]='X'
    def print_board 
        @board.each_with_index do |symbol, index| 
            print "[#{symbol.nil? ? index : symbol}]"
            if (index+1)%3==0
                puts "","----+-----+----"
            else
                print" | "
            end
        end
    end
    def cell_selection(player)
        puts "#{player.name} sceglie la casella"
        n=gets.chomp.to_i
        if(@board[n].nil? && 0<=n && n<=8)
            @board[n]=player.symbol
        else 
            puts "Casella non disponibile!"
            cell_selection(player)
        end
    end
    def has_win?(player)
        LINES.any? do |line|
            line.all? do |position|
                @board[position]==player.symbol   
            end
        end
    end
    def has_free_space?
        @board.any? do |cell|
            cell.nil?
        end
    end
    def play
        currentPlayer=@player1
        while (has_free_space?) do
            print_board
            cell_selection(currentPlayer)
            if has_win?(currentPlayer)
                puts "#{currentPlayer.name} complimenti hai vinto!"
                break
            end
            currentPlayer=(currentPlayer==@player1) ? @player2 : @player1
        end
        print_board
        if !(has_free_space?) 
            puts "PAREGGIO!"
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

Game.new.play