random = rand(1..10)

puts "Número aleatório entre 1 e 10: (tente adivinhar!)"
puts "Adivinhe o número: "
guess = gets.chomp.to_i

if guess == rand
  puts "Parabéns, você acertou! O número era #{rand}."
else
  puts "Você errou. O número era #{rand}."
end
