# Функція для видалення порожніх файлів
def delete_empty_files(directory)
  unless Dir.exist?(directory)
    puts "Помилка: Папка '#{directory}' не існує."
    return
  end

  empty_files = Dir.glob(File.join(directory, '**', '*')).select { |file| File.file?(file) && File.size(file).zero? }
  
  if empty_files.empty?
    puts "У папці '#{directory}' немає порожніх файлів."
  else
    empty_files.each do |file|
      File.delete(file)
      puts "Видалено: #{file}"
    end
    puts "Всього видалено порожніх файлів: #{empty_files.size}."
  end
end

puts "Введіть шлях до папки:"
directory = gets.chomp

delete_empty_files(directory)
