biblioteca = {}

puts "Qual livro deseja adicionar?"
livro = gets.chomp

puts "Qual autor?"
autor = gets.chomp

if autor != "" && livro != ""
  biblioteca[livro] = autor
  puts "Livro adicionado com sucesso!"
else
  puts "Livro ou autor não podem estar vazios."
end
