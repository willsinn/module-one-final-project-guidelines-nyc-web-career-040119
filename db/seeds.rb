robert = Swimmer.find_or_create_by(name: "robert", age: 16 , gender: 'M')
darren = Swimmer.find_or_create_by(name: "darren", age: 16, gender: 'M')

diana = Swimmer.find_or_create_by(name: "diana", age: 17 , gender: 'F')
sophie = Swimmer.find_or_create_by(name: "sophie", age: 17 , gender: 'F')


free200 = Event.find_or_create_by(name: "200 Freestyle", age: 17 , gender: 'F')
butterfly100 = Event.find_or_create_by(name: "100 Butterfly", age: 16 , gender: 'M')

SwimEventTime.find_or_create_by(swimmer: robert, event: free200, time: 115 )
SwimEventTime.find_or_create_by(swimmer: darren, event: free200, time: 127 )

SwimEventTime.find_or_create_by(swimmer: diana, event: butterfly100, time: 64 )
SwimEventTime.find_or_create_by(swimmer: sophie, event: butterfly100, time: 70 )
