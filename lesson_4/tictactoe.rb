require 'pry'

INTIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
PLAYERS = { 'player' => PLAYER_MARKER, 'computer' => COMPUTER_MARKER }.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]] # diagonals
WIN_GAME_NUMBER = 5
@games_played ||= 0

def prompt(text)
  puts "=> #{text}"
end

# rubocop:disable Metrics/LineLength
def joinor(ary, delimiter = ', ', word_nexus = 'or')
  "#{ary[0...-1].join(delimiter)} #{word_nexus unless ary.size == 1} #{ary.last}"
end
# rubocop:enable Metrics/LineLength

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_board(brd)
  unless brd.values == (1..9).to_a
    puts " you are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  end
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def initialize_board
  new_board ||= {}
  (1..9).each { |num| new_board[num] = INTIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INTIAL_MARKER }
end

def choose_first_random_player
  PLAYERS.values.sample
end

def place_piece!(brd, current_player)
  if current_player == PLAYER_MARKER
    pick_player_piece!(brd)
  else
    pick_computer_piece!(brd)
  end
end

def alternate_player(current_player)
  current_player == PLAYER_MARKER ? COMPUTER_MARKER : PLAYER_MARKER
end

def pick_player_piece!(brd)
  square = ''
  loop do
    prompt "choose position to place a piece (#{joinor(empty_squares(brd))})"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt 'Please, choose a valid choice'
  end
  brd[square] = PLAYER_MARKER
end

def current_player_close_to_win(brd)
  WINNING_LINES.each do |line|
    line_eval = brd.values_at(*line)
    # *line = line[0], line[1], line[2] ('*' splat operator)
    if line_eval.count(COMPUTER_MARKER) == 2 && line_eval.include?(" ")
      return PLAYERS.key(COMPUTER_MARKER)
    elsif line_eval.count(PLAYER_MARKER) == 2 && line_eval.include?(" ")
      return PLAYERS.key(PLAYER_MARKER)
    end
  end
end

def computer_react(brd)
  WINNING_LINES.each do |line|
    line_eval = brd.values_at(*line)
    PLAYERS.each_value do |player|
      if line_eval.count(player) == 2 && line_eval.include?(" ")
        Hash[line.zip(line_eval)].select { |k, v| return k if v == " " }
      end
      nil
    end
  end
end

def starts_computer?(brd)
  if brd.values.all? { |items| items == ' ' }
    prompt "press enter to continue"
    gets.chomp
  end
end

def pick_computer_piece!(brd)
  starts_computer?(brd)

  someone_close_to_win = current_player_close_to_win(brd)
  square = 0
  PLAYERS.each_key do |some_player|
    # first computer attack
    if someone_close_to_win == some_player
      square = computer_react(brd)
    end
  end

  if square.nil? || square.zero?
    square = brd[5] == " " ? 5 : empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end

def localization_square_board
  localize_squares = {}
  (1..9).each { |k| localize_squares[k] = k }
  display_board(localize_squares)
end

def show_position_num
  localization_square_board
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
  # when detect_winner(brd) not false || true, will be nil!
  # Then we use  double bang bang(!!). Then will return a boolean.
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'computer'
    end
  end
  nil
end

def clear_screen
  system('clear') || system('cls')
end

def detect_final_winner(final_winner = '')
  @win_times.take(2).select { |k, v| final_winner = k if v >= 5 }
  final_winner
end

def continue_playing
  prompt "Do you want to play again? (y or n)"
  gets.chomp
end

def game_winner
  final_winner = detect_final_winner(final_winner)
  if final_winner == 'player' || final_winner == 'computer'
    puts '======='
    prompt "Later #{WIN_GAME_NUMBER} wins..."
    prompt "#{final_winner.upcase} IS THE FINAL WINNER!"
    puts '======='
  end
end

def winning_game
  prompt "You won #{@win_times['player']} times."
  prompt "Computer #{@win_times['computer']} times."
  prompt "#{@win_times['tie']} ties. Total games played: #{@games_played}"
  prompt "press enter to continue"
  gets.chomp
end

def show_win_times
  @games_played += 1
  @win_times ||= { 'player' => 0, 'computer' => 0, 'tie' => 0 }
  if @winner == 'player'
    @win_times['player'] += 1
  elsif @winner == 'computer'
    @win_times['computer'] += 1
  else
    @win_times['tie'] += 1
  end
  winning_game
end

def reset_game
  @win_times = { 'player' => 0, 'computer' => 0, 'tie' => 0 }
  @games_played = 0
end

loop do
  board = initialize_board
  show_position_num
  if @winner.nil? || board_full?(board)
    current_player = choose_first_random_player
  else
    current_player = @winner
    current_player = alternate_player(current_player)
    @winner = ''
  end
  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
    clear_screen
    puts board
  end

  if someone_won?(board)
    display_board(board)
    prompt "#{detect_winner(board)} won!"
  else
    display_board(board)
    prompt "It's a tie"
  end
  @winner = detect_winner(board)
  show_win_times
  display_board(board)
  game_winner
  final_winner = detect_final_winner(final_winner)
  unless final_winner.nil? || final_winner.empty?
    break unless continue_playing.downcase.start_with?('y')
    reset_game
  end
  clear_screen
end

prompt 'Thanks for playing Tic Tac Toe! Good bye!'
