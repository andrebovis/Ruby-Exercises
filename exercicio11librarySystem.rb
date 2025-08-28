biblioteca = {}

loop do
  puts "\nO que deseja fazer?"
  puts "1 - Adicionar livro"
  puts "2 - Buscar livro"
  puts "3 - Remover livro"
  puts "4 - Listar todos os livros"
  puts "5 - Sair"

  opcao = gets.chomp.to_i

  case opcao
  when 1
    puts "Qual livro deseja adicionar?"
    livro = gets.chomp.strip
    puts "Qual autor?"
    autor = gets.chomp.strip

    if livro.empty? || autor.empty?
      puts "Livro ou autor não podem estar vazios."
    elsif biblioteca.key?(livro.downcase)
      puts "Esse livro já está cadastrado!"
    else
      biblioteca[livro.downcase] = autor
      puts "Livro adicionado com sucesso!"
    end

  when 2
    puts "Qual livro deseja buscar?"
    livro = gets.chomp.strip.downcase
    if biblioteca.key?(livro)
      puts "Autor: #{biblioteca[livro]}"
    else
      puts "Livro não encontrado."
    end

  when 3
    puts "Qual livro deseja remover?"
    livro = gets.chomp.strip.downcase
    if biblioteca.delete(livro)
      puts "Livro removido com sucesso!"
    else
      puts "Livro não encontrado."
    end

  when 4
    puts "=== Lista de Livros ==="
    if biblioteca.empty?
      puts "Nenhum livro cadastrado ainda."
    else
      biblioteca.each { |livro, autor| puts "#{livro.capitalize} - #{autor}" }
    end

  when 5
    puts "Obrigado por usar a biblioteca. Até logo!"
    break

  else
    puts "Opção inválida!"
  end
end
