# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)

#USERS SEEDS
User.destroy_all

GuestUser = User.create!(username: "GuestUser", password: "password")


MilesHobby = User.create!(username: "MilesHobby", password: "password")
SeanPerfecto = User.create!(username: "SeanPerfecto", password: "password")
JustinJackson = User.create!(username: "JJackson", password: "password")
Insomniac = User.create!(username: "InsomniacEvents", password: "password")
TechCompanySF = User.create!(username: "TechCompanySF", password: "password")
PartyPeople = User.create!(username: "PartyPeople", password: "password")
ArtSF = User.create!(username: "ArtSF", password: "password")
BigSportsBrand = User.create!(username: "BigSportsBrand", password: "password")

Category.destroy_all

Sports = Category.create!(name: "Sports") #1
Music = Category.create!(name: "Music") #2
Arts = Category.create!(name: "Arts") #3
Business = Category.create!(name: "Business") #4
Parties = Category.create!(name: "Parties") #5
Classes = Category.create!(name: "Classes") #6
Food = Category.create!(name: "Food & Drink") #7
Other = Category.create!(name: "Other")

Event.destroy_all
EventCategory.destroy_all
Bookmark.destroy_all
Ticket.destroy_all

event22 = Event.create!(title: "San Francisco Wine Tasting",
                      full_description: "One thread weaves through this tasting -- a desire to bring you the best wines. This tasting is about the breadth of wineries from across the state, an enormous range of varietals, and wine growing appellations from all over the state.  All Family Winemakers tastings focus on wineries that are small (generally under 5000 cases), have limited marketing outreach, and will be represented by family members.  There will be wineries at this event pouring with Family Winemakers for the first time.  It's an opportunity to expand your palate. So many drinks to pick from. You can sample new releases from your classic favorites and from wineries just selling their first vintages.  CHECK out varietals you've never heard of or your best-loved Cabs and Chardonnays.  This well-respected tasting is a once-a-year opportunity to tour and taste California's wine country under one place.",
                      image_url: "https://res.cloudinary.com/events4u/image/upload/v1495488529/tastingslide_gr2jx2.png",
                      date: "2017/8/20",
                      price: 100,
                      venue: "Cruse Terminal at Pier 27",
                      street_address: "The Embarcadero",
                      city_state_zip: "San Francisco, CA 94111",
                      host_id: MilesHobby.id)

EventCategory.create!(event_id: event22.id, category_id: Food.id)


event2 = Event.create!(title: "Pancakes & Booze Art Show",
                      full_description: "San Francisco's Largest Underground Art Show featuring:\n
                        -100+ Emerging Artists\n
                        -Live Body Painting\n
                        -Live DJ sets\n
                        -Live Art\n
                        -FREE Pancake Bar\n
                        -21+ EVENT\n
                        $20 Line Jumper (limited quantities)\n
                        $10 Door.",
                      date: "2017/08/27",
                      image_url: "https://res.cloudinary.com/events4u/image/upload/v1495487409/pancakes.jpg",
                      venue: "Mezzanine",
                      street_address: "444 Jessie St.",
                      city_state_zip: "San Francisco, CA 94105",
                      host_id: User.find_by(username: "MilesHobby").id)

EventCategory.create!(event_id: event2.id, category_id: Parties.id)
EventCategory.create!(event_id: event2.id, category_id: Music.id)
EventCategory.create!(event_id: event2.id, category_id: Food.id)

event3 = Event.create!(title: "Outside Lands",
                      full_description: "The 10th annual Outside Lands Festival will take place in San Francisco’s historic Golden Gate Park August 11 – 13. Festival organizers Another Planet Entertainment, Superfly and Starr Hill have just detailed the lineup for this year’s event which will be headlined by The Who, Metallica and Gorillaz. Lorde, Fleet Foxes, Queens of the Stone Age, alt-J, Solange, A Tribe Called Quest, Little Dragon, Belle and Sebastian, The Avett Brothers, Above & Beyond, Tove Lo, Action Bronson and Thundercat join the headliners at the top of this year’s lineup. Rebelution, Dawes, Real Estate, Temples, Warpaint, Khruangbin, Lee Fields & The Expressions and Lawrence are also among the acts confirmed for Outside Lands ’17. This is going to be a fantastic concert with life changing musical acts.",
                      image_url: "https://res.cloudinary.com/events4u/image/upload/v1495487442/outside-lands1_whiddw.jpg",
                      date: "2017/8/11/",
                      price: 500.00,
                      venue: "Golden Gate Park",
                      street_address: "501 Stanyan St",
                      city_state_zip: "San Francisco, CA 94117-1898",
                      host_id: Insomniac.id)

