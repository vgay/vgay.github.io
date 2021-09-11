
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

title = #"I Mean You"
composer = #"Thelonious Monk"
meter = #"(Med. Swing)"
kwtempo = #"Medium"
kwstyle = #"Swing"

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
  asplayed = #"Thelonious Monk" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=kROre63J0Lw"
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
  s8 es1*3:7 s2.. f8:7+
  f1*2:7+ des1:7 d:7 g:m c:7 f:7+ g2:m c:7 f1:7+
  es1*2:7 f:7+ des:7 c1:7 g2:m c:7 
  f1*2:7+ des1:7 d:7 g:m c:7 f:7+
  f4.:7+ es8:7 
}


theNotes =  \relative c' {
  \clef "treble" \key c \major \time 4/4
  \mark \markup \bold \box "Intro / Interlude"
  \partial 8 es8~( 
  es8. f16 g8. bes16 c8. bes16 c8. bes16 | des4 c8 bes) r es,4-. fis8(
  g8. bes16 c8. es16 des4 c8 bes) | r es, r es'-> r4. f8->~ \break
  
  \repeat volta 3 { 
    \A f d( c a f d c4 | f) r4 r8 c( d4-.) | 
    f r r8 des4-> es8->~ | es des4-> fis8->~ fis4 r8 f'->~ | \break
    f d( c a f d c4 | f) r4 \grace gis8( a4) \grace gis8( a4) | f-^ r r8 c( d4-.)
  }
  \alternative {
    { f4-^ r4 r4.  f'8 \laissezVibrer }
    { f,4-^ r4 r8 c( d4-.)  \bar "||" \break }} 
  \B f1 | r2 \tuplet 3/2 { c'4( g des } | c1) | r2 r8 c( d4-.)
  f1 | r2 \tuplet 3/2 { des'4( as des, } | d8-- dis4-- e8--~ e2) r2 r4. f'8 \laissezVibrer \break

  \A f d( c a f d c4 | f) r4 r8 c( d4-.) | 
  f r r8 des4-> es8->~ | es des4-> fis8->~ fis4 r8 f'->~ |
  f d( c a f d c4 | f) r4 \grace gis8( a4) \grace gis8( a4) | f-^ r r8 c( d4-.)
  \time 2/4 f4 r8 \laissezVibrer es-> \bar "|."
  
 
  %  \doubleMark
  %  \markup  { \with-color #(x11-color 'red) { "To Coda" \fontsize #2 \musicglyph #"scripts.coda" } } 
  %  \markup { \with-color #(x11-color 'red) \bold \larger \musicglyph #"scripts.coda" }
  % \break
  %\stopStaff s1 \startStaff s s s s s s s
  \bar ".."
}

grille = \chordmode {
  \repeat percent 4 es1:7 \break
  \bar "[|:"
  \repeat percent 2 f:7+ des:7 d:7 \break
  g:m7 c:7 f:7+ \set Score.repeatCommands = #'((volta "1")) \s g2:m7 c:7
  \set Score.repeatCommands = #'((volta #f) end-repeat) \break
  s1 \bar ""  s1 \bar "" s1 \startStaff 
  \set Score.repeatCommands = #'((volta "2")) f:7+ \break
  \set Score.repeatCommands = #'((volta #f))
  \repeat percent 2 es:7 \repeat percent 2 f:7+ \break
  \repeat percent 2 des:7 c:7 \/g2:m7 c:7 \startStaff \break
  \repeat percent 2 f1:7+ des:7 d:7 \break
  g:m7 c:7 f:7+ \/f2:7+ es:7
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 "Intro / Interlude" s1*3
  s1 ^\markup \bold \box \fontsize #7 A s1*11 
  s1 ^\markup \bold \box \fontsize #7 B s1*7 
  s1 ^\markup \bold \box \fontsize #7 A
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
    } 

    \markup {
      \column {
        \wordwrap  {
          Jouer l'intro / interlude avant et après le premier thème ainsi qu'après le dernier. La dernière mesure du Thème est à 2/4 lorsqu'elle précède l'interlude mais à 4/4 pendant les solos.
        }
      }
    }


} }

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
    } 
    \markup {
      \column {
        \wordwrap  {
          Jouer l'intro / interlude avant et après le premier thème ainsi qu'après le dernier. La dernière mesure du Thème est à 2/4 lorsqu'elle précède l'interlude mais à 4/4 pendant les solos.
        }
      }
    }
} }

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
    } 
    \markup {
      \column {
        \wordwrap  {
          Jouer l'intro / interlude avant et après le premier thème ainsi qu'après le dernier. La dernière mesure du Thème est à 2/4 lorsqu'elle précède l'interlude mais à 4/4 pendant les solos.
        }
      }
    }
} }

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
      >> >>
      %   }   
      %   \markup \pad-markup #2 " "
    } 
    \markup {
      \column {
        \wordwrap  {
          Jouer l'intro / interlude avant et après le premier thème ainsi qu'après le dernier. La dernière mesure du Thème est à 2/4 lorsqu'elle précède l'interlude mais à 4/4 pendant les solos.
        }
      }
    }
  }
  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
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
          \consists "Volta_engraver"
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
      >> >>
      %   }   
      %   \markup \pad-markup #2 " "
    } 
    \markup {
      \column {
        \wordwrap  {
          Jouer l'intro / interlude avant et après le premier thème ainsi qu'après le dernier. La dernière mesure du Thème est à 2/4 lorsqu'elle précède l'interlude mais à 4/4 pendant les solos.
        }
      }
    }
  }
  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
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
          \consists "Volta_engraver"
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
      >> >>
      %   }   
      %   \markup \pad-markup #2 " "
    } 
    \markup {
      \column {
        \wordwrap  {
          Jouer l'intro / interlude avant et après le premier thème ainsi qu'après le dernier. La dernière mesure du Thème est à 2/4 lorsqu'elle précède l'interlude mais à 4/4 pendant les solos.
        }
      }
    }
  }
  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
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
          \consists "Volta_engraver"
        }
        \transpose c a \grille
      >>
} } }