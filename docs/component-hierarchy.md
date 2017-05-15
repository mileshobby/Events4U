* Component Hierarchy

* AuthFormContainer
  * AuthForm
  * Errors

* HomeContainer
  * Home
    * SearchBoxContainer
      * SearchBox
    * EventsByCategoryContainer
      * EventsByCategory
        *  EventsByCategoryItem
    *  CategorySelector

*  NavBarContainer
  *  NavBar
    *  AccountDropdown
    *  SearchBar

* Footer

* SearchBar

* NewEventContainer
  * NewEvent
      * TicketsCreator
        * Ticket
      * Errors

* EventShowContainer
  * EventShow
    * EventInformation
    * EventDetails

* CheckoutContainer
  * Checkout
    * TicketsList
    * TicketsListItem

* GoogleMapContainer
  * GoogleMap

* SearchContainer
  * Search
    * FilterBox
      * GoogleMap
      * FilterBoxItem
    * SearchResults
      * SearchResultsItem
    * SearchBar

* SearchItemContainer
  * SearchItem

* Routes

Path Component
* "/sign-up"	"AuthFormContainer"
* "/sign-in"	"AuthFormContainer"
* "/home"	"HomeContainer"
* "/home/events/:eventId"	"EventShowContainer"
* "/search"	"Search"
* "/new-event"	"NewEventContainer"
* "/user/events"
