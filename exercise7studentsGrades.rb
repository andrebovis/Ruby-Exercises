puts "Digite suas notas (entre 0 e 10):"

grades = []

3.times do |i|
  grade = nil

  loop do
    print "Nota #{i + 1}: "
    grade = gets.chomp.to_i

    if grade.between?(0, 10)
      break
    else
      puts "Nota inválida! Digite um número entre 0 e 10."
    end
  end

  grades << grade
end

average = grades.sum.to_f / grades.size

puts "Sua média final é: #{average.round(2)}"

if average >= 7
  puts "Aprovado!"
else
  puts "Reprovado!"
end