EventCategory.create!(event_id: event3.id, category_id:Music.id)
EventCategory.create!(event_id: event3.id, category_id:Food.id)

event4 = Event.create!(title: "Imagine Dragons Evolve Tour",
                      full_description: "Evolve (stylized as ƎVOLVE) is the upcoming third studio album by American rock band Imagine Dragons, scheduled to be released on June 23, 2017 through KIDinaKORNER and Interscope Records. The album is the band's new material follow-up to their second studio album, Smoke + Mirrors. After the release of Smoke + Mirrors and its respective world tour, a self-imposed hiatus for 2016 and cryptic messages from the band through their social media gained anticipation for their third album. The album was finally announced on May 9, with the initiation of the album's pre-order. In comparison to Night Visions and Smoke + Mirrors, frontman Dan Reynolds explained that the album will be an 'evolution for Imagine Dragons' This is going to be a fantastic concert. There will be a lot of new music!",
                      image_url: "https://www.amwaycenter.com/assets/img/ImagineDragons_WEB_EventImage-897067549b.jpg",
                      date: "2017/08/11",
                      price: 50.00,
                      venue: "Shoreline Amphitheatre",
                      street_address: "1 Amphitheatre Parkway",
                      city_state_zip: "Mountain View, CA, US",
                      host_id: Insomniac.id)

EventCategory.create!(event_id: event4.id, category_id:Music.id)

event1 = Event.create!(title: "Warriors vs. Cavs NBA Finals Game 7",
                      full_description: "Watch as Steph Curry takes on Lebron James in the epic ending to a trilogy. This sports event is a can't miss for basketball fans.",
                      image_url: "https://res.cloudinary.com/events4u/image/upload/v1495487301/i_ap8ujj.jpg",
                      date: "2017/06/06",
                      price: 300.00,
                      venue: "Oracle Arena",
                      street_address: "7000 Coliseum Way",
                      city_state_zip: "Oakland, CA 94621",
                      host_id: User.find_by(username: "SeanPerfecto").id)

EventCategory.create!(event_id: event1.id, category_id: Sports.id)

event5 = Event.create!(title: "Bruno Mars: 24K Magic World Tour",
                      full_description: "The North American leg will follow kicking off July 15 at T-Mobile Arena in Las Vegas and then visit over 45 cities across the U.S. including three stops in Northern California including dates at Golden 1 Center in Sacramento Tuesday, July 18. For complete details, please visit The 24K Magic World Tour official homepage at https://www.brunomars.com. Tickets for The 24K Magic World Tour, produced by Live Nation, go on sale 10am on Monday, November 21. The 24K Magic World Tour celebrates Mars' eagerly anticipated new album, 24K Magic, set to arrive worldwide on Friday, November 18 on Atlantic Records. Pre-orders are available now via the Bruno Mars Official Store, with all pre-orders from music store receiving early access to tickets for The 24K Magic Tour. This is going to be a fantastic concert.",
                      image_url: "https://res.cloudinary.com/events4u/image/upload/v1495490107/maxresdefault_xt8kli.jpg",
                      date: "2017/6/18/",
                      price: 75.00,
                      venue: "Golden 1 Center",
                      street_address: "500 David J Stern Walk",
                      city_state_zip: "Sacremento, CA 95814",
                      host_id: Insomniac.id)

EventCategory.create!(event_id: event5.id, category_id:Music.id)

