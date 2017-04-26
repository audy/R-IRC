#!/usr/bin/env Rscript

ping <- function() { "PONG :ingis\n" }

sendmsg <- function(chan, msg) { paste('PRIVMSG', chan, ':', msg, "\n") }

joinchan <- function(chan) { paste('JOIN', chan, "\n") }

connect <- function(host, port, nickname) {
  socket <- make.socket(host = host, port, fail = TRUE, server = FALSE)

  write.socket(socket, "USER rbot rbot rbot :i am a bot\n")
  write.socket(socket, "NICK robt \n")

  write.socket(socket, joinchan('#test'))

  listen(socket)
}

listen <- function(socket) {
  repeat {
    ircmsg <- read.socket(socket, loop = FALSE)
    message(ircmsg, appendLF=FALSE)
  }
}
