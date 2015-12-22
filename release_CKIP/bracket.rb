# encoding: utf-8
# Usage: $ ruby bracket_punc.rb input.txt output.txt

input = ARGV[0]
output = ARGV[1]
fin = File.open(input, 'r')	
fout = File.open(output, 'w')

fin.readlines.each_with_index do |line, i|
	line = line.strip
	if line == ''
		fout.puts ''
	end

	unless line.gsub("-","").empty?
		newline = ""
		line.split(/ |　/).each do |word|
			mat = word.match(/(.*)\((.*)\)$/)
			if mat
				w, pos = mat.captures
				newline += "#{w} "
			end
		end

	  fout.write("#{newline}\n")
  end
end
