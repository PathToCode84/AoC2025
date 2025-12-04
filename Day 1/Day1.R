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
input = readLines("/Users/mia8425/Documents/Code/Advent of Code 2025/Day 1/input.txt")
n_pass0 = function(input) {
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
    cat("starting current ist ", current, "mit dialnumber ", dialnumber, "\n")
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
    if (current%%100 == 0 && last == 0){ #
      count = count +1
    }
    cat("der count ist jetzt ", count, "mit fertiger position ", current, "\n")
    last = current
  }
  
  cat("The real real pw ist ", count, "because that's how often we pass 0")
  return (count)
} 

# 4429 is too low
# 4946 is not right (but didn't say too low)
# 7505 falsch
# 6700 is "the right answer for somebody else" but wrong

# test cases
input1 = c("R49","L98") #0
input2 = c("R49","R1") #1
input3 = c("R49","R1", "R1") #1
input4 = c("R49","R1", "R1", "L1") #1
input5 = c("L50","L100") #2
input6 = c("R50","R100")
input7 = c("L50","L400") #5
input8 = c("R1000") #10

n_pass0(input1)
