class Janken
  def initialize
    @directions = ["上", "下", "左", "右"]
    @hands = ["グー", "チョキ", "パー"]
  end

  def start
    puts "じゃんけん..."
    my_hand = select_hand
    opponent_hand = @hands.sample
    puts "あなたの手: #{my_hand}, 相手の手: #{opponent_hand}"

    if win?(my_hand, opponent_hand)
      puts "あなたの勝ち！あっち向いてホイの時間です！"
      atchimuitehoi(true)
    elsif lose?(my_hand, opponent_hand)
      puts "あなたの負け...あっち向いてホイの時間です！"
      atchimuitehoi(false)
    else
      puts "あいこで..."
      start
    end
  end

  private

  def select_hand
    puts "何を出しますか？0:グー, 1:チョキ, 2:パー"
    input = gets.to_i
    @hands[input]
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
      puts "あなたの指: #{@directions[my_direction]}, 相手の顔: #{@directions[opponent_direction]}"
      if my_direction == opponent_direction
        puts "あなたの勝ち！"
      else
        puts "残念、あなたの負け..."
      end
    else
      puts "どの方向に顔を向けますか？0:上, 1:下, 2:左, 3:右"
      my_direction = gets.to_i
      opponent_direction = rand(4)
      puts "あなたの顔: #{@directions[my_direction]}, 相手の指: #{@directions[opponent_direction]}"
      if my_direction == opponent_direction
        puts "あなたの負け..."
      else
        puts "よかった、あなたの勝ち！"
      end
    end
  end
end

game = Janken.new
game.start
