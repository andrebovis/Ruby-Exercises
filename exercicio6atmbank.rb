usuarioBalance = 1000

loop do
  puts "Ola, o que voce deseja fazer?"
  puts "1 - Depositar"
  puts "2 - Sacar"
  puts "3 - Saldo"
  puts "4 - Sair"

  opcao = gets.chomp.to_i

  if !(1..4).include?(opcao)
    puts "Opcao invalida"
    next
  end

  case opcao
  when 1
    print "Digite o valor para depositar: "
    deposito = gets.chomp.to_i
    if deposito <= 0
      puts "Deposito deve ser maior que zero!"
    else
      usuarioBalance += deposito
      puts "Deposito de #{deposito} realizado com sucesso!"
    end

  when 2
    print "Digite o valor para sacar: "
    saque = gets.chomp.to_i
    if saque <= 0
      puts "Saque deve ser maior que zero!"
    elsif saque > usuarioBalance
      puts "Saldo insuficiente!"
    else
      usuarioBalance -= saque
      puts "Saque de #{saque} realizado com sucesso!"
    end

  when 3
    puts "Seu saldo atual eh: #{usuarioBalance}"

  when 4
    puts "Encerrando o programa..."
    break
  end
end
