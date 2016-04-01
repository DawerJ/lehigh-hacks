# -*- coding: utf-8 -*-
"""
Created on Thu Mar 31 17:40:57 2016

@author: Dawer
"""

import RPi.GPIO as gp
import time as time

gp.setmode(gp.BCM)# board numbering scheme bruh

#pins 
in1 = 19
in2 = 26##lets control both motors with the same binary decision stuff but seperate pwm
ewa = 21##change all these pins to whatever you end up using
ewb = 22 #note ew's are the pwm. lets always set them to be the same

speed1 = 0
speed2 = 0 #these need to end up being the same always

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
    gp.cleanup()



