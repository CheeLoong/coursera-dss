# Reading From APIs

# Accessing Twitter from R

package(httr)
myapp = oauth_app ("twitter", key="yourConsumeKeyHere", secret="yourConsumerSecretHere")
sig = sign_oauth1.0(myapp,
                    token = "yourTokenHere",
                     token_secret = "yourTokenSecretHere")
homeTL = GET("https://api.twitter.com/1.1/statuses/home_timline.json", sig)

# Converting the json object

json1 = content(homeTL) # this will return a structured R object (hard to read)
json2 = jsonlite::fromJSON(toJSON(json1)) # use JSON lite package and reformat it as data frame; convert the structured R object back to JSON, and using jsonlite function to create a data frame. 
json2[1,1:4] # look at first row and the first 4 columns

