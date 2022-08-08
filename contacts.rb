@agenda = [
    {nome: "Andre", telefone: "999999123"},
    {nome: "Marina", telefone: "999474123"},
    {nome: "Bento", telefone: "993474763"}
]

def all_contacts
    @agenda.each do |contato|
        puts "#{contato[:nome]} - #{contato[:telefone]}"
    end
    puts "------------------------------------------"
end

def add_contact
    print "Nome: "
    nome = gets.chomp
    print "Telefone: "
    telefone = gets.chomp

    @agenda << {nome: nome, telefone: telefone}
end

def see_contact
    print "Qual o nome do contato? "
    nome = gets.chomp
    
    @agenda.each do |contato|
        if contato[:nome].downcase.include?(nome.downcase)
            puts "#{contato[:nome]} - #{contato[:telefone]}"
        end
    end
    puts "------------------------------------------"
end

def edit_contact
    print "Qual o nome do contato que deseja editar? "
    nome = gets.chomp

    @agenda.each do |contato|
        if contato[:nome].downcase == (nome.downcase)
            print "Qual o novo nome? (Para alterar apenas no telefone, pressione ENTER): "
            nome_salvo = contato[:nome]

            contato[:nome] = gets.chomp
            contato[:nome] = contato[:nome].empty? ? nome_salvo : contato[:nome]

            print "Qual o novo telefone? (Para sair, pressione ENTER): "
            telefone_salvo = contato[:telefone]

            contato[:telefone] = gets.chomp
            contato[:telefone] = contato[:telefone].empty? ? telefone_salvo : contato[:telefone]
        end
    end
end

def remove_contact
    print "Qual nome de contato deseja remover? "
    nome = gets.chomp

    @agenda.each do |contato|
        if contato[:nome].downcase == (nome.downcase)
            indice = @agenda.index(contato)
            @agenda.delete_at(indice)
            break
        end
    end
    puts "Contato removido!"
    puts "------------------------------------------"
end


loop do

puts "1. Contatos\n2. Adicionar Contato\n3. Ver Contato\n4. Editar Contato\n5. Remover Contato\n0. Sair"
    codigo = gets.chomp.to_i

    case
    when codigo == 0
        puts "Até mais!"
        break
    when codigo == 1
        all_contacts
    when codigo == 2
        add_contact
        puts "Contato adicionado!"
    when codigo == 3
        see_contact
    when codigo == 4
        edit_contact
    when codigo == 5
        remove_contact
    end
end