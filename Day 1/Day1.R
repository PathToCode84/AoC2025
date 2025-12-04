# Advent of Code Day 1

# import txt 
input = readLines("/Users/mia8425/Documents/Code/Advent of Code 2025/Day 1/real_input.txt")

start = 50
# for counting the times it lands at 0
count = 0


# loop through dial instructions
last = start
for (inst in input) {
  direction = substr(inst,1,1)
  sign = +1
  if (direction == "L") {
    sign = -1
  }
  end = nchar(inst)
  dialnumber = as.numeric(substr(inst,2,end))
  current = ((sign * dialnumber) + last) %% 100
  if (current < 0) {
    current = 100 + current
  }
  if (current > 99) {
    current = current - 100
  }
  if (current == 0) {
    count = 1+count
  }
  last = current
}

cat("The real pw ist ", count, "because that's how often we roate the dial to 0")

# It's not 7 :(
# And not 417 :( still too low
# so my problem was, that we can add or subtsract more than 100 in one dialstep
# 1034 is correct :)


# part 2 also has to count the amount of times it passes 0

# import txt 
input = readLines("/Users/mia8425/Documents/Code/Advent of Code 2025/Day 1/test_input.txt")

start = 50
# for counting the times it lands at 0
count = 0

# loop through dial instructions
last = start
for (inst in input) {
  direction = substr(inst,1,1)
  sign = +1
  if (direction == "L") {
    sign = -1
  }
  end = nchar(inst)
  dialnumber = as.numeric(substr(inst,2,end))
  dialnumber_copy = dialnumber
  while (dialnumber_copy > 200){
    count = count +1
    dialnumber_copy = dialnumber_copy -100
  }
  current = (sign * dialnumber) + last

  # if we go over 99 
  if (current >= 100){
    count = count +1
    current = current -100
  }
  #or below 0
  if (current <= -1){
    count = count +1
    current = current +100
  }

  
  last = current
}

cat("The real real pw ist ", count, "because that's how often we pass 0")

# 4429 ist too low
# 4946 ist not right (but didn't say too low)
# 7505 falsch