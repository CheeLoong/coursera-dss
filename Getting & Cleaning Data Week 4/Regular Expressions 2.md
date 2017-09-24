# Regular Expressions 2

"." is used to refer to any character

9.11 - search for line that has 9 followed by any possible character, then 11.

flood|fire - this is "or" in the context of regular expressions

flood|earthquake|hurricane|coldfire - include any number of alternatives

^[Gg]ood|[Bb]ad # good has to be found in beginning of the line, bad can be anywhere 

^([Gg]ood|[Bb]ad) # good and bad both has to be found in beginning of the line

[Gg]eorge( [Ww]\.)? [Bb]ush # question mark indicates that the indicated expression is optional


(.*) # * means "any number, including none, of the item" (e.g. in this case its paranthesis ())

[0-9]+ (.*)[0-9]+ # + means "at least one of them" (e.g. in this case any number followed by something other than numbers then followed by any number)

[Bb]ush ( +[^ ]+ +){1,5} debate # will match B/bush ..... debate

+( [a-zA-Z]+) +\1 + # match word + space + (\1 = word) + space

^s(.*)s # starts with s ends with s, * is greedy so is always matches the longest possible string

^s(.*?)s$ the greediness of $ can be turned off with the ? 



