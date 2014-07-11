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

@ap = true

def question_generator
  @x = rand(20)
  @y = rand(20)
  @z = @x + @y
  puts "#{@z}"
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
  player = @ap ? @players[:pOne]['name'] : @players[:pTwo]['name']
  puts "#{player}"
end

def question_engine
end

get_names

#active_player
#question_generator