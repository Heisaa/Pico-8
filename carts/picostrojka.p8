pico-8 cartridge // http://www.pico-8.com
version 15
__lua__
function _init()
	cls()
end

function _update()
	
end

function _draw()
	cls()
	
 for i=0,6 do
  x=i*16+14
  print(x)
		circfill(x,64,7,3)
	end
end
