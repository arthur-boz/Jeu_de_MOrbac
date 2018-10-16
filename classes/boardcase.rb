class BoardCase

  attr_accessor :name, :value #Démarre une nouvelle partie

  def initialize (name, value)
    @name = name.to_i
    @value = value
  end

end
