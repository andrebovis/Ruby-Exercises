tarefas = []

loop do
  puts "\nO que deseja fazer?"
  puts "1 - Adicionar tarefa"
  puts "2 - Listar tarefas"
  puts "3 - Remover tarefa"
  puts "4 - Sair"

  opcao = gets.chomp.to_i

  if !(1..4).include?(opcao)
    puts "Opção inválida"
  else
    case opcao
    when 1
      print "Digite a tarefa: "
      tarefa = gets.chomp
      tarefas << tarefa
      puts "Tarefa adicionada!"
    when 2
      puts "=== Lista de Tarefas ==="
      if tarefas.empty?
        puts "Nenhuma tarefa adicionada ainda."
      else
        tarefas.each_with_index do |tarefa, index|
          puts "#{index + 1}. #{tarefa}"
        end
      end
    when 3
      puts "Digite o número da tarefa que deseja remover:"
      tarefas.each_with_index do |tarefa, index|
        puts "#{index + 1}. #{tarefa}"
      end
      numero = gets.chomp.to_i
      if numero.between?(1, tarefas.size)
        removida = tarefas.delete_at(numero - 1)
        puts "Tarefa '#{removida}' removida."
      else
        puts "Número inválido."
      end
    when 4
      puts "Saindo..."
      break
    end
  end
end
