ping <- function() { "PONG :ingis\n" }

sendmsg <- function(chan, msg) { paste('PRIVMSG', chan, ':', msg, "\n") }

joinchan <- function(chan) { paste('JOIN', chan, "\n") }

connect <- function() {
  socket <- make.socket(host = 'localhost', 6667, fail = TRUE, server = FALSE)

  write.socket(socket, "USER rbot rbot rbot :i am a bot\n")
  write.socket(socket, "NICK robt \n")

  write.socket(socket, joinchan('#test'))

  listen(socket)
}

listen <- function(socket) {
  repeat {
    ircmsg <- read.socket(socket, loop = FALSE)
    print(ircmsg)
  }
}
