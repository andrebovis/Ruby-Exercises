def soma(a, b)
  a + b
end

def subtrai(a, b)
  a - b
end

def multiplica(a, b)
  a * b
end

def divide(a, b)
  return "Erro: divisão por zero" if b == 0
  a.to_f / b
end

puts "Qual operação deseja fazer?"
puts "1 - Adição"
puts "2 - Subtração"
puts "3 - Divisão"
puts "4 - Multiplicação"

opcao = gets.chomp.to_i

if !(1..4).include?(opcao)
  puts "Opção inválida"
else
  print "Digite o primeiro número: "
  num1 = gets.chomp.to_i
  print "Digite o segundo número: "
  num2 = gets.chomp.to_i

  case opcao
  when 1 then puts "#{num1} + #{num2} = #{soma(num1, num2)}"
  when 2 then puts "#{num1} - #{num2} = #{subtrai(num1, num2)}"
  when 3 then puts "#{num1} / #{num2} = #{divide(num1, num2)}"
  when 4 then puts "#{num1} * #{num2} = #{multiplica(num1, num2)}"
  end
end
