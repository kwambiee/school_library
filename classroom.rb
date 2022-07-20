class Classroom
    attr_accessor :label
    def initialize(label)
        @label=label
        @students=[]
    end
end