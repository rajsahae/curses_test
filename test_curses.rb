#!/usr/bin/env ruby

require "curses"
include Curses

def show_message
  board = [
    [1, 2, 3, 4],
    [1, 2, 3, 4],
    [1, 2, 3, 4],
    [1, 2, 3, 4]
  ]

  width = 27
  height = 9
  win = Window.new(height, width, (lines - height) / 2, (cols - width) / 2)
  win.box(?|, ?-) 

  format = []
  4.times { format << "%4d" }
  format = format.join(' | ')

  board.size.times do |r|
    win.setpos(r*2+1,1)
    win.addstr(sprintf(format, *board[r].map{|n| n.nil? ? 0 : n })) 
    win.setpos(r*2+2,1)
    win.addstr('-'*25)
  win.refresh
  end
  getch
end

init_screen
begin
  crmode
  #  show_message("Hit any key")

    setpos((lines - 5) / 2, (cols - 10) / 2)
    addstr("Hit any key")
    refresh
    show_message
ensure
  close_screen
end
