/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 * Basic Choices
 * Knot structure
 * Recurring choices
 * Conditionals in descriptions
 * Conditionals in choices
 
 In the assignment:
 * Add four more knots (and feel free to change any of the example text, this is YOUR story)
 * Add at least one more conditional
*/

-> cave_center

== cave_center ==
You are stranded in the middle of a cave. {not torch_pickup:There is a torch on the wall.} The cave extends in each direction around you.
+ [Take the north tunnel] -> north_tunnel
+ [Take the east tunnel] -> east_tunnel
+ [Take the south tunnel] -> south_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup

== north_tunnel ==
You see the cave's exit behind a large metal gate. The gate asks for a toll of 5 coins.
+ [Pay the toll] -> toll_paying
+ [Go Back] -> cave_center

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.

+ {torch_pickup} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_center

== south_tunnel ==
You are in the south tunnel. {sword_pickup:There is nothing here.|There is a sword lying on the ground.}
* [Pick up the sword] -> sword_pickup
+ [Go Back] -> cave_center

== west_tunnel ==
{goblin_kill:{sack_pickup:You are in the west tunnel. There is nothing here.|You are in the west tunnel. There is a large, empty sack on the floor.}|You see a goblin with a large, empty sack and a dagger. It begins rushing towards you!}
* {sword_pickup} [Fight Back] -> goblin_kill
+ {not goblin_kill} [Run Away] You run away from the goblin, losing it in the process.
-> cave_center
* {goblin_kill} [Pick up the sack] -> sack_pickup
+ {goblin_kill} [Go Back] -> cave_center

=== torch_pickup ===
You now have a torch. May it light the way.
-> cave_center

== sword_pickup ==
You now have a sword. It is not very sharp, but it will do.
-> south_tunnel

== goblin_kill ==
You fight back against the goblin with your sword, slaying it successfully. The goblin drops its sack.
-> west_tunnel

== sack_pickup ==
You now have a sack. Maybe you can find something useful to put in it?
-> west_tunnel

== east_tunnel_lit ==
{coins_pickup:The light of your torch brightens the room around you. There is nothing left in here.|The light of your torch glints off of the thousands of coins in the room. {sack_pickup:Luckily, you have a sack to carry it all.|Unfortunately, you lack the means to carry any reasonable amount of them.}}
* {sack_pickup} [Gather the coins] -> coins_pickup
+ [Go Back] You exit the tunnel, and your torch goes out as you leave.
-> cave_center

== coins_pickup ==
You gather all of the coins into your sack.
-> east_tunnel_lit

== toll_paying ==
{coins_pickup:You take 5 coins from your sack, and insert them into the toll machine. The gate opens, and you escape from the cave with your newfound riches! -> END|You do not have enough coins!}
-> north_tunnel

