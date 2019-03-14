pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
x=0
y=64

function _init()
	cls(4)
end

function _update()
	x+=0.1
	y+=1
end

function _draw()
	cls(4)
	rectfill(sin(x),y,x+4,y+4,3)
end
