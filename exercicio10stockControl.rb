def prompt(message)
  print message
  gets.chomp
end

def ler_inteiro_positivo(message)
  loop do
    input = prompt(message)
    begin
      n = Integer(input)
      if n > 0
        return n
      else
        puts "Digite um número inteiro maior que zero."
      end
    rescue ArgumentError
      puts "Entrada inválida. Digite um número inteiro."
    end
  end
end

def ler_nome_produto(message)
  loop do
    nome = prompt(message).strip
    return nome unless nome.empty?
    puts "Nome inválido. Digite um nome não vazio."
  end
end

def achar_chave_por_nome(estoque, nome)
  return nil if nome.nil? || nome.strip.empty?
  lower = nome.strip.downcase
  estoque.keys.find { |k| k.downcase == lower }
end

def pluralize(unidades)
  unidades == 1 ? "unidade" : "unidades"
end

estoque = {}

loop do
  puts "\n--- MENU ---"
  puts "1 - Adicionar produto"
  puts "2 - Listar estoque"
  puts "3 - Remover produto"
  puts "4 - Sair"

  opcao_input = prompt("Escolha a opção: ")
  begin
    opcao = Integer(opcao_input)
  rescue ArgumentError
    puts "Opção inválida. Digite um número entre 1 e 4."
    next
  end

  case opcao
  when 1
    produto = ler_nome_produto("Qual produto deseja adicionar ao estoque? ")
    quantidade = ler_inteiro_positivo("Quantas unidades de #{produto} deseja adicionar? ")

    chave = achar_chave_por_nome(estoque, produto) || produto.strip
    estoque[chave] = (estoque[chave] || 0) + quantidade
    puts "Adicionado: #{quantidade} #{pluralize(quantidade)} de '#{chave}'. Total agora: #{estoque[chave]}."

  when 2
    puts "\n=== Estoque Atual ==="
    if estoque.empty?
      puts "Sem itens no estoque."
    else
      estoque.each_with_index do |(nome, qtd), i|
        puts "#{i + 1}. #{nome} - #{qtd} #{pluralize(qtd)}"
      end
    end

  when 3
    if estoque.empty?
      puts "Estoque vazio. Nada para remover."
      next
    end

    produto = ler_nome_produto("Qual produto deseja remover do estoque? ")
    chave = achar_chave_por_nome(estoque, produto)

    if chave.nil?
      puts "Produto '#{produto}' não encontrado no estoque."
      next
    end

    puts "No estoque temos #{estoque[chave]} #{pluralize(estoque[chave])} de '#{chave}'."
    quantidade = ler_inteiro_positivo("Quantas unidades de #{chave} deseja remover? ")

    if quantidade > estoque[chave]
      puts "Quantidade indisponível. Só há #{estoque[chave]} #{pluralize(estoque[chave])}."
    else
      estoque[chave] -= quantidade
      if estoque[chave] == 0
        estoque.delete(chave)
        puts "Removidas todas as unidades. '#{chave}' foi removido do estoque."
      else
        puts "Removido(s) #{quantidade}. Restam #{estoque[chave]} #{pluralize(estoque[chave])} de '#{chave}'."
      end
    end

  when 4
    puts "Saindo... até logo!"
    break

  else
    puts "Opção inválida. Escolha entre 1 e 4."
  end
end
