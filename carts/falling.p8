pico-8 cartridge // http://www.pico-8.com
version 15
__lua__

--my library
function round(num)
 if num-flr(num)<0.5 then
  numr=flr(num)
 else
  numr=ceil(num)
 end
 return numr
end

function maprange(x,a,b,c,d)
 y=(x-a)*((d-c)/(b-a)) + c
 return round(y)
end
--end of my library

--dots={{10,10},{10,50},{50,50},{50,10},{30,5}}


function makedots()
 dots={}
 amount=round(rnd(10))+6
 for i=1, amount do
  add(dots,{a})--sine wave to make the dots into a cicle
 end
 print("hej",64,64,7)
 return dots
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

--game loop
function _init()
 cls()
end

function _update()
 
end

function _draw()
 cls()
 print("mem:"..stat(0),3,113,7)
 print("cpu:"..stat(2),3,121,7)
 cave(makedots())
end