event6 = Event.create!(title: "Ed Sheeran: The Divide World Tour",
                      full_description: "2017 sees Ed Sheeran taking his blockbuster studio album Divide on tour across North America. The British artist's status as one of the biggest singer-songwriters and musical acts out at the moment is certainly cemented in this, his third album, which contains the mega-hit singles Shape Of You, and Castle On The Hill. It's seen him topping the charts across the world and infuses his delicate, acoustic pop with even more pronounced R&B flourishes. This is going to be a fantastic concert.",
                      image_url: "https://res.cloudinary.com/events4u/image/upload/v1495487511/sheeran.png",
                      date: "2017/6/18/",
                      price: 35.00,
                      venue: "Oracle Arena",
                      street_address: "70000 Coliseum Way",
                      city_state_zip: "Oakland, CA 95814",
                      host_id: Insomniac.id)

EventCategory.create!(event_id: event6.id, category_id:Music.id)

event21 = Event.create!(title: "Eat Drink SF",
                      full_description: "Eat Drink SF is San Francisco’s premier annual food, wine, drinks and spirits festival that celebrates the Bay Area’s world-class chefs and restaurants.
Do you dream of caviar bumps and foie gras laybacks? Are you committed to eating your way through the Essential 38? Does a really good meal bring you a deep level of nearly indescribable satisfaction? Fancy yourself a light-weight food critic or devour the musings of the pros? Keep tabs on which kitchen to find the top Bay Area chefs? If you answered yes to any or all of these questions, it sounds like you, friend, are our people. And as our people, there is a good chance that you’ve already attended Eat Drink SF (fka SF Chefs) as the festival is entering its ninth year. This is the food festival for you.",
                      image_url: "https://res.cloudinary.com/events4u/image/upload/v1495488268/eatdrinksf.jpg",
                      date: "2017/8/25",
                      venue: "Fort Mason Center",
                      street_address: "2 Marina Blvd",
                      city_state_zip: "San Francisco, CA 94123",
                      host_id: PartyPeople.id)

EventCategory.create!(event_id: event21.id, category_id: Food.id)



event29 = Event.create!(title: "Midnight Cruise WhiteOut",
                      full_description: "Take a 3 Hour Cruise aboard the Fume Blanc of Commodore Cruises a 4 million dollar, 340 passanger, luxury vessel. It is a Hudson Steamboat Replica with 3 floors, 2 DJs, bumping music, and amazing views of the Bay Bridge, Golden Gate Bridge, Nob Hill, Alcatraz, and the Spectacular San Francisco Skyline. This season, from Memorial Day Weekend in May to September you'll have the chance to board the Fume Blanc and enjoy an entertaining cruise like none other. Get your tickets now and prepare for an experience you won't forget, but will most likely want to indulge in again. Lots of music and fun in this epic party!",
                      image_url: "https://res.cloudinary.com/events4u/image/upload/v1495490783/https_proxy_tnbzjy.jpg",
                      price: 49,
                      date: "2017/8/12",
                      venue: "Pier 40",
                      street_address: "8 The Embarcadero Street",
                      city_state_zip: "San Francisco, CA 94107",
                      host_id: PartyPeople.id)
EventCategory.create!(event_id: event29.id, category_id: Parties.id)


event9 = Event.create!(title: "Fillmore Jazz Festival",
                      full_description: "From sunup to sundown, visitors can groove to the sounds of live music from multiple stages, browse the offerings of over 12 blocks of fine art and crafts and enjoy gourmet food and beverages. Asian to Cajun, paintings to pottery, old favorites and new directions, the Fillmore jazz festival is not to be missed. Lots of music in fun in this great party.",
                      image_url: "https://res.cloudinary.com/events4u/image/upload/v1495487592/jazz-fest-fillmore_kq9xlw.jpg",
                      date: "2017/7/1",
                      venue: "Filmore District",
                      price: 15,
                      street_address: "Filmore St and Geary St",
                      city_state_zip: "San Francisco, CA 94115",
                      host_id: PartyPeople.id)

EventCategory.create!(event_id: event9.id, category_id:Music.id)
EventCategory.create!(event_id: event9.id, category_id:Parties.id)

