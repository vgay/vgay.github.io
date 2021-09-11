
\version "2.19.80"
#(set-global-staff-size 18)
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  between-system-space = 2.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Willow Weep For Me"
composer = #"Ann Ronnell"
meter = #"(Ballad 12/8 Feel)"
kwtempo = #"Mod. Slow"
kwstyle = #"Ballad"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #4
          \override #'(offset . 9)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  % asplayed = #"" % doit être commentée si vide
  url = #""
  arranger = \markup \on-the-fly #played?
    \with-url #url
    \with-color #blue \underline
    \concat { "(as played by " \fromproperty #'header:asplayed ")" }
    tagline = ##f
}

\layout {
  \context {
    \Score
    startRepeatType = #"[|:"
    endRepeatType = #":|]"
    doubleRepeatType = #":|][|:"
    \override Clef #'break-visibility = #'#(#f #f #f)
    \override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
    \override ParenthesesItem.font-size = #2
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
}}


\layout {
  \context {
    \Score
    extraNatural = ##f
    \omit BarNumber
    skipBars = ##t
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
}

harmonies = \chordmode {
  \set chordChanges = ##f
  g2:6 c:7 g2:6 c:7 g2:6 a4:m7 d:7 g:6 a:m7 bes:dim7 b:m7 
  c1:7  a2:m5-7 d:5+7 g:6 e:7 a:m7 d:7 g1:6 d2:m7 g:7
  c2:m7 a4:m5-7 d:9- 
  g2:m g:9- 
  g4:m c:7  f:m7 bes:7 
  es:m as:7  d:m5-7 g:9-
  c2:m7  a4:m5-7 d:9-  
  g2:m g:9-
  g4:m c:7  f:m7 bes:7  
  es:m as:7 a:m7 d:7
  g2:6 c:7 g2:6 c:7 g2:6 a4:m7 d:7 g:6 a:m7 bes:dim7 b:m7 
  c1:7  a2:m5-7 d:5+7 g1:6 
  \startParenthesis \parenthesize d4:m7 \endParenthesis \parenthesize g2:7
}


theNotes =  \relative c'' {
  \clef "treble" \key g \major \time 4/4
    \showStartRepeatBar \bar "[|:"
    \A
    d8 d, \tuplet 3/2 { e g e~ } e2 | 
    d'8 d, \tuplet 3/2 { e g e~ } e2 |
    d'8 d, \tuplet 3/2 { e g e~ } e d e g | 
    b g \tuplet 3/2 { e g e~ } e2 | \break
    d'8 c \tuplet 3/2 { bes a g~ } g2 | 
    d'8 c \tuplet 3/2 { bes a g } d' d,4 d8~ |
    
    \set Score.repeatCommands = #'((volta "1"))
     d1~ | d2. r4 
    \set Score.repeatCommands = #'((volta "2") end-repeat)
     d1~ | d2. \repeatTie r4 \set Score.repeatCommands = #'((volta #f))
    \bar ".." \break
    \B
    g8 c \tuplet 3/2 { d c es~ } es4. c8 |
    bes g \tuplet 3/2 { bes g b~ } b4. g8 |
    c c d c bes c4 bes8 | 
    as bes as g~ g2 | \break
    g8 c \tuplet 3/2 { d c es~ } es4. c8 |
    bes g \tuplet 3/2 { bes g b~ } b4. g8 |
    c c d c bes c4 bes8 | 
    as bes \tuplet 3/2 { c es d~ } d4 d 
    \A \break
    d8 d, \tuplet 3/2 { e g e~ } e2 | 
    d'8 d, \tuplet 3/2 { e g e~ } e2 |
    d'8 d, \tuplet 3/2 { e g e~ } e d e g | 
    b g \tuplet 3/2 { e g e~ } e2 | 
    d'8 c \tuplet 3/2 { bes a g~ } g2 | 
    d'8 c \tuplet 3/2 { bes a g } d' d,4 d8~ |
    d1~ | d2. \bar ".."
}

grille = \chordmode {
  \bar "[|:"
  \/ g2:6 c:7 \/ g2:6 c:7 \/ g2:6 d:7 \/ g2:6 b:dim7 \startStaff \break
  c1:m7 \/ a2:m5-7 d:5+7 
  \set Score.repeatCommands = #'((volta "1"))
  \/ g:6 e:7 \s a:m7 d:7 \break 
  \set Score.repeatCommands = #'((volta #f)) \bar ":|]" 
  \stopStaff s1 \bar "" s \startStaff
  \set Score.repeatCommands = #'((volta "2"))
  g1:6  \/ d2:m7 g:7
  \set Score.repeatCommands = #'((volta #f)) \bar "||" \break
   \/ c:m7 d:9- \/ g2:m g:9- \/ c:7 bes:7 \/ as:7 g:9- \break
   \/ c:m7 d:9- \/ g2:m g:9- \/ c:7 bes:7 \/ as:7 g:9-  \break
   \/ g2:6 c:7 \/ g2:6 c:7 \/ g2:6 d:7 \/ g2:6 b:dim7 \startStaff \break
  c1:m7 \/ a2:m5-7 d:5+7 \startStaff  g1:6  \/ d2:m7 g:7

  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*11 
  s1 ^\markup \bold \box \fontsize #7 B s1*7 
  s1 ^\markup \bold \box \fontsize #7 A
}

verse = \lyricmode {
  Wil -- low weep for me __
Wil -- low weep for me __
Bent your bran -- ches down a -- long the ground and co -- ver me __
Li -- sten to my plea
Hear me wil -- low and weep for me __ "  "

Whis -- per to the wind and say that love has sinned
To leave my heart a -- brea -- king and ma -- king this moan __
Mur -- mur to the night to hide her star -- ry light
So none will find me si -- ghing and cry -- ing all a -- lone Oh,
Wee -- ping wil -- low tree, weep in sym -- pa -- thy __
Bend your bran -- ches down a -- long the ground and co -- ver me __
When the sha -- dows fall, __ bend oh wil -- low and weep for me __

}

verseB = \lyricmode {
  Gone my lov' -- ly dreams __
Lov' -- ly sum -- mer dreams __
Gone and left me here
To weep my tears a -- long the stream __
Sad as I can be
Hear me wil -- low and weep for \skip 1 me __
}

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "CTab")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new Staff \with { instrumentName = \CleSol \consists "Merge_rests_engraver" } <<
            \new Voice \with { \consists "Pitch_squash_engraver" } \theNotes
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "BbTab") 
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c d \harmonies
        } 
        \new Staff \with { instrumentName = \Bb \consists "Merge_rests_engraver" } <<
            \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c d \theNotes
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "EbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c a \harmonies
        }
        \new Staff \with { instrumentName = \Eb \consists "Merge_rests_engraver" } <<
            \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c a \theNotes
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new Staff \with { instrumentName = \CleSol \consists "Merge_rests_engraver" } 
        <<
          \new Voice \with { \consists "Pitch_squash_engraver" } \theNotes
          \addlyrics \verse
          \addlyrics \verseB
      >> >>
    } 
  } \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
        }
        \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Bba4") 
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c d \harmonies
        } 
        \new Staff \with { instrumentName = \Bb \consists "Merge_rests_engraver" } <<
            \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c d \theNotes
          \addlyrics \verse
          \addlyrics \verseB
      >> >>

  }
  } \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
        }
        \transpose c d \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c a \harmonies
        }
        \new Staff \with { instrumentName = \Eb \consists "Merge_rests_engraver" } <<
            \new Voice  \transpose c a \theNotes
          \addlyrics \verse
          \addlyrics \verseB
      >> >>
  }   
  } \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
        }
        \transpose c a \grille
      >>
} } }