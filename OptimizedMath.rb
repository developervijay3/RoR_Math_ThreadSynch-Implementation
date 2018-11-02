class OptimizedMath
  def initialize(n)
    @number = n
  end

def calculate
			for i in 1..@number
				if ((((i + i/3)&3) == 0) && ((i & 1) == 0))
					puts "The number #{i} is divisible by two and three"
				elsif (((i + i/3)&3) == 0)
					puts "The number #{i} is divisible by three"
				else
					if ((i & 1) == 0)
						puts "The number #{i} is even"
					else
						puts "The number #{i} is odd"
					end
			end
		end
	end
end

a = OptimizedMath.new(100)
a.calculate