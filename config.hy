(import
  libqtile [bar layout widget]
  libqtile.config [Click Drag Group Key Match Screen KeyChord]
  libqtile.lazy [lazy]
  libqtile.utils [guess-terminal])

(setv
  mod "mod4"
  terminal (guess-terminal)
  
  keys
  [(Key [mod] "e" (lazy.spawncmd))
   (Key [mod] "q" (lazy.window.kill))
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
   (KeyChord [mod] "l"
             [(Key [] "l" (lazy.spawn "lock.sh") :desc "Launch lock screen")
              (Key [] "f" (lazy.spawn "firefox") :desc "Launch firefox")
              (Key [] "t" (lazy.spawn terminal) :desc "Launch terminal")
              (Key [] "z" (lazy.spawn "filezilla") :desc "Launch filezilla")]
             :name "launch...")
   
   (Key [mod "control"] "q" (lazy.shutdown))]
  
  layouts
  [(layout.Columns :border-focus-stack ["#d75f5f" "#8f3d3d"] :boder-with 4)
   (layout.Max)]

  groups [(Group "1 e")
          (Group "2 web")
          (Group "3 term")
          (Group "4")
          (Group "5")
          (Group "6")]
  
  screens
  [(Screen
     :wallpaper "~/.config/qtile/bg.jpg"
     :wallpaper_mode "fill"
     :top (bar.Bar
            [(widget.CurrentLayout)
             (widget.GroupBox)
             (widget.Prompt)
             (widget.WindowName)
             (widget.Chord)
             (widget.TextBox "hy-conf")
             (widget.Clock :format"%Y-%m-%d %a %I:%M %p")
             (widget.QuickExit)]
            32))]

  ;; setups from default config
  dgroups_key_binder None
  dgroups_app_rules []  ; type: list
  follow_mouse_focus True
  bring_front_click False
  cursor_warp False

  auto_fullscreen True
  focus_on_window_activation "smart"
  reconfigure_screens True
  auto-minimize True
  wl-input-rules None
  wmname "LG3D"
  )

(for [group groups]
  (keys.extend [
                (Key [mod]
                     (get group.name 0)
                     (.toscreen (get lazy.group group.name))
                     )
                (Key [mod "shift"]
                     (get group.name 0)
                     (lazy.window.togroup
                       group.name :switch_group True)
                     )
                ])
  )
