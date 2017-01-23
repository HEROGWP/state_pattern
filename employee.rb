class Employee
  attr_reader :state, :hp

  DATA = { 
    super: {atk: 0.6, init_hp: 120, hp: {op: "+", value: -10} }, 
    normal: {atk: 0.8, init_hp: 100, hp: {op: "+", value: 10} }, 
    warning: {atk: 1, init_hp: 60, hp: {op: "+", value: 40} }, 
    dying: {atk: 1.5, init_hp: 30, hp: {op: "*", value: 2} }, 
    game_over: {atk: 0, init_hp: 0, hp: {op: "*", value: 1} } 
  }

  def initialize(state: state)
    @state = state
    @hp    = init_hp
  end

  def tickets_attack(atk)

    @hp -= atk * DATA[state][:atk]

    update_state!
  end

  def take_break

    if DATA[state][:hp][:op] == "+"
      @hp += DATA[state][:hp][:value]
    elsif DATA[state][:hp][:op] == "*"
      @hp *= DATA[state][:hp][:value]
    end

    update_state!
  end

  private

  def update_state!
    @state = if hp > 100
               :super
             elsif hp.between?(61, 100)
               :normal
             elsif hp.between?(31, 60)
               :warning
             elsif hp.between?(1, 30)
               :dying
             elsif hp <= 0
               :game_over
             end
  end

  def init_hp
    DATA[state][:init_hp]
  end
end