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
              (Key [] "r" (lazy.reload_config))]
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

