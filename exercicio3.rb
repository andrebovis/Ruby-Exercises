puts "Quais itens deseja comprar?"
puts "Temos arroz, feijão, batata e quiabo"
puts "Digite 'sair' para encerrar."

lista = []

loop do
  print "Item: "
  item = gets.chomp.downcase

  break if item == "sair"

  lista << item
end

puts "Você deseja comprar: #{lista.join(', ')}"
