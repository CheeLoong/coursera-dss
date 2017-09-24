# Regular Expressions 2

# metacharacters: .

"." is used to refer to any character

9.11 - search for line that has 9 followed by any possible character, then 11.

# metacharacters: |

flood|fire - | is "or" in the context of regular expressions

flood|earthquake|hurricane|coldfire - include any number of alternatives

^[Gg]ood|[Bb]ad # good has to be found in beginning of the line, bad can be anywhere 

# metacharacters: ( and )

^([Gg]ood|[Bb]ad) # good and bad both has to be found in beginning of the line

# metacharacters: ?

[Gg]eorge( [Ww]\.)? [Bb]ush # question mark indicates that the indicated expression is optional, note the adding \. is to tell R to consider . as the metacharacter, consider it as literal .

# metacharacters: * and +

(.*) # * means "any number, including none, of the item" (e.g. in this case its paranthesis ())

[0-9]+ (.*)[0-9]+ # + means "at least one of them" (e.g. in this case any number followed by something other than numbers then followed by any number)

# metacharacters: { and }

[Bb]ush ( +[^ ]+ +){1,5} debate # will match B/bush, followed by a space, then non-space, space again, limit the word objects up to 5 times, then followed by debate


# metacharacters: and

m,n means at least m but not more than n matches
m means exactly m matches
m, means at least m matches


# metacharacters: ( and ) revisited

+( [a-zA-Z]+) +\1 + # space followed by match word + space + (\1 = is the same match as in the parantheses)

^s(.*)s # starts with s ends with s, * is greedy so is always matches the longest possible string

^s(.*?)s$ the greediness of $ can be turned off with the ? 

# note that regular expressions are used in many different languages; not unique to R.



