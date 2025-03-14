import RPi.GPIO as GPIO
import time

LED = 4
KEY = 5
brightness = 1

GPIO.setmode(GPIO.BCM)
GPIO.setup(LED, GPIO.OUT)
GPIO.setup(KEY, GPIO.IN)

def isr_key_event(pin):
    print("Key is pressed [%d]" %pin)
    global brightness
    if brightness == 5: brightness = 0
    
    pwm.ChangeDutyCycle(brightness*25)
    brightness += 1
    
    time.sleep(1)


        
pwm = GPIO.PWM(LED, 100)
pwm.start(0)
GPIO.add_event_detect(KEY, GPIO.FALLING, callback=isr_key_event, bouncetime=300)
 
sec = 0
try:
    while True:
        print("sec = %d" %sec)
        sec = sec + 1
        time.sleep(1)
except KeyboardInterrupt:
      pass
finally:
      GPIO.cleanup()
