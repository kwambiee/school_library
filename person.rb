class Nameable
  def correct_name
    raise NotImplementedError
  end
end

class Person
  attr_reader :id
  attr_accessor :name, :age, :parent_permission

  def initialize(*args)
    @id = Random.rand(1..1000)
    @age = args[0]
    @name = args[1] || 'unknown'
    @parent_permission = args[2].nil? ? true : args[2]
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end

class Decorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name()
    @nameable.correct_name.upcase
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name[0, 10]
  end
end
