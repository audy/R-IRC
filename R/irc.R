ping <- function() { "PONG :ingis\n" }

sendmsg <- function(chan, msg) { paste('PRIVMSG', chan, ':', msg, "\n") }

joinchan <- function(chan) { paste('JOIN', chan, "\n") }

connect <- function(host, port, nickname) {
  socket <- make.socket(host = host, port, fail = TRUE, server = FALSE)

  write.socket(socket, sprintf("USER %s %s %s :%s\n", nickname, nickname, nickname, "r-bot"))
  write.socket(socket, sprintf("NICK %s \n", nickname))

  write.socket(socket, joinchan('#test'))

  listen(socket)
  # TODO: somehow handle line protocol here ...
}

listen <- function(socket) {
  repeat {
    ircmsg <- read.socket(socket, loop = FALSE)
    message(ircmsg, appendLF=FALSE)
  }
}