event10 = Event.create!(title: "San Francisco Shakespeare Fesitval",
                      full_description: "Local and national playwrights and professional directors, dramaturgs and designers work with the Bay Area’s top actors to engage in an in-depth development process of six new plays. This festival will feature acts such as Romeo and Juliet. The work leads to two public staged readings of each play.",
                      image_url: "https://res.cloudinary.com/events4u/image/upload/v1495487627/shakespeare%20festival.jpg",
                      date: "2017/7/25",
                      venue: "San Francisco Shakespeare",
                      street_address: "1560 Davidson Ave",
                      city_state_zip: "San Francisco, CA 94125",
                      host_id: MilesHobby.id)

EventCategory.create!(event_id: event10.id, category_id: Arts.id)


event11 = Event.create!(title: "San Francisco Marathon",
                      full_description: %Q(Enjoy the amazing city of San Francisco by taking part in one of the world's great marathons. The USAT&F Certified course is a "best of San Francisco" tour and includes a loop over the Golden Gate Bridge. Choose from running the marathon, half marathon, progressive marathon, 5K run/walk races or really take on the challenge with the “Worth the Hurt” 52.4 double marathon. This will be a terrific sports event with a great crowd!),
                      image_url: "https://res.cloudinary.com/events4u/image/upload/v1495487660/sfmarathon_buhlsd.jpg",
                      date: "2017/7/23",
                      venue: "Ferry Building",
                      street_address: "One Ferry Building",
                      city_state_zip: "San Francisco, CA 94111",
                      host_id: User.find_by(username: "SeanPerfecto").id)

EventCategory.create!(event_id: event11.id, category_id:Sports.id)



event13 = Event.create!(title: "Fourth of July Waterfront Festival",
                      full_description: %Q(Dazzling fireworks, local bands, food, music, arts and crafts ignite this annual waterfront party. Fireworks begin around 9:30 p.m. Dress warmly. This will be a really fun time!),
                      image_url: "https://res.cloudinary.com/events4u/image/upload/v1495487775/san-fransisco-firework1_btndvp.jpg",
                      date: "2017/7/4",
                      venue: "Pier 39",
                      street_address: "Beach Street and The Embarcadero",
                      city_state_zip: "San Francisco, CA 94133",
                      host_id: User.find_by(username: "SeanPerfecto").id)

EventCategory.create!(event_id: event13.id, category_id:Parties.id)

event7 = Event.create!(title: "Cazzette Live",
                      full_description: "SELECT Entertainment welcomes back one of favorite residents, CAZZETTE, to Love + Propaganda on July 21st! The last two shows with Cazzette have sold out and we expect this show to be just as big! Cazzette have built up a solid track record of doing things their own way, making music their own way. With a reputation for topping the Billboard Dance Charts, frequenting Hype Machines top 10 and more than 220m collective streams to their name, the Stockholm-based duo continues to blend genres and burst comfort zones across the board with their highly evolved take on the modern dance music landscape. Opening set by Waev. For table reservations email infoselectsf@gmail.com or call 650.274.5736 21+",
                      image_url: "https://res.cloudinary.com/events4u/image/upload/v1495487538/cazzette.jpg",
                      date: "2017/6/21",
                      price: 35.00,
                      venue: "Love & Propaganda",
                      street_address: "85 Campton Place",
                      city_state_zip: "San Francisco, CA 94108",
                      host_id: Insomniac.id)

EventCategory.create!(event_id: event7.id, category_id:Music.id)

event14 = Event.create!(title: "Giants vs. Marlins",
                      full_description: %Q(The San Francisco Giants take on the Miami Marlins in this MLB matchup at AT&T Park. This sports event is a can't miss for baseball fans.),
                      image_url: "https://res.cloudinary.com/events4u/image/upload/v1495487795/San-Francisco_sqrrkm.jpg",
                      date: "2017/7/23",
                      venue: "AT&T Parkway",
                      price: 40,
                      street_address: "24 Willie Mays Plaza",
                      city_state_zip: "San Francisco, CA 94107",
                      host_id: BigSportsBrand.id)

EventCategory.create!(event_id: event14.id, category_id:Sports.id)

event15 = Event.create!(title: "49ers vs. Panthers",
                      full_description: %Q(Come out to opening night, when the San Francisco 49ers take on the Carolina Panthers. This sports game is not one to miss for football fans.),
                      image_url: "https://res.cloudinary.com/events4u/image/upload/v1495487814/49ers-web-sized1_ewy1st.jpg",
                      date: "2017/9/10",
                      venue: "Levi Stadium",
                      price: 65,
                      street_address: "4900 Marie P DeBartolo Way",
                      city_state_zip: "Santa Clara, CA 95054",
                      host_id: Insomniac.id)

EventCategory.create!(event_id: event15.id, category_id:Sports.id)


event16 = Event.create!(title: "The Design Gurus Summit",
                      full_description: %Q(Come learn from top Silicon Valley designers, thinkers and thought leaders who will share their insights on topics including tech, product design, user experience design,  design for emerging platforms, branding, marketing, creativity, entrepreneurship, design-driven startups, creative inspiration, and more.
                      A full-day event of both keynotes and panels from 8:30 am to 5:00 pm. This year we have upgraded to the beautiful Kanbar Hall at the San Francisco Jewish Community Center. This is a world-class facility with a true stage and a professional audio visual team.),
                      image_url: "https://res.cloudinary.com/events4u/image/upload/v1495487833/dgslogo_r0myee.png",
                      date: "2017/9/19",
                      venue: "JCCSF",
                      price: 185,
                      street_address: "3200 California Street",
                      city_state_zip: "San Francisco, CA 94118",
                      host_id: User.find_by(username: "GuestUser").id)

EventCategory.create!(event_id: event16.id, category_id:Business.id)

event17 = Event.create!(title: "2017 CRE // Tech Intersect San Francisco",
                      full_description: %Q(CRE// Tech is the center of innovation for the commercial real estate industry. We are committed to bringing innovation and connectivity to the commercial real estate and technology sectors.),
                      image_url: "https://res.cloudinary.com/events4u/image/upload/v1495487865/cre.png",
                      date: "2017/6/08",
                      venue: "One Jones SF",
                      price: 185,
                      street_address: "1 Jones Street",
                      city_state_zip: "San Francisco, CA 94102",
                      host_id: TechCompanySF.id)

EventCategory.create!(event_id: event17.id, category_id:Business.id)

event18 = Event.create!(title: "AI & The Future of Privacy",
                      full_description: %Q(Join us for this 3-night after work series to learn how to create respectful, accessible, and secure experiences for the technology of the future. We've been meeting with AI engineers, hardware developers, security experts, hackers, and designers to assemble our program. Stay tuned as we add to our lineup. This could be a life changing seminar.),
                      image_url: "https://res.cloudinary.com/events4u/image/upload/v1495487899/ai.png",
                      date: "2017/7/10",
                      venue: "Galvanize",
                      price: 125,
                      street_address: "44 Tehama St",
                      city_state_zip: "San Francisco, CA 94107",
                      host_id: TechCompanySF.id)

EventCategory.create!(event_id: event18.id, category_id:Business.id)
EventCategory.create!(event_id: event18.id, category_id:Classes.id)

event19 = Event.create!(title: "San Francisco Career Fair & Job Fair",
                      full_description: %Q(The 18th Annual San Francisco Career Fair - Sales & Professional Job Fair
Wednesday - July 26,2017 **11:30 am-2:00pm in Burlingame
Meet, sit down and interview with Fortune 500 employers at The San Francisco Sales & Professional Career Fair. Professional Dress (suit & tie or business suit) Bring plenty of resumes.
Industries represented at our Career Fairs: Sales, Inside Sales, Outside Sales, Retail, Financial, B2B Sales, Customer Service, Healthcare, Industrial, Consulting, Customer Service, Security Sales, Pharmaceutical, Recruiting, Insurance, Retail, Telecommunications, Logistics, Solar, Marketing, Management, Medical Device and more ),
                      image_url: "https://res.cloudinary.com/events4u/image/upload/v1495487932/job%20fair.jpg",
                      date: "2017/7/26",
                      venue: "Embassy Suites By Hilton, SF ",
                      street_address: "150 Anza Blvd",
                      city_state_zip: "Burlingame, Ca 94104",
                      host_id: TechCompanySF.id)

EventCategory.create!(event_id: event19.id, category_id:Business.id)

event20 = Event.create!(title: "The Renegade Craft Fair",
                      full_description: "The best makers of handmade goods from the Bay Area and beyond assemble for this free-to-attend marketplace for indie-craft culture, featuring interactive workshops. Come to this festival and be sure to bring other art lovers! ",
                      image_url: "https://res.cloudinary.com/events4u/image/upload/v1495487968/facebook_logo_okxao6.png",
                      date: "2017/7/15",
                      venue: "Fort Mason Center",
                      street_address: "2 Marina Blvd",
                      city_state_zip: "San Francisco, CA 94123",
                      host_id: MilesHobby.id)

EventCategory.create!(event_id: event20.id, category_id:Arts.id)


event23 = Event.create!(title: "App Academy Web Development Intensive Bootcamp",
                      full_description: "Over 12 weeks, you'll learn all the skills needed to begin a career as a web developer. Prior programming experience isn't required, but you’ll need lots of tenacity and a passion for building cool stuff. Over 1,700 App Academy grads work as developers at top tech companies like Google, Facebook, Uber and more, and earn an average salary of $105,000 in SF and $89,000 in NYC.",
                      image_url: "https://res.cloudinary.com/events4u/image/upload/v1495488745/appacademylogo_yellc4.png",
                      date: "2017/9/21",
                      price: 18000,
                      venue: "App Academy",
                      street_address: "160 Spear Street",
                      city_state_zip: "San Francisco, CA 94105",
                      host_id: TechCompanySF.id)

EventCategory.create!(event_id: event23.id, category_id: Classes.id)

event24 = Event.create!(title: "Galvanize Data Science Full Time Program",
                      full_description: "Data Science is one of the most transformative fields in business and tech. This immersive education program offers students cutting edge curriculum, expert instructors with industry experience, and hands-on learning environment to transform into full-fledged data scientists.",
                      image_url: "https://res.cloudinary.com/events4u/image/upload/v1495489143/galvanize.jpg",
                      date: "2017/10/14",
                      venue: "Galvanize",
                      price: 12000,
                      street_address: "44 Tehama St.",
                      city_state_zip: "San Francisco, CA 94105",
                      host_id: TechCompanySF.id)

EventCategory.create!(event_id: event24.id, category_id: Classes.id)

event25 = Event.create!(title: "Sunrise Yoga on the Beach",
                      full_description: "Hatha is a potent alignment-oriented practice that emphasizes the forms and actions within yoga postures. This class is based on physical postures (asanas), deep breathing, mindfulness and listening to the body.",
                      image_url: "https://res.cloudinary.com/events4u/image/upload/v1495489533/beach-yoga-sunrise_oadwnv.jpg",
                      date: "2017/7/29",
                      venue: "Baker Beach",
                      price: 10,
                      street_address: "1504 Pershing Dr",
                      city_state_zip: "San Francisco, CA 94129",
                      host_id: GuestUser.id)

EventCategory.create!(event_id: event25.id, category_id: Classes.id)
EventCategory.create!(event_id: event25.id, category_id: Sports.id)

event26 = Event.create!(title: "Summer Of Love Dance Party",
                      full_description: "What’s more counterculture than a dance party in a gothic cathedral? Come to Grace Cathedral to celebrate the 50th anniversary of the Summer of Love by dancing in the aisles to classics from 1967 and modern tunes inspired by the artistic spirit of that era—courtesy of the Make It Funky DJs and Mad Alchemy’s liquid light show. Be sure to wear flowers in your hair and get ready to enjoy the sweet music!",
                      image_url: "https://res.cloudinary.com/events4u/image/upload/v1495490559/catehdral.jpg",
                      date: "2017/7/22",
                      venue: "Grace Cathedral",
                      price: 5,
                      street_address: "1100 California Street",
                      city_state_zip: "San Francisco, CA 94108",
                      host_id: GuestUser.id)

EventCategory.create!(event_id: event26.id, category_id: Parties.id)

event8 = Event.create!(title: "Chocolate and Art Show",
                      full_description: "We would like to cordially invite you to Chocolate and Art Show San Francisco, Thursday June 22th, and Friday June 23th. Indulge yourself in some of SF's finest up-and-coming artists, photographers and creators! There is something for every body including live body painting, vendors, live music, food, art, face-painting, and free chocolate!",
                      image_url: "https://res.cloudinary.com/events4u/image/upload/v1495487564/chocolate.jpg",
                      date: "2017/6/23",
                      price: 10.00,
                      venue: "SOMAArts Cultural Center",
                      street_address: "934 Brannan Street",
                      city_state_zip: "San Francisco, CA 94103",
                      host_id: User.find_by(username: "SeanPerfecto").id)

EventCategory.create!(event_id: event8.id, category_id:Arts.id)
EventCategory.create!(event_id: event8.id, category_id:Food.id)

event27 = Event.create!(title: "Dimensions: An Immersive Digital Art Exhibition",
                      full_description: "Mirus Gallery is proud to present itʼs first digital art exhibition featuring a collection of projection mapped environments, VR worlds, 3D printed pieces, and a series of curated still art work brought to you by the leaders in immersive experiences.",
                      image_url: "https://res.cloudinary.com/events4u/image/upload/v1495491103/Mirus.jpg",
                      date: "2017/7/25",
                      venue: "Mirus Gallery",
                      street_address: "540 Howard Street",
                      city_state_zip: "San Francisco, CA 94105",
                      host_id: ArtSF.id)

EventCategory.create!(event_id: event27.id, category_id: Arts.id)

event12 = Event.create!(title: "Japan Film Festival of San Francisco",
                      full_description: %Q(Japan Film Festival of San Francisco is the first and only fully dedicated annual Japanese film event in the San Francisco Bay Area. Showcasing the latest in anime, live-action and documentaries straight from Japan, this week-long festival will take place in San Francisco's historic Japantown.),
                      image_url: "https://res.cloudinary.com/events4u/image/upload/v1495487748/JFF-Banner_q6wc7w.jpg",
                      date: "2017/7/31",
                      venue: "New People Cinema",
                      price: 10,
                      street_address: "1746 Post Street",
                      city_state_zip: "San Francisco, CA 94115",
                      host_id: User.find_by(username: "GuestUser").id)

EventCategory.create!(event_id: event12.id, category_id:Arts.id)

event28 = Event.create!(title: "ArtSpan Artist Mixer",
                      full_description: "Mix, Mingle, and Make! Meet artists and art enthusiasts, check out the letterpress print studio and try your hand at pulling letterpress prints using wood type!
                      Interactive art activies to engage in!
                      Light refreshments and snacks will be served.",
                      image_url: "https://res.cloudinary.com/events4u/image/upload/v1495491380/Scrap_20mixer_qt0q2w.jpg",
                      date: "2017/9/13",
                      venue: "SF Center for the Book",
                      street_address: "375 Rhode Island Street",
                      city_state_zip: "San Francisco, CA 94103",
                      host_id: GuestUser.id)

EventCategory.create!(event_id: event28.id, category_id: Arts.id)

event32 = Event.create!(title: "Classic Hip-Hop Night",
                      full_description: "MY MELODY classic hip-hop night with DJ Dave Paul at Public Works. All your favorite old school & golden era rap songs from the twenty year period of 1979-1999 musical era. ",
                      image_url: "https://res.cloudinary.com/events4u/image/upload/v1495492320/https_3A_2F_2Fcdn.evbuc.com_2Fimages_2F31293101_2F7350857313_2F1_2Foriginal_qbbcio.jpg",
                      date: "2017/7/25",
                      venue: "Public Works",
                      street_address: "161 Erie Street",
                      city_state_zip: "San Francisco, CA 94103",
                      host_id: PartyPeople.id)

EventCategory.create!(event_id: event32.id, category_id: Arts.id)

event33 = Event.create!(title: "Oakland Raiders vs. New England Patriots",
                      full_description: "Watch the Oakland Raiders take on the New England patriots in this epic sports match up. This will be a great day for football fans in the Bay Area as the defending champs come to Oakland for a huge game.",
                      image_url: "https://res.cloudinary.com/events4u/image/upload/v1495646228/oakland-raiders-wallpaper-hd-wallpaper-oakland-raider-raiders-players-stadium-skull-fans-helmet-hd_sffmrk.jpg",
                      date: "2017/10/3",
                      venue: "O.co Coliseum",
                      price: 70,
                      street_address: "7000 Coliseum Way",
                      city_state_zip: "Oakland, CA 94621",
                      host_id: BigSportsBrand.id)

EventCategory.create!(event_id: event33.id, category_id: Sports.id)

event34 = Event.create!(title: "SF Kite Festival",
                      full_description: "Bring your kites to the SF kite festival, where people of all ages are welcome! There will be food, drink, and lots of good times. If you are looking for some family fun, this is the place to come!",
                      image_url: "https://res.cloudinary.com/events4u/image/upload/v1495646864/singlelinekites_x1f7eh.png",
                      date: "2017/7/13",
                      venue: "Dolores Park",
                      street_address: "Dolores St & 19th St,",
                      city_state_zip: "San Francisco, CA 94114",
                      host_id: BigSportsBrand.id)

EventCategory.create!(event_id: event34.id, category_id: Parties.id)
EventCategory.create!(event_id: event34.id, category_id: Food.id)
EventCategory.create!(event_id: event34.id, category_id: Arts.id)

event35 = Event.create!(title: "4th Annual SF Bike Race",
full_description: "Gear up for the 4th annual remdeption of the famous sf bike race! There will be snacks and beverages sold for spectators. Come support your local sports athletes in this outdoors event!",
image_url: "https://res.cloudinary.com/events4u/image/upload/v1495665579/6aa87c4d-64f2-4de0-8e52-b620c1121458_c0ijzg.jpg",
date: "2017/6/30",
venue: "Ferry Building",
street_address: "1 Sausalito",
city_state_zip: "San Francisco, CA 94111",
host_id: BigSportsBrand.id)

EventCategory.create!(event_id: event34.id, category_id: Sports.id)

event36 = Event.create!(title: "Dog Training Classes",
full_description: "I am offering dog training classes. I will get your dogs into shape! I will also considering accepting other pets, such as lizards, cats, or parrots into my pet academy.",
image_url: "https://res.cloudinary.com/events4u/image/upload/v1495670051/training3_kmq1r0.jpg",
date: "2017/7/11",
venue: "Jeffrey's Natural Pet Foods",
price: 60,
street_address: "1841 Powell Street",
city_state_zip: "San Francisco, CA 94133",
host_id: SeanPerfecto.id)

EventCategory.create!(event_id: event36.id, category_id: Classes.id)

event37 = Event.create!(title: "Dream League 2017 Basketball Tournament",
full_description: "$55 for individuals, $440 for teams, then also each team is responsible for $35 cash game fee paid to ref/scorekeeper at the gym, prior to each tipoff. DETAILS: https://www.drmlg.org/leagues/sundays/
Signup and pay your spot in full by Mon 1/16 and get 25% OFF NIKE!!",
image_url: "https://res.cloudinary.com/events4u/image/upload/v1495670051/training3_kmq1r0.jpg",
date: "2017/12/1",
venue: "Gateway High School",
price: 55,
street_address: "1841 Powell Street",
city_state_zip: "San Francisco, CA 94133",
host_id: BigSportsBrand.id)

EventCategory.create!(event_id: event37.id, category_id: Sports.id)

#EVENT_CATEGORY_SEEDS
Bookmark.create!(user_id: GuestUser.id, event_id: event1.id)
Bookmark.create!(user_id: GuestUser.id, event_id: event29.id)
Bookmark.create!(user_id: GuestUser.id, event_id: event9.id)
Bookmark.create!(user_id: GuestUser.id, event_id: event13.id)
Bookmark.create!(user_id: GuestUser.id, event_id: event11.id)
Bookmark.create!(user_id: GuestUser.id, event_id: event21.id)
Bookmark.create!(user_id: GuestUser.id, event_id: event6.id)
Ticket.create!(user_id: GuestUser.id, event_id: event22.id)
Ticket.create!(user_id: GuestUser.id, event_id: event3.id)
Ticket.create!(user_id: GuestUser.id, event_id: event27.id)
Ticket.create!(user_id: GuestUser.id, event_id: event4.id)
