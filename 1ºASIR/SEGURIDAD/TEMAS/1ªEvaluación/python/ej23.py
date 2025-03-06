#!/usr/bin/python
import md5
import sys
if len(sys.argv)>1:
 cifrado=md5.new(sys.argv[1]).hexdigest()
 print(cifrado)
else:
 print("Uso: python "+sys.argv[0]+" palabra")

