class  Player

@@player = 0
@@mark = "" # permet d'enregistrer la marque choisie pour toutes classes
attr_accessor :player_name, :player_mark, :player_points

  def initialize
    @player_name = "" # permet d'assigner à pname une string qui sera remplie par la suite avec gets.chomp
    @player_mark = ""
    @@player += 1
    @player_points = 0 # le @@ permet ici de rendre l'info accessible à toutes les calsses de notre programme
  end

  def informations

    puts "Pose ton blaze, ici la tout de suite : "

    @player_name = ((gets.chomp).to_s).capitalize
    if @@player == 1 && @@mark == ""
      puts " Quel symbole veux tu ? Un X ou un O ?"
      while @player_mark != "X" && @player_mark != "O" do
        @player_mark = (gets.chomp).to_s.capitalize # capitalize permet de convertir le string rentré par p en majuscule afin d'éviter rupture dans programme
      end

    elsif @@mark == "X" #si j1 choisit ce symbole, alors on attribue le symbole restant à j2
      @player_mark = "O"
    elsif @@mark == "O"
      @player_mark = "X"
    end
    @@mark = @player_mark
    puts "#{@player_name} jouera avec le symbole #{@player_mark}, qu'est ce qu'on se marre ! "# récapitule qui joue avec quel symbole
  end
end
