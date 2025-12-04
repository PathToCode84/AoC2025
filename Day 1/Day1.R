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
  
    current = (sign * dialnumber) + last
    #cat("starting current_copy", current,"\n")
    while (current > 100 ){
      count = count +1
      current = current - 100
    }
    while (current < -100){
      count = count +1
      current = current + 100
    }
    if (current > 100) {
      current = current %% 100
    } else if (current < -100) {
      current = current %% 100
    }
    #cat("with dialnumber",dialnumber,"count here is", count,"starting current",current,"\n")
    # if we go over 99 
    if (current > 100 && last != 0){
      count = count +1
      current = current -100
    }
    #or below 0
    if (current <= -1 && last != 0){
      count = count +1
      current = current +100
    }
    if (current%%100 == 0){ 
      count = count +1
      current = 0
    }
   #cat("Final current ist",current,"and count ",count,"\n")
    last = current
  }
  
  cat("The real real pw ist ", count,"because that's how often we pass 0")
  return (count)
} 

# import txt 
small_input = readLines("/Users/mia8425/Documents/Code/Advent of Code 2025/Day 1/input.txt")
real_input = readLines("/Users/mia8425/Documents/Code/Advent of Code 2025/Day 1/real_input.txt")

n_pass0(real_input)

# 4429 is too low
# 4946 is not right (but didn't say too low)
# 7505 falsch
# 6700 is "the right answer for somebody else" but wrong
# 6516 is also not correct
# 10033 also wrong
# 6386 is also the right answer for somebody else but wrong

# test cases
input1 = c("R49","L98") #0
input2 = c("R49","R1") #1
input3 = c("R49","R1", "R1") #1
input4 = c("R49","R1", "L1") #1
input5 = c("L50","L100") #2
input6 = c("R50","R100") # 2
input7 = c("L50","L400") # 5
input8 = c("L50","R400") # 5
input9 = c("R1000") # 10
input10 = c("L50","R50") #1
input11 = c("L68","L30","R48","L5","R60","L55","L1","L99","R14","L82") #6
input12 = c("R10", "L10", "R10") #0
input13 = c("R160", "L10", "R10") #3
input14 = c("L160", "R10", "L10") #3

desired_outputs = c(0,1,1,1,2,2,5,5,10,1,6,0,3,3)
inputs = vector()
res = vector()
for (i in 1:length(desired_outputs)) {
  if (n_pass0(get(paste0("input", i))) == desired_outputs[i]) {
    res = c(res,"TRUE")
  } else {
    res = c(res,"FALSE")
  }
}
# Do we pass all test cases?
all(res == "TRUE")
