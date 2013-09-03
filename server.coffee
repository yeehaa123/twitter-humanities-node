Twit = require 'twit'
app = require('http').createServer()
io = require("socket.io").listen(app)

app.listen(3000)

T = new Twit
  consumer_key: "aXpaNSsV6NpaZVxWlZA"
  consumer_secret: "MC12VZpj8YFD0McwyiO5VU1vexldcZ7bBV9QeQLCXnE"
  access_token: "1581556471-8ECXXHo8IG503FJXxiYzvn7lAgamgd2nG3D9YDZ"
  access_token_secret: "hWWxxxG8RoXj1iPe6am868qrFh0TDhtoFgFyyDdM"

stream = T.stream "statuses/filter",
  track: "hot"

stream.on "tweet", (tweet) ->
  tweet_words = tweet.text.split(" ")
  triggers = ["art", "job", "hiring", "degree", "career", "teacher", "education", "dark", "age", "code", "algorithm", "javascript", "ruby", "future", "html", "css", "language", "data", "visualisation", "learning"] 
  for trigger in triggers
    if trigger in tweet_words
      console.log trigger
      io.sockets.send trigger
