# -*- coding: utf-8 -*-
"""
Created on Thu Mar 31 17:40:57 2016

@author: Dawer
"""
#in4 - var in1 - right wheel forward
#in3 - var in2 - right wheel back
#in1 - var in2
#in2 - var in1

import RPi.GPIO as gp
import time as time

gp.setmode(gp.BCM)# board numbering scheme bruh

#pins 
in1 = 19
in2 = 17##lets control both motors with the same binary decision stuff but seperate pwm
ewa = 20##change all these pins to whatever you end up using
ewb = 16 #note ew's are the pwm. lets always set them to be the same

s_pin = 2 #servo pin lol

#speed1 = None
#speed2 = None #these need to end up being the same always

###REMOVE THIS SHIT LATER
gp.setup(in1,gp.OUT)
gp.setup(in2,gp.OUT)
gp.setup(ewa,gp.OUT)
gp.setup(ewb,gp.OUT)
gp.setup(s_pin,gp.OUT)
   
speed1 = gp.PWM(ewa,150)#150 hertz pwm
speed2 = gp.PWM(ewb,150)
servo = gp.PWM(s_pin,250)
speed1.start(0)
speed2.start(0)
servo.start(0)
######################

def ini():
    gp.setup(in1,gp.OUT)
    gp.setup(in2,gp.OUT)
    gp.setup(ewa,gp.OUT)
    gp.setup(ewb,gp.OUT)
    
    speed1 = gp.PWM(ewa,150)#150 hertz pwm
    speed2 = gp.PWM(ewb,150)
    speed1.start(0)
    speed2.start(0)
    
#takes input between 0 and 100
def setSpeed(s):
    speed1.ChangeDutyCycle(s)
    speed2.ChangeDutyCycle(s)
    
#does not automatically stop gotta call that shit yourself
def Forward():
    gp.output(in1,True)
    gp.output(in2,False)
    
def Backward():
    gp.output(in1,False)
    gp.output(in2,True)
    
def softStop():
    setSpeed(0)
    
def hardStop():
    gp.output(in1,False)
    gp.output(in2,False)
    setSpeed(0)

def turnOff():
    speed1.stop()
    speed2.stop()
    servo.stop()
    gp.cleanup()

def turnMiddle():
    servo.ChangeFrequency(30)
    servo.ChangeDutyCycle(5)
    time.sleep(.3)
    servo.ChangeDutyCycle(0)

def turnLeft():
    #do some shit
    servo.ChangeFrequency(40)
    servo.ChangeDutyCycle(5)
    time.sleep(.3)
    servo.ChangeDutyCycle(0)
    
def turnRight():
    #do some shit
    servo.ChangeFrequency(20)
    servo.ChangeDutyCycle(5)
    time.sleep(.3)
    servo.ChangeDutyCycle(0)

def repeat():
    Forward()
    time.sleep(5)
    softStop()
    time.sleep(2)
    setSpeed(100)
    Forward()
    time.sleep(5)
    hardStop()
    
#ini()
turnMiddle()
time.sleep(1)
turnLeft()
time.sleep(1)
turnMiddle()
time.sleep(1)
turnRight()
time.sleep(1)

turnOff()

