pico-8 cartridge // http://www.pico-8.com
version 15
__lua__
amount=25
rr=15
ox=64
oy=64
r=5
c=1
m=0

function _init()
	cls()
 for g=1,10 do
  for i=0,1-1/amount,1/amount do
  
   x=sin(i+m)*rr+ox
   y=cos(i+m)*rr+oy
   
   circfill(x,y,r,c)  
  end
  rr+=10
  r+=1
  m+=rnd(0.5)
  c+=1
 end
end

--function _update60()
	
--end

function _draw()
 cls()
 rr=15
 r=5
 for g=1,10 do
  for i=0,1-1/amount,1/amount do
  
   x=sin(i+m)*rr+ox
   y=cos(i+m)*rr+oy
   
   circfill(x,y,r,c)  
  end
  rr+=10
  r+=1
  m+=rnd(0.5)
  c+=1
 end
end
