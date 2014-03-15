require 'serialport'

#open a serial connection to the Arduino
#  we sleep for 2 seconds to ensure the connection is ready.
sp = SerialPort.new "/dev/ttyACM0", 9600
sleep 2

# build our RGB bytes as a string
rgb_color = [51.chr, 102.chr, 255.chr].join
rgb_off = [0.chr, 0.chr, 0.chr].join

# send the bytes to show the color
sp.flush_output
sp.write rgb_color

# pause so we can see it
sleep 3

# send the bytes to turn the LED off
sp.flush_output
sp.write rgb_off

sp.close
