require "csv"

loop{
  puts "１（新規でメモを作成）２（既存のメモを編集する）３（メモを終了する）"
  
  memo_type = gets.chomp
  
  if memo_type == "１"
    puts "＊＊拡張子を除いたファイル名を入力してください＊＊"

    new_file_name = gets.chomp
    CSV.open("#{new_file_name}.csv","w") do |csv|
      puts "＊＊メモの内容を入力できます＊＊"
      puts "＊＊入力が終了したら Ctrl+D を押してください＊＊"
      while memo = gets
        csv << [memo.chomp]
      end
    end
    
  elsif memo_type == "２"
    puts "＊＊編集したいファイルを指定してください＊＊"
    
    existing_file_name = gets.chomp
    CSV.foreach("#{existing_file_name}.csv") do |saved_csv|
      p saved_csv
    end
    
    puts "＊＊#{existing_file_name}の内容を表示しました＊＊"
    puts "＊＊追加するメモの内容を入力できます＊＊"
    puts "＊＊入力が終了したら Ctrl+D を押してください＊＊"
    
    CSV.open("#{existing_file_name}.csv","a+") do |csv|
      while memo = gets
        csv << [memo.chomp]
      end
    end
  
  elsif memo_type == "３"
    break

  else
    puts "＊＊エラーです＊＊",
         "＊＊全角数字で入力してください＊＊",
         "＊＊１，２，３のどれかを入力して下さい＊＊"
  end
}