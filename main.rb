@players = {
  :pOne => {
    'name' => '',
    'lives' => 3,
    'correct' => 0,
  },

  :pTwo => {
     'name' => '',
     'lives' => 3,
     'correct' => 0,
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

def active_player
  player = @ap ? @players[:pOne] : @players[:pTwo]
  return player
end

def assess_answer(player, answer)
  correct = @numbers[2]
  if answer == correct
    player['correct'] += 1
    puts "Nice one, that's correct!"
    puts "#{player['name']} score is #{player['correct']}"
    puts 
  elsif answer != correct
    player['lives'] -= 1
    puts "That's incorrect"
    puts "#{@players[:pOne]['name'].capitalize} has:"
    puts "#{@players[:pOne]['lives']} lives remaining,"
    puts "And a score of #{@players[:pOne]['correct']}"
    puts 
    puts "#{@players[:pTwo]['name']} has:" 
    puts "#{@players[:pTwo]['lives']} lives remaining,"
    puts "And a score of #{@players[:pTwo]['correct']}"
    puts
   end
end

def get_answer(player)
  puts "#{player['name']} what is #{@numbers[0]} plus #{@numbers[1]}?"
  answer = gets.chomp
  if (/[^[:digit:]]+/.match(answer).nil?)
    puts
    ans_num = answer.to_i
    assess_answer(player, ans_num)
  elsif !(/[^[:digit:]]+/.match(answer).nil?)
    puts
    puts "Sorry that is not a number. Try solving this one with numbers!"
    question_engine(player)
  end
end  


def question_engine(player)
  while (@players[:pOne]['lives'] > 0 && @players[:pTwo]['lives'] > 0)
    question_generator
    get_answer(active_player)
    @numbers.clear
    @ap = !@ap
  end
  try_again
end

def try_again
  puts "GAME OVER."
  puts "Would you like to try again?"
  puts "Y or N"
  option = gets.chomp
  y_or_n = option.downcase
  case y_or_n
   when "y"
    question_engine(active_player)
  when "n"
    puts "Sweet, see you next time!"
    exit
  else
    puts "That's not an option."
  end 
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
  question_engine(active_player)
end


get_names
