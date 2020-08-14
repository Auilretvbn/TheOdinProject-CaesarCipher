##################################################################
#Implement a caesar cipher that takes in a string and the shift factor and #then outputs the modified string:

#  > caesar_cipher("What a string!", 5)
#  => "Bmfy f xywnsl!"
##################################################################

def is_capital?(char_int)
  char_int >= 65 && char_int <= 90 ? true : false
end

def is_lowercase?(char_int)
  char_int >= 97 && char_int <= 122 ? true : false
end

#Check whether character is alphabetical
def valid?(char_int)
  is_capital?(char_int) || is_lowercase?(char_int) ? true : false
end

def shift_letter(input_char, shift)
  #Normalize shift values that are negative and more than 26
  actual_shift = shift < 0 ? (26 + (shift % -26)) : (shift % 26)
  #Convert Letter into ASCII Number
  char_int = input_char.ord

  if valid?(char_int)
    if is_capital?(char_int)
      #Wrap around for capital letters if necessary
      char_int -= 26 if char_int + actual_shift > 90
    else
      #Wrap around for lower case letter if necessary
      char_int -= 26 if char_int + actual_shift > 122
    end
    #Shift ASCII Number value
    char_int += actual_shift
  end
  #Convert ASCII Number back into Letter
  return char_int.chr
end

#Retrieve phrase and shift each character with method shift_letter
def caesar_cipher(phrase, shift)
  shifted_array = phrase.chars.map {|char| shift_letter(char, shift)}
  new_phrase = shifted_array.join
end

print "Enter a phrase to encrypt: "
phrase = gets.chomp

begin
  print "Enter the value to shift by: "
  shift_value = gets.chomp
  shift_value = Integer(shift_value)
rescue ArgumentError
  puts "Please input a valid integer number."
  retry
end

if shift_value < 0
  shift_value = 26 + (shift_value % -26)
end

puts caesar_cipher(phrase, shift_value)