local function run(msg,rsala)

if rsala[1] == "زخرفه" then
redis:setex(boss..":DEZ:"..msg.from.id,1000,true)
return "💭*¦* آرسـل لي آلآسـم آلمـرآد زخرفتهہ‏‏آ  ..."
end
if redis:get(boss..":DEZ:"..msg.from.id) then
if string.len(rsala[1]) > 35 then return "💢¦ لا يمكن زخرفه اكثر  25 حرف 🙌" end
redis:del(boss..":DEZ:"..msg.from.id)
local zhrfa = https.request("https://th3boss.com/zhrf/?Name="..URL.escape(rsala[1]))
local jz = JSON.decode(zhrfa)
local text = ""
for k,v in pairs(jz.Zhrfa) do
text = text..k.."ـ  `"..v.."` \n\n"
end
return text.."\n 🚸*¦* فقط اضغط ع الاسم☝🏿الذي تريده وسوف يتم النسخ تلقائيا ..."
end

end
return{
patterns = {
 '^(زخرفه)$',
 '^(.*)$',
},
run = run
}

