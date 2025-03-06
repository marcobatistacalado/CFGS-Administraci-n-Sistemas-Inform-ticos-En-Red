#!/usr/bin/python
import md5
palabra=raw_input("Dime una palabra: ")
cifrado=md5.new(palabra).hexdigest()
print(cifrado)

