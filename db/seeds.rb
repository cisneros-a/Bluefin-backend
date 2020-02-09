# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

                                                                                                                                                                                                
# Property.create(user_id: 2, address: '300 E 33rd St.', rent: '1900', bedrooms: '4', bathrooms: '2.5', sqft: '1900', availability: 1, available_date: '02/14/20', description: "Nice home close to downtown.", latitude: 30.296407, longitude: -97.733632)
# Property.create(user_id: 2, address: '3009 Breeze Terrace, Austin, TX 78722', rent: '1700', bedrooms: '3', bathrooms: '2', sqft: '1400', availability: 1, available_date: '02/18/20', description: "Well kept home close to many places to eat..", latitude: 30.286225, longitude: -97.718267)
# Property.create(user_id: 2, address: '1098 E 15th St, Austin, TX 78702', rent: '2200', bedrooms: '4', bathrooms: '3', sqft: '2100', availability: 0, available_date: 'N/A', description: "Large home close to I-35", latitude: 30.275411, longitude: -97.729056)
# Property.create(user_id: 2, address: '1728 Rogge Ln, Austin, TX 78723', rent: '2000', bedrooms: '4', bathrooms: '2.5', sqft: '1845', availability: 1, available_date: '03/20/20', description: "Pet friendly and great kitchen!", latitude: 30.307208, longitude: -97.695132)  
# Property.create(user_id: 2, address: '1512 Turtle Creek Blvd, Austin, TX 78745', rent: '2050', bedrooms: '3', bathrooms: '2', sqft: '1456', availability: 1, available_date: '03/01/20', description: "Fantastic 3/2 in the heart of South Austin.", latitude: 30.208343, longitude: -97.795155) 
# Property.create(user_id: 3, address: '10798 Pinkney Ln, Austin, TX 78739', rent: '2750', bedrooms: '4', bathrooms: '3', sqft: '2788', availability: 0, available_date: 'N/A', description: "Home is in coveted Vintage Place, with room for everybody.", latitude: 30.189584, longitude: -97.887929) 
# Property.create(user_id: 3, address: '2798 Princeton Dr, Austin, TX 78741', rent: '2400', bedrooms: '3', bathrooms: '2', sqft: '2400', availability: 1, available_date: '04/17/20', description: "Home on a quite street! Do not miss!", latitude: 30.224651, longitude: -97.733720)  
# Property.create(user_id: 3, address: '901 Keith Ln, Austin, TX 78705', rent: '1875', bedrooms: '3', bathrooms: '1', sqft: '1350', availability: 1, available_date: '03/22/20', description: "Lawn maintenance included. Cats Okay, No Dogs.", latitude: 30.291383, longitude: -97.725538) 
# Property.create(user_id: 4, address: '2501 McCullough St, Austin, TX 78703', rent: '2800', bedrooms: '3', bathrooms: '2', sqft: '1776', availability: 1, available_date: '01/07/20', description: "Formal Dining or great flex room. Generous sized bedrooms. Low maintenance front yard.", latitude: 30.300423, longitude: -97.763455)  
# Property.create(user_id: 4, address: '2798 Pinewood Terrace, Austin, TX 78757', rent: '2700', bedrooms: '4', bathrooms: '2', sqft: '2097', availability: 1, available_date: '02/02/20', description: "CLEAN & TONS OF STORAGE SPACE!!!", latitude: 30.350558, longitude: -97.738240) 
# Property.create(user_id: 4, address: '8609 Brookfield Dr, Austin, TX 78758', rent: '1625', bedrooms: '3', bathrooms: '3', sqft: '1180', availability: 0, available_date: 'N/A', description: "Hardwood floors in all Bedrooms, Hallway and Living area. Kitchen has hard tile and separate eating area.", latitude: 30.361464, longitude: -97.711433)  
# Property.create(user_id: 4, address: '7201 Carver Ave, Austin, TX 78752', rent: '1700', bedrooms: '3', bathrooms: '3', sqft: '1900', availability: 1, available_date: '05/13/20', description: "Pictures may be older than 1 year. Pets are considered on a case by case basis.", latitude: 30.330903, longitude: -97.699139)  
# Property.create(user_id: 5, address: '4600 Prock Ln, Austin, TX 78721', rent: '2500', bedrooms: '3', bathrooms: '3', sqft: '1610', availability: 1, available_date: '02/29/20', description: "This home boasts quartz counter tops!", latitude: 30.270319, longitude: -97.691565)  
# Property.create(user_id: 5, address: '6401 Sunnysky Way, Austin, TX 78745', rent: '2450', bedrooms: '3', bathrooms: '3.5', sqft: '1556', availability: 1, available_date: '12/23/19', description: "New community located near many new shops and restaurants.", latitude: 30.195872, longitude: -97.780076)  
# Property.create(user_id: 5, address: '8504 Emerald Hill Dr, Austin, TX 78759', rent: '3200', bedrooms: '4', bathrooms: '2', sqft: '2599', availability: 1, available_date: '05/02/20', description: "This 1960's oasis is minutes from everything by car.", latitude: 30.380410, longitude: -97.753667)  
# Property.create(user_id: 5, address: '6301 Jennings Dr, Austin, TX 78727', rent: '1800', bedrooms: '3', bathrooms: '2', sqft: '1315', availability: 1, available_date: '11//26/19', description: "Vacant home! Come take a look!", latitude: 30.439900, longitude: -97.751312)  
# Property.create(user_id: 6, address: '9298 Cessna Ln, Austin, TX 78717', rent: '1750', bedrooms: '3', bathrooms: '3', sqft: '1840', availability: 1, available_date: '02/18/20', description: "will repaint whole house, update 1st floor to laminate wood flooring", latitude: 30.509456, longitude: -97.743512)  
property1 = Property.create(user_id: 2, address: '1744 Dorch Dr, Pflugerville, TX 78660', rent: '170', bedrooms: '4', bathrooms: '3', sqft: '2699', availability: 1, available_date: '01/28/20', description: "Large home that is well kept! A MUST SEE!", latitude: 30.350558, longitude: -97.887929)  
property1.uploads.attach(
    io: File.open('./public/avatars/home1.png'),
    filename: 'home1.png',
    content_type: 'application/png'
)