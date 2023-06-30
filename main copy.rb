class Janken
  def initialize
    @directions = ["上", "下", "左", "右"]
    @hands = ["グー", "チョキ", "パー"]
  end

  def start
    puts "じゃんけん..."
    my_hand = select_hand
    opponent_hand = @hands.sample
    puts "あなた: #{my_hand}を出しました"
    puts "相手: #{opponent_hand}を出しました"
    puts "================================================================"
    puts "あっち向いて〜"
    if win?(my_hand, opponent_hand)
      atchimuitehoi(true)
    elsif lose?(my_hand, opponent_hand)
      atchimuitehoi(false)
    else
      puts "あいこで..."
      start
    end
  end

  private

  def select_hand
    puts "0:グー, 1:チョキ, 2:パー"
    input = gets.to_i
    @hands[input]
    puts "ホイ！"
    puts "================================================================"
  end

  def win?(my_hand, opponent_hand)
    (my_hand == "グー" && opponent_hand == "チョキ") ||
    (my_hand == "チョキ" && opponent_hand == "パー") ||
    (my_hand == "パー" && opponent_hand == "グー")
  end

  def lose?(my_hand, opponent_hand)
    (my_hand == "グー" && opponent_hand == "パー") ||
    (my_hand == "チョキ" && opponent_hand == "グー") ||
    (my_hand == "パー" && opponent_hand == "チョキ")
  end

  def atchimuitehoi(is_winner)
    if is_winner
      puts "どの方向に指を指しますか？0:上, 1:下, 2:左, 3:右"
      my_direction = gets.to_i
      opponent_direction = rand(4)
      puts "あなた: #{@directions[my_direction]}"
      puts "相手: #{@directions[opponent_direction]}"
      if my_direction == opponent_direction
        puts "あなたの勝ち！"
      else
        start
      end
    else
      puts "0:上, 1:下, 2:左, 3:右"
      my_direction = gets.to_i
      opponent_direction = rand(4)
      puts "あなた: #{@directions[my_direction]}"
      puts "相手: #{@directions[opponent_direction]}"
      if my_direction == opponent_direction
        puts "あなたの負け..."
      else
        start
      end
    end
  end
end

game = Janken.new
game.start
