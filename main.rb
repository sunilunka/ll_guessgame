@players = {
  :pOne => {
    'name' => 'hello',
    'lives' => 3,
    'correct' => 0,
    'incorrect' => 0
  },

  :pTwo => {
     'name' => '',
     'lives' => 3,
     'correct' => 0,
     'incorrect' => 0 
  }
}
@pOne_name = @players[:pOne]['name']
@apOne_name = @players[:pTwo]['name']
@one_score = @players[:pOne]['lives'] 
@two_score = @players[:pTwo]['lives']

@ap = true

@numbers = []

def question_generator
  x = rand(20)
  y = rand(20)
  z = x + y
  @numbers << x
  @numbers << y
  @numbers << z
end

def get_names
  puts "Game time! Guess the answer to each question. You have three lives."
  puts "The winner...they are the who doesn't lose all their lives."
  puts "Player 1, enter your name:"
  @players[:pOne]['name'] = gets.chomp
  puts "Hi #{@players[:pOne]['name']}"
  puts "Player 2, enter your name:"
  @players[:pTwo]['name'] = gets.chomp
  puts "Hi #{@players[:pTwo]['name']}..."
  puts "Lets get going! Player 1 starts."
end

def active_player
  player = @ap ? @pOne_name : @pTwo_name
  return player
end



def question_engine(player)
  while (@one_score > 0 && @two_score > 0)
    question_generator
    puts "#{player} what is #{@numbers[0]} plus #{@numbers[1]}?"
    @one_score = 0
  end
end

#get_names

active_player
question_engine(active_player)
