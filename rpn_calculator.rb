class RPNCalculator
    attr_accessor :value

	def initialize
		@value = 0
		@stack = []
	end

	def push(num)
		@stack.push(num)
	end

	def plus
		if @stack.empty?
			raise "calculator is empty"
		else
			@value = @stack.pop
			@value +=@stack.pop
			push(@value)
			@value
		end
	end

	def minus
		if @stack.empty?
			raise "calculator is empty"
		else
			@value = 0 -  @stack.pop
			@value += @stack.pop
			push(@value)
			@value
		end
	end

	def divide
		if @stack.empty?
			raise "calculator is empty"
		else
			@value = 1
			@value /= @stack.pop.to_f
			@value *= @stack.pop.to_f
			push(@value)
		end
	end

	def times
		if @stack.empty?
			raise "calculator is empty"
		else
			@value = 1
			@value *= @stack.pop.to_f
			@value *= @stack.pop.to_f
			push(@value)
		end
	end
    
    #takes in a string and returns an array of Integers and Symbols
	def tokens(list)
		array = list.split(" ")
		array.map! do |x|
			if /[0-9]/.match x
				x.to_i
			else
				x.to_sym
			end

		end
	end
    
    #Takes in an array of Integers and Symbols in RPN and evaluates
	def evaluate(list)
		list = tokens(list)
		list.each do |x|
			if x.is_a? Integer
				push(x)
			elsif x == :+
				plus
			elsif x == :-
				minus
			elsif x ==:*
				times
			elsif x == :/
				divide
			end
		end
		@value
	end
end