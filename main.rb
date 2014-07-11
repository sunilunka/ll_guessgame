players = {
  :pOne => {
    "lives" => 3,
    "correct" => 0,
    "incorrect" => 0
  },

  :pTwo => {
     "lives" => 3,
     "correct" => 0,
     "incorrect" => 0 
  }
}


def question_generator
  @x = rand(20)
  @y = rand(20)
  @z = @x + @y
  puts "#{@z}"
end

question_generator