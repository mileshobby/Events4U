Users:

Column          Data Type      Details
id              integer        not null, primary key
username        string         not null, indexed, unique
password_digest string         not null
session_token   string         not null, indexed, unique


Events:

Column            Data Type      Details
id                integer        not null, primary key
title             string         not null, indexed
short_description text           not null
full_description  text           not null
image_url         string         not null, default: "default_image.jpg"
date              date           not null, indexed
time              time           not null
host_id           integer            not null, indexed, ,foreign key (references users)   
total_quantity    integer         
quantity_left     integer        //only if I implement quantity**    
price             float         not null, indexed

Tickets:

Column          Data Type      Details
id              integer        not null, primary key
type            string         not null
price           integer        not null, indexed
total_quantity  integer   
quantity_left   integer        //only if I implement quantity**    


Tickets:

Column          Data Type      Details
id	            integer        not null, primary key
user_id	        integer	       not null, foreign key (references users), indexed, unique [ticket_id]
event_id	      integer	       not null, foreign key (references tickets), indexed


Bookmarks

Column          Data Type      Details
id              integer        not null, primary key
user_id         integer        not null, indexed, foreign key (references users)
event_id        integer        not null, indexed, unique [user_id], foreign key (references events)


Categories:

Column          Data Type      Details
id	            integer        not null, primary key
name            string         not null, indexed


Taggings:

Column          Data Type      Details
id	            integer        not null, primary key
event_id	      integer	       not null, foreign key (references events), indexed, unique [tag_id]
tag_id	        integer	       not null, foreign key (references tags), indexed
