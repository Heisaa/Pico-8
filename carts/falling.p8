pico-8 cartridge // http://www.pico-8.com
version 15
__lua__
--my library
function round(num)
 if num-flr(num)<0.5 then
  return flr(num)
 else
  return ceil(num)
 end
end

function maprange(x,a,b,c,d)
 y=(x-a)*((d-c)/(b-a)) + c
 return round(y)
end
--end of my library

--variables
dots={}
timer=0
cavemax=35 --change this to change cavesize
cavemin=cavemax-30 

function makedots()
 dots={}
 amount=round(rnd(5))+6
 for i=0,1-1/amount,1/amount do
  --add(dots,{rnd(25)+(sin(i)*40+54),rnd(25)+cos(i)*40+54})--sine wave to make the dots into a "cicle"
  add(dots,{
      sin(i)*(rnd(cavemax-cavemin)+cavemin)+64,
      cos(i)*(rnd(cavemax-cavemin)+cavemin)+64
      })
 end
 --return dots
end

function cave(arr)
 --draw the cave from coordinats
 for i=1,#arr do
  if i==#arr then
   line(arr[i][1],arr[i][2],arr[1][1],arr[1][2],9)
  else
   line(arr[i][1],arr[i][2],arr[i+1][1],arr[i+1][2],9)
  end
 end
end

function growcave()
 for i=1,#dots do
  dots[i][1]*=sin(maprange(i,1,#dots,0,1-1/amount))*0.1+64
  dots[i][2]*=cos(maprange(i,1,#dots,0,1-1/amount))*0.1+64
 end
end

--game loop
function _init()
 cls()
 makedots()
end

function _update()
 --[[if timer==15 then
  makedots()
  timer=0
  end
 timer+=1]]
 growcave()
end

function _draw()
 cls()
 cave(dots)

 --debug
 print("mem:"..stat(0),3,113,7)
 print("cpu:"..stat(2),3,121,7)
end

