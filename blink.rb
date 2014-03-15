require 'pi_piper'
include PiPiper

led_pin = PiPiper::Pin.new(pin: 18, direction: out)

led_pin.off

0.step(2) do
  led_pin.on
  sleep 0.5
  led_pin.off
  sleep 0.5
end
