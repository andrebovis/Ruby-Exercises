ROOMS = (1..50).to_a

def price_per_night(room)
  room <= 30 ? 50 : 100
end

def total_price(room, days)
  price_per_night(room) * days
end

def prompt(msg)
  print msg
  gets.chomp
end

def read_nonempty(msg)
  loop do
    s = prompt(msg).strip
    return s unless s.empty?
    puts "Entrada vazia. Tente novamente."
  end
end

def read_int(msg, min: nil, max: nil)
  loop do
    s = prompt(msg)
    begin
      n = Integer(s)
      if !min.nil? && n < min
        puts "Valor deve ser ≥ #{min}."
      elsif !max.nil? && n > max
        puts "Valor deve ser ≤ #{max}."
      else
        return n
      end
    rescue ArgumentError
      puts "Digite um número inteiro válido."
    end
  end
end

def occupied?(reservas, room)
  reservas.any? { |r| r[:quarto] == room && r[:status] != :finalizada }
end

def available_rooms(reservas)
  ROOMS.reject { |r| occupied?(reservas, r) }
end

def find_by_name(reservas, name)
  reservas.find { |r| r[:nome].downcase == name.downcase && r[:status] != :finalizada }
end

def find_by_room(reservas, room)
  reservas.find { |r| r[:quarto] == room && r[:status] != :finalizada }
end

def create_reservation(reservas)
  nome = read_nonempty("Nome do hóspede: ")
  dias = read_int("Dias de estadia: ", min: 1)
  livres = available_rooms(reservas)
  if livres.empty?
    puts "Não há quartos disponíveis."
    return
  end
  puts "Quartos livres: #{livres.join(', ')}"
  quarto = read_int("Escolha o quarto (1-50): ", min: 1, max: 50)
  if occupied?(reservas, quarto)
    puts "Quarto #{quarto} ocupado."
    return
  end
  reservas << { nome: nome, quarto: quarto, dias: dias, status: :reservado }
  puts "Reserva criada: #{nome}, quarto #{quarto}, #{dias} dia(s), total R$ #{total_price(quarto, dias)}."
end

def list_reservations(reservas)
  if reservas.empty?
    puts "Nenhuma reserva cadastrada."
    return
  end
  reservas.each_with_index do |r, i|
    puts "#{i+1}. #{r[:nome]} | Quarto #{r[:quarto]} | #{r[:dias]} dia(s) | " \
         "R$ #{total_price(r[:quarto], r[:dias])} | Status: #{r[:status]}"
  end
end

def search_reservation(reservas)
  puts "Buscar por: 1-Nome  2-Quarto"
  op = read_int("> ", min: 1, max: 2)
  if op == 1
    nome = read_nonempty("Nome: ")
    r = find_by_name(reservas, nome)
  else
    quarto = read_int("Quarto: ", min: 1, max: 50)
    r = find_by_room(reservas, quarto)
  end
  if r
    puts "Encontrada: #{r[:nome]} | Quarto #{r[:quarto]} | #{r[:dias]} dia(s) | " \
         "R$ #{total_price(r[:quarto], r[:dias])} | Status: #{r[:status]}"
  else
    puts "Nenhuma reserva encontrada."
  end
end

def cancel_reservation(reservas)
  nome = read_nonempty("Nome do hóspede para cancelar: ")
  r = find_by_name(reservas, nome)
  if r
    reservas.delete(r)
    puts "Reserva cancelada."
  else
    puts "Hóspede não encontrado."
  end
end

def edit_reservation(reservas)
  nome = read_nonempty("Nome do hóspede para editar: ")
  r = find_by_name(reservas, nome)
  unless r
    puts "Reserva não encontrada."
    return
  end
  puts "Editar: 1-Quarto  2-Dias"
  op = read_int("> ", min: 1, max: 2)
  if op == 1
    livres = available_rooms(reservas) + [r[:quarto]]
    puts "Quartos disponíveis (inclui o atual): #{livres.sort.join(', ')}"
    novo = read_int("Novo quarto: ", min: 1, max: 50)
    if occupied?(reservas, novo) && novo != r[:quarto]
      puts "Quarto #{novo} está ocupado."
    else
      r[:quarto] = novo
      puts "Quarto atualizado."
    end
  else
    novos_dias = read_int("Novos dias: ", min: 1)
    r[:dias] = novos_dias
    puts "Dias atualizados."
  end
end

def check_in(reservas)
  nome = read_nonempty("Nome para check-in: ")
  r = find_by_name(reservas, nome)
  if r
    r[:status] = :hospedado
    puts "Check-in realizado para #{r[:nome]} (quarto #{r[:quarto]})."
  else
    puts "Reserva não encontrada."
  end
end

def check_out(reservas)
  nome = read_nonempty("Nome para check-out: ")
  r = find_by_name(reservas, nome)
  if r
    r[:status] = :finalizada
    puts "Check-out de #{r[:nome]} concluído. Total R$ #{total_price(r[:quarto], r[:dias])}."
  else
    puts "Reserva não encontrada."
  end
end

def show_available(reservas)
  livres = available_rooms(reservas)
  if livres.empty?
    puts "Nenhum quarto livre."
  else
    puts "Quartos livres: #{livres.join(', ')}"
  end
end

reservas = []

loop do
  puts "\n=== Hotel ==="
  puts "1 - Criar reserva"
  puts "2 - Listar reservas"
  puts "3 - Buscar reserva"
  puts "4 - Cancelar reserva"
  puts "5 - Editar reserva"
  puts "6 - Quartos livres"
  puts "7 - Check-in"
  puts "8 - Check-out"
  puts "9 - Sair"

  opcao = read_int("> ", min: 1, max: 9)

  case opcao
  when 1 then create_reservation(reservas)
  when 2 then list_reservations(reservas)
  when 3 then search_reservation(reservas)
  when 4 then cancel_reservation(reservas)
  when 5 then edit_reservation(reservas)
  when 6 then show_available(reservas)
  when 7 then check_in(reservas)
  when 8 then check_out(reservas)
  when 9 then puts("Até logo!"); break
  end
end
