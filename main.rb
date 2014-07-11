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
  player = @ap ? @players[:pOne] : @players[:pTwo]
  return player
end

def assess_answer(player, answer)
  correct = @numbers[2]
  if answer == correct
    player['correct'] += 1
    puts "#{player['name']} score is #{player['correct']}"
  elsif answer != correct
    player['lives'] -= 1
    puts "That's incorrect"
    puts "#{@players[:pOne]['name']} has #{@players[:pOne]['lives']}"
    puts "#{@players[:pTwo]['name']} has #{@players[:pTwo]['lives']}"
   end
end

def get_answer(player)
  puts "#{player['name']} what is #{@numbers[0]} plus #{@numbers[1]}?"
  answer = gets.chomp
  if (/[^[:digit:]]+/.match(answer).nil?)
    ans_num = answer.to_i
    assess_answer(player, ans_num)
    puts "#{ans_num}"
  elsif !(/[^[:digit:]]+/.match(answer).nil?)
    puts "Sorry that is not a number. Try solving this one with numbers!"
    question_engine(player)
  end
end  


def question_engine(player)
  while (@players[:pOne]['lives'] > 0 && @players[:pTwo]['lives'] > 0)
    question_generator
    get_answer(active_player)
    @one_lives = 0
  end
end

#get_names

active_player
question_engine(active_player)
