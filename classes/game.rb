class Game

    @@victory = false # on assigne la valeur false en valeur de base pour que  lorsqu'elle devient true le jeu plie les gaulles

    def initialize # utilise la classe player pour demander les infos aux joueurs et la classe baord pour lancer la tipar
      puts " The Houmous Project présente Morbac"
      @player_one = Player.new
      @player_one.informations
      @player_two = Player.new
      @player_two.informations
      @boboard = Board.new
    end

    def tipar
      puts " Allez c'est parti, on s'amuse"
      i = 0
      loop do
        break if i > 8 # pour que le jeu s'arrête car celui-ci  ne peut comporter que 9 tours
      self.tours(@player_one) #appelle le tour du j1
      i += 1 #permet de compter un tour
      if @@victory #vérifie dans la classe board si une des conditions de victoire possible est remplie, auquel cas effectue l'action suivante
        puts " Bravo oulala"
        @boboard.tableau_de_jeu #Raffiche le tableau victorieux tout en féliciatant le vainqueur
        puts " GG #{@player_one.player_name} ! "
        break
      end
      break if i > 8 # tout pareil que pour joueur 1
      self.tours(@player_two)
      i += 1
      if @@victory
        puts " Bravo oulala"
        @boboard.tableau_de_jeu
        puts " GG #{@player_two.player_name} ! "

        break
      end
    end

    @boboard.tableau_de_jeu

    puts "Oulala égalité" if @@victory == false
    puts "#{@player_one.player_name} : #{@player_one.player_points} versus #{@player_two.player_name} : #{@player_two.player_points}"
    # affiche résulats avec nom des joueurs
    puts " Une p'tite dernière de derrière les fagots ? O/N"
    choice = (gets.chomp).to_s.capitalize
    if choice == "O"
      @@victory = false # permet de relancer la partie
      @boboard = Board.new
      self.tipar
    end
  end

  def tours(player) # Définission de l'ensemble des actions lors d'un tour
    @choice = 0
    @boboard.tableau_de_jeu #affiche le board 
    puts "C'est au tour de #{player.player_name}!"
    puts "Choisis un chiffre entre 1 et 9 : "
    while !((1..9).include?(@choice)) do #N'autorise qu'une saisie entre 1 et 9 pour le joueur
      @choice = (gets.chomp).to_i
    end
  @boboard.get_player_choice(@choice, player.player_mark, player) #Va chercher dans la classe board la fonction qui permet d'intéragir avec le plateau de jeu
    if @boboard.victory(player)
      @@victory = true
      player.player_points += 1 #augmente le score du joueur victorieux de 1
    end
   end

end
