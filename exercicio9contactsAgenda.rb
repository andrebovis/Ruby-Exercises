agenda = []

loop do
  puts "\nO que deseja fazer?"
  puts "1 - Adicionar contato com DDD e telefone"
  puts "2 - Listar contatos"
  puts "3 - Remover contato"
  puts "4 - Buscar contato por nome"
  puts "5 - Buscar contato por telefone"
  puts "6 - Sair"

  opcao = gets.chomp.to_i

  if !(1..6).include?(opcao)
    puts "Opção inválida"
  else
    case opcao
    when 1
      print "Digite o nome do contato: "
      nome = gets.chomp
      print "Digite o telefone do contato: "
      telefone = gets.chomp
      if telefone.length != 11
        puts "Telefone inválido! Digite um telefone com 11 dígitos."
        next
      end
      agenda << { nome: nome, telefone: telefone }
      puts "Contato adicionado com sucesso!"

    when 2
      if agenda.empty?
        puts "Nenhum contato cadastrado."
      else
        agenda.each_with_index do |contato, i|
          puts "#{i+1}. #{contato[:nome]} - #{contato[:telefone]}"
        end
      end

    when 3
      print "Digite o nome do contato a remover: "
      nome = gets.chomp
      contato = agenda.find { |c| c[:nome].downcase == nome.downcase }
      if contato
        agenda.delete(contato)
        puts "Contato removido com sucesso!"
      else
        puts "Contato não encontrado."
      end

    when 4
      print "Digite o nome a buscar: "
      nome = gets.chomp
      contato = agenda.find { |c| c[:nome].downcase == nome.downcase }
      if contato
        puts "Encontrado: #{contato[:nome]} - #{contato[:telefone]}"
      else
        puts "Contato não encontrado."
      end

    when 5
      print "Digite o telefone a buscar: "
      telefone = gets.chomp
      contato = agenda.find { |c| c[:telefone] == telefone }
      if contato
        puts "Encontrado: #{contato[:nome]} - #{contato[:telefone]}"
      else
        puts "Telefone não encontrado."
      end

    when 6
      puts "Saindo do sistema... até logo!"
      break
    end
  end
end
