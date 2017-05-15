{
  currentUser: {
    id: 1,
    username: "miles-hobby"
  },
  forms: {
    signUp: {errors: []},
    logIn: {errors: []},
    createEvent: {errors: ["title can't be blank"]}
  },
  events: {
    1: {
      title: "NBA Finals Game 7",
      short_description: "Warriors vs. Cavs",
      full_description: "Watch as the Golden State Warriors...",
      image_url: "stephCurry.jpg", **in assets**
      date: "June 11, 2018",
      time: "7:00pm",
      venue: "Oracle Arena",
      address: "7000 Coliseum Way, Oakland, CA 94621",
      host_id: 1,
      id: 1
      tags: {
        1: {
          id: 1
          name: "Sports"
        }
      }
    }
  },
  eventDetails: {
    {
      title: "NBA Finals Game 7",
      short_description: "Warriors vs. Cavs",
      full_description: "Watch as the Golden State Warriors..."
      image_url: "stephCurry.jpg" **in assets**
      date: "June 11, 2018"
      time: "7:00pm"
      host_id: 1,
      id: 1
      tags: {
        1: {
          id: 1
          name: "Sports"
        }
      },
      tickets [
              {id: 1, type: frontRow, price: $150, total_quantity: 50,
              quantity_left: 5},
              ...]
  },
  tagFilters: [1, 7, 14], **Used to track selected Tags for filtering of events, maybe change**
  bookmarks: [      
              {title: "NBA Finals Game 7",
              short_description: "Warriors vs. Cavs",
              full_description: "Watch as the Golden State Warriors...",
              image_url: "stephCurry.jpg", **in assets**
              date: "June 11, 2018",
              time: "7:00pm",
              venue: "Oracle Arena",
              address: "7000 Coliseum Way, Oakland, CA 94621",
              host_id: 1,
              id: 1
              tags: {
                1: {
                  id: 1
                  name: "Sports"
                }
              }
            },...
            ],**stores all user's bookedmarked events**
  userTickets: {
                  1: {id: 5,
                      type: frontRow,
                      price: $150,
                      event: {id: 1,
                              title: "NBA Finals Game 7",    
                              image_url: "stephCurry.jpg", **in assets**
                              date: "June 11, 2018",
                              time: "7:00pm",
                              venue: "Oracle Arena",
                              address: "7000 Coliseum Way, Oakland, CA 94621"}
                      }

                }
}
