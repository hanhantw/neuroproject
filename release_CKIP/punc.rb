# encoding: utf-8
# Usage: $ ruby punc.rb seg.txt seg_punc.txt

input = ARGV[0]
output = ARGV[1]
fin = File.open(input, 'r') 
fout = File.open(output, 'w')

# init
ordered_puncs = []
punc_hash = {}


punc_hash["\""] = "\""
punc_hash[" \""] = "\""
punc_hash["\" "] = "\""
punc_hash['……'] = '…'
ordered_puncs.push("\"")
ordered_puncs.push(" \"")
ordered_puncs.push("\" ")
ordered_puncs.push('……')


special = '「『【〔＜（(<[“'
punc = File.open('punctuation.txt', 'r').readlines.each do |line|
  full = line.split(" ")[0]
  half = line.split(" ")[1]
  if special.include? full #backward attach
    key = full + " "
    key2 = half + " "
  else # forward attach
    key = " " + full
    key2 = " " + half
  end  
  punc_hash[key] = half
  punc_hash[key2] = half
  punc_hash[full] = half
  ordered_puncs.push(key) unless ordered_puncs.include? key
  ordered_puncs.push(key2) unless ordered_puncs.include? key2
  ordered_puncs.push(full) unless ordered_puncs.include? full
end
# puts punc_hash
# puts ordered_puncs.inspect


fin.readlines.each do |line|
  ordered_puncs.each do |key|
    line = line.gsub(key, punc_hash[key])
    # print "key=#{key}, value=#{punc_hash[key]}"
    # print line
  end
  fout.write(line)
end


# note: ＆ ＆ ＆ 沒變成&&&的原因是hash順序是不固定的
# 可能有的檔案hash順序:
# " &"=>"&",所以沒變
# 再來是"＆"=>"&",所以變成& & & 
# 最後是" ＆"=>"&",所以沒變
# 最後輸出& & &
# 但如果順序是" ＆"=>"&", " &"=>"&", "＆"=>"&"就會輸出&&&
