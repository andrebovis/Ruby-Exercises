hospedes = []

loop do
  puts "\nO que deseja fazer?"
  puts "1 - Criar reserva"
  puts "2 - Listar reservas"
  puts "3 - Remover reserva"
  puts "4 - Sair"

  opcao = gets.chomp.to_i

  case opcao
  when 1
    puts "Qual o nome do hóspede?"
    nome = gets.chomp

    puts "Qual número de quarto gostaria de ocupar?"
    quarto = gets.chomp.to_i

    puts "Quantos dias gostaria de ficar?"
    dias = gets.chomp.to_i

    if hospedes.any? { |h| h[:quarto] == quarto }
      puts "Quarto já ocupado!"
    else
      hospedes << { nome: nome, quarto: quarto, dias: dias }
      puts "Reserva realizada com sucesso!"
    end

  when 2
    if hospedes.empty?
      puts "Nenhuma reserva encontrada."
    else
      hospedes.each do |hospede|
        puts "Hóspede: #{hospede[:nome]}"
        puts "Quarto: #{hospede[:quarto]}"
        puts "Dias: #{hospede[:dias]}"
        puts "Total: R$ #{hospede[:dias] * 50}"
        puts "---------------------"
      end
    end

  when 3
    puts "Qual o nome do hóspede?"
    nome = gets.chomp
    hospede = hospedes.find { |h| h[:nome].downcase == nome.downcase }
    if hospede
      hospedes.delete(hospede)
      puts "Reserva removida com sucesso!"
    else
      puts "Hóspede não encontrado."
    end

  when 4
    puts "Saindo..."
    break

  else
    puts "Opção inválida!"
  end
end
