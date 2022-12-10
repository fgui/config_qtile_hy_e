(import
  libqtile [bar layout widget]
  libqtile.config [Click Drag Group Key Match Screen KeyChord]
  libqtile.lazy [lazy])

(setv
  mod "mod4"
  
  keys
  [(Key [mod] "e" (lazy.spawncmd))
   (KeyChord [mod] "x"
             [(Key [] "i" (lazy.next_layout))
              (Key [] "r" (lazy.reload_config))
              
              (Key [] "b" (lazy.layout.left) :desc "Move focus to left")
              (Key [] "f" (lazy.layout.right) :desc "Move focus to right")
              (Key [] "n" (lazy.layout.down) :desc "Move focus down")
              (Key [] "p" (lazy.layout.up) :desc "Move focus up")
              (Key [] "space" (lazy.layout.next) :desc "Move window focus to other window")
              (Key ["shift"] "b" (lazy.layout.shuffle_left) :desc "Move window to the left")
              (Key ["shift"] "f" (lazy.layout.shuffle_right) :desc "Move window to the right")
              (Key ["shift"] "n" (lazy.layout.shuffle_down) :desc "Move window down")
              (Key ["shift"] "p" (lazy.layout.shuffle_up) :desc "Move window up")
              (Key ["control"] "b" (lazy.layout.grow_left) :desc "Grow window to the left")
              (Key ["control"] "f" (lazy.layout.grow_right) :desc "Grow window to the right")
              (Key ["control"] "n" (lazy.layout.grow_down) :desc "Grow window down")
              (Key ["control"] "p" (lazy.layout.grow_up) :desc "Grow window up")
              (Key [] "u" (lazy.layout.normalize) :desc "Reset all window sizes")

              ]
             :mode True
             :name "qtile mode")   
   (Key [mod "control"] "q" (lazy.shutdown))]
  
  layouts
  [(layout.Columns :border-focus-stack ["#d75f5f" "#8f3d3d"] :boder-with 4)]

  screens
  [(Screen
     :top (bar.Bar
            [(widget.CurrentLayout)
             (widget.Prompt)
             (widget.WindowName)
             (widget.Chord)
             (widget.QuickExit)]
            32))])

