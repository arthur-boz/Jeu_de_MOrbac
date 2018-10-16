class Board

  attr_accessor :cases, :choice

  def initialize

  c_1 = BoardCase.new(1, "1")
  c_2 = BoardCase.new(2, "2")
  c_3 = BoardCase.new(3, "3")
  c_4 = BoardCase.new(4, "4") # Ici nous définissons chaque case et nous lui attribuons une valeur
  c_5 = BoardCase.new(5, "5") # La valeur initiale de la première case étant normalement "0" avec ruby, cette
  c_6 = BoardCase.new(6, "6") # méthode permet des règles plus claires pour le joueur non-averti.
  c_7 = BoardCase.new(7, "7")
  c_8 = BoardCase.new(8, "8")
  c_9 = BoardCase.new(9, "9")
  @cases = [c_1, c_2, c_3, c_4, c_5, c_6, c_7, c_8, c_9]

  end

  def tableau_de_jeu
  puts "\n     |     |     "
  puts "  #{cases[0].value}  |  #{cases[1].value}  |  #{cases[2].value}  "
  puts "_____|_____|_____"  #On dessine le plateau de jeu dans le terminal
  puts "     |     |     "  #tout en le mettant à jour
  puts "  #{cases[3].value}  |  #{cases[4].value}  |  #{cases[5].value}  "
  puts "_____|_____|_____"
  puts "     |     |     "
  puts "  #{cases[6].value}  |  #{cases[7].value}  |  #{cases[8].value}  "
  puts "     |     |     "
  end

  def get_player_choice(choice, player_mark, player) #Permet au joueur de faire un choix, puis d'enregistrer
  self.case_value(choice, player_mark, player)   #ce dernier pour enfin appeler la fonction qui va changer
  end                                                #la valeur de la case choisie

  def case_value(choice, player_mark, player)
    if playable?(@cases[choice - 1])
      if player_mark == "O"
        @cases[choice-1].value = player_mark.yellow #Applique le choix du joueur dans le tableau
      else                                          #tout en appelant la fonction en charge de vérifier
        @cases[choice-1].value = player_mark.blue   #si la case choisie n'est pas déjà occupée
      end
    else
      puts "Cette case est déjà prise petit filou ! Choisi une autre case"
      choice = (gets.chomp).to_i
      self.case_value(choice, player_mark, player)
    end
end

  def playable?(cacase)
    if cacase.value.to_i == cacase.name #Ladite fonction en charge de vérifier si la case est libre comme l'air
      return true
    else
      return false
    end
  end


  def victory(player) #La palette des possibles combinaisons victorieuses
    if @cases[0].value == @cases[1].value && @cases[1].value == @cases[2].value
      return true

    elsif @cases[3].value == @cases[4].value && @cases[4].value == @cases[5].value
      return true

    elsif @cases[6].value == @cases[7].value && @cases[7].value == @cases[8].value
      return true

    elsif @cases[0].value == @cases[3].value && @cases[3].value == @cases[6].value
      return true

    elsif @cases[1].value == @cases[4].value && @cases[4].value == @cases[7].value
      return true

    elsif @cases[2].value == @cases[5].value && @cases[5].value == @cases[8].value
      return true

    elsif @cases[2].value == @cases[4].value && @cases[4].value == @cases[6].value
      return true

    elsif @cases[0].value == @cases[4].value && @cases[4].value == @cases[8].value
      return true

    end
  end

end
