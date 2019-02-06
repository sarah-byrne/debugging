def encode(plaintext, key)
  cipher = key.chars.uniq + (('a'...'z').to_a - key.chars)
  ciphertext_chars = plaintext.chars.map do |char|
    (65 + cipher.find_index(char)).chr
  end
  ciphertext_chars.join
end

def decode(ciphertext, key)
  cipher = key.chars.uniq + (('a'...'z').to_a - key.chars)
  plaintext_chars = ciphertext.chars.map do |char|
    cipher[65 - char.ord]
  end
  plaintext_chars.join
end

# For ranges, 2 dots goes up to and includes the last item whereas
# 3 dots does not include the last item.   So 'a'...'z' needs to
# be changed to 'a'..'z' in both methods.

# The logic for the encryption looks to be taking the position of the
# character in the array, adding 65 and then using the resulting number
# as an ascii/ordinal value to obtain a new character.    So to decode
# a character, you need to start with the ordinal of the encrypted
# character and then subtract 65 from it to obtain the array position
# of the original character.
