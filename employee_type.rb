class EmployeeType
  def self.getType(state)
    if state == :super
      Super.new
    elsif state == :normal
      Normal.new
    elsif state == :warning
      Warning.new
    elsif state == :dying
      Dying.new
    elsif state == :game_over
      Game_Over.new
    end
  end

  class Super
    def tickets_attack(hp, atk)
      hp -= atk * 0.6
    end

    def take_break(hp)
      hp -= 10
    end

    def init_hp
      120
    end

    def display_name
      self.class.name.split('::').last.downcase.to_sym
    end
  end

  class Normal
    def tickets_attack(hp, atk)
      hp -= atk * 0.8
    end

    def take_break(hp)
      hp += 10
    end

    def init_hp
      100
    end

    def display_name
      self.class.name.split('::').last.downcase.to_sym
    end
  end

  class Warning
    def tickets_attack(hp, atk)
      hp -= atk * 1
    end

    def take_break(hp)
      hp += 40
    end

    def init_hp
      60
    end

    def display_name
      self.class.name.split('::').last.downcase.to_sym
    end
  end

  class Dying
    def tickets_attack(hp, atk)
      hp -= atk * 1.5
    end

    def take_break(hp)
      hp *= 2
    end

    def init_hp
      30
    end

    def display_name
      self.class.name.split('::').last.downcase.to_sym
    end
  end

  class Game_Over
    def tickets_attack(hp, atk)
      hp
    end

    def take_break(hp)
      hp
    end

    def init_hp
      0
    end

    def display_name
      self.class.name.split('::').last.downcase.to_sym
    end
  end
end
