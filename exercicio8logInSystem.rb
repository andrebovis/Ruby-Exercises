senha = nil

3.times do |tentativa|
  puts "Cadastre a sua senha que contenha pelo menos 6 dígitos: "
  senha = gets.chomp

  if senha.length >= 6
    puts "Senha cadastrada com sucesso!"
    break
  else
    puts "Senha inválida! Tente novamente."
    senha = nil
  end
end

if senha.nil?
  puts "Acesso negado! Você não conseguiu cadastrar uma senha válida."
  exit
end

3.times do |tentativa|
  puts "Digite a senha para entrar no sistema: "
  tentativa_senha = gets.chomp

  if tentativa_senha == senha
    puts "Bem-vindo ao sistema!"
    exit
  else
    puts "Senha inválida! Tentativas restantes: #{2 - tentativa}"
  end
end

puts "Acesso negado! Número máximo de tentativas atingido."
