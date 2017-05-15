Users:

Column          Data Type      Details
id              integer        not null, primary key
username        string         not null, indexed, unique
email           string         not null, indexed, unique
password_digest string         not null
session_token   string         not null, indexed, unique
tickets         integer        default: [], null: false, array: true
**maybe a there is better way to store ticket/user relation than this**


Events:

Column          Data Type      Details
id              integer        not null, primary key
title           string         not null, indexed
description     text           not null, indexed
image_url       string          
date            date           not null, indexed
time            time           not null
host_id         id             not null, indexed      

Tickets:

Column          Data Type      Details
id              integer        not null, primary key
type            string         not null
price           integer        not null, indexed
total_quantity  integer   
quantity_left   integer        **only if i implement quantity**     

Bookmarks
Column          Data Type      Details
id              integer        not null, primary key
user_id         integer        not null, indexed
event_id        integer        not null, indexed (unique in relation to user_id)
