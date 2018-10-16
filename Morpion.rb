require "color_text"
require_relative "classes/board"
require_relative "classes/boardcase" #Permet de faire le lien entre les classes
require_relative "classes/game"
require_relative "classes/player"

game = Game.new #Pour lancer une nouvelle partie
game.tipar #Lance le jeu
