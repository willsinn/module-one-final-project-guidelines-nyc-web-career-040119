robert = Swimmer.find_or_create_by(name: "robert", age: 16 , gender: 'M')
darren = Swimmer.find_or_create_by(name: "darren", age: 16, gender: 'M')
albert = Swimmer.find_or_create_by(name: "albert", age: 16 , gender: 'M')
nick = Swimmer.find_or_create_by(name: "nick", age: 16, gender: 'M')

sam = Swimmer.find_or_create_by(name: "sam", age: 15 , gender: 'M')
rick = Swimmer.find_or_create_by(name: "rick", age: 15, gender: 'M')
william = Swimmer.find_or_create_by(name: "william", age: 15 , gender: 'M')
peter = Swimmer.find_or_create_by(name: "peter", age: 15, gender: 'M')


lucy = Swimmer.find_or_create_by(name: "lucy ", age: 16 , gender: 'F')
sophie = Swimmer.find_or_create_by(name: "sophie", age: 16 , gender: 'F')
rebecca = Swimmer.find_or_create_by(name: "rebecca", age: 16 , gender: 'F')
viona = Swimmer.find_or_create_by(name: "viona", age: 16 , gender: 'F')

leslie =Swimmer.find_or_create_by(name: "leslie", age: 15 , gender: 'F')
patrica =Swimmer.find_or_create_by(name: "patrica", age: 15 , gender: 'F')
cindy =Swimmer.find_or_create_by(name: "cindy", age: 15 , gender: 'F')
diana =Swimmer.find_or_create_by(name: "diana", age: 15 , gender: 'F')




fy_m_16 = Event.find_or_create_by(name: "200 Butterfly", age: 16 , gender: 'M')
fr_m_16 = Event.find_or_create_by(name: "200 Freestyle", age: 16 , gender: 'M')
bk_m_16 = Event.find_or_create_by(name: "200 Backstroke", age: 16 , gender: 'M')
br_m_16 = Event.find_or_create_by(name: "200 Breaststroke", age: 16 , gender: 'M')

fy_f_16 = Event.find_or_create_by(name: "200 Butterfly", age: 16 , gender: 'F')
fr_f_16 = Event.find_or_create_by(name: "200 Freestyle", age: 16 , gender: 'F')
bk_f_16 = Event.find_or_create_by(name: "200 Backstroke", age: 16 , gender: 'F')
br_f_16 = Event.find_or_create_by(name: "200 Breaststroke", age: 16 , gender: 'F')

fy_m_15 = Event.find_or_create_by(name: "200 Butterfly", age: 15 , gender: 'M')
fr_m_15 = Event.find_or_create_by(name: "200 Freestyle", age: 15 , gender: 'M')
bk_m_15 =Event.find_or_create_by(name: "200 Backstroke", age: 15 , gender: 'M')
br_m_15 =Event.find_or_create_by(name: "200 Breaststroke", age: 15 , gender: 'M')

fy_f_15=Event.find_or_create_by(name: "200 Butterfly", age: 15 , gender: 'F')
fr_f_15=Event.find_or_create_by(name: "200 Freestyle", age: 15 , gender: 'F')
bk_f_15=Event.find_or_create_by(name: "200 Backstroke", age: 15 , gender: 'F')
br_f_15=Event.find_or_create_by(name: "200 Breaststroke", age: 15 , gender: 'F')

#MALE with multiple Events
SwimEventTime.find_or_create_by(swimmer: robert, event: fy_m_16, time: 110 )
SwimEventTime.find_or_create_by(swimmer: robert, event: fr_m_16, time: 116 )
SwimEventTime.find_or_create_by(swimmer: robert, event: bk_m_16, time: 121 )
SwimEventTime.find_or_create_by(swimmer: robert, event: br_m_16, time: 111 )

SwimEventTime.find_or_create_by(swimmer: sam, event: fy_m_15, time: 110 )
SwimEventTime.find_or_create_by(swimmer: sam, event: fr_m_15, time: 140 )
SwimEventTime.find_or_create_by(swimmer: sam, event: bk_m_15, time: 121 )
SwimEventTime.find_or_create_by(swimmer: sam, event: br_m_15, time: 136 )

SwimEventTime.find_or_create_by(swimmer: lucy, event: fy_f_16, time: 123 )
SwimEventTime.find_or_create_by(swimmer: lucy, event: fr_f_16, time: 116 )
SwimEventTime.find_or_create_by(swimmer: lucy, event: bk_f_16, time: 121 )
SwimEventTime.find_or_create_by(swimmer: lucy, event: br_f_16, time: 111 )

SwimEventTime.find_or_create_by(swimmer: leslie, event: fy_f_15, time: 130 )
SwimEventTime.find_or_create_by(swimmer: leslie, event: fr_f_15, time: 140 )
SwimEventTime.find_or_create_by(swimmer: leslie, event: bk_f_15, time: 121 )
SwimEventTime.find_or_create_by(swimmer: leslie, event: br_f_15, time: 136 )
