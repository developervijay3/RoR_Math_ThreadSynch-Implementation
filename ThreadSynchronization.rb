require 'thread'

$mutex = Mutex.new
$cv = ConditionVariable.new
$counter = 1

# Even Thread
def even(threadName)
	$mutex.synchronize {
		$cv.wait($mutex)
		while $counter <= 100 do
			puts "#{threadName} The number is '#{$counter}'"
			$counter += 1
			$cv.broadcast
			if ($counter < 100)
				$cv.wait($mutex)
			end
		end
	}
end

# Odd Thread
def odd(threadName)
$mutex.synchronize {
    while $counter < 100 do
		puts "#{threadName} The number is '#{$counter}'"
		$counter += 1
		$cv.broadcast
		$cv.wait($mutex)
    end
}
end

even = Thread.new {
    even("Thread 2: ")
}
odd = Thread.new {
    odd("Thread 1: ")
}
odd.join
even.join