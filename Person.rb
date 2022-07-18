class Person
    attr_reader :id
    attr_accessor :name, :age, :parent_permission
    def initialize(name="unknown",*args)
        @id=Random.rand(1..1000)
        @name=name
        @age=args[0]
        @parent_permission= args[1].nil? ? true : args[1]
    end