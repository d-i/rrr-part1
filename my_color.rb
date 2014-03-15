require 'serialport'

continue = true

sp = SerialPort.new "/dev/ttyACM0", 9600
sleep 2

def parse_values input
  parts = input.split(" ")

  if parts.count == 1
    parse_hex parts[0]
  else
    parse_rgb parts[0..2]
  end
end

def parse_rgb parts
  rgb = parts.map {|x| x.strip.to_i.chr}
  rgb.join
end

def parse_hex hex
  unless hex[0] == "#"
    hex = "#" + hex
  end

  m = hex.match /#(..)(..)(..)/

  rgb = [m[1], m[2], m[3]].map {|x| x.hex.chr}
  rgb.join
end

def set_color sp, input
  sp.flush_output
  sp.write parse_values(input)
end

while continue do
  print "RGB: "
  input = gets

  if input.strip == "x"
    continue = false
  else
    set_color sp, input
  end

end

sp.write parse_values("0 0 0")
sp.close
