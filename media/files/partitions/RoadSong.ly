
 \version "2.22.0"
#(set-global-staff-size 18)
\include "double-mark.ly"
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

title = #"Road Song"
composer = #"Wes Montgomery"
meter = #"(Med. Latin)"
kwtempo = #"Medium"
kwstyle = #"Latin"


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
   asplayed = #"Wes Montgomery" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=ABFAz5orvWA"
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
  }
}




harmonies = \chordmode {
  s8 g1*2:m7 d1:9+ a2:m7 d:7 g:m7 f:m7 es:7+ c:m7 e:m5-7 c:m7 d4:9+ g2.:m7 d4:9+ g2.:m7
  c1:m7 f2:7 f:7/es bes:7+/d bes:7+/c b:m7 e:7 bes1:m7 es:7 as:7+ d:9-
  d4:9+ g2.:m7 g2:m7 f:m7 es:7+ c:m7 e:m5-7 c:m7 d4:9+ g2.:m7
}
alt = \chordmode {
  s8 s1*2 \startParenthesis \parenthesize a1:m7 \endParenthesis \parenthesize d:7
}
voltaOne = \markup { 1. \text { & } 3.}

theNotes =  \relative c' {
  \clef "treble" \key bes \major \time 4/4
  \partial 8 d8
  \repeat volta 2 {
    \A g bes bes g bes4 g | R1 |
    d8 f f d f2 | r2 r4. d8 | \break
    g bes bes bes~ bes c4 d8~ | d c4 bes8~ bes g4 a8 |
    bes4. g8~ g4.  d8 
    \tweak X-offset #-14.5
    \tweak Y-offset #3
\mark \markup  { \with-color #red { "To Coda" \fontsize #0 \musicglyph "scripts.varcoda" } }
  }
  \set Score.repeatCommands = #(list(list 'volta voltaOne))
    f4 g2 r8 \parenthesize d8
  \once \override Score.RehearsalMark #'outside-staff-priority = #49
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \mark \markup { \italic \with-color #(x11-color 'red) "fine " }
  \set Score.repeatCommands = #'((volta #f) (volta "2.") end-repeat)
    f4 g2.
  \set Score.repeatCommands = #'((volta #f))


\bar "||" \break
  \B r4. es8 r g4-. bes8 | d4. c8 a4 g8 f~ |
  f1 | fis4 d8 cis b2 | \break
  r4. des8 r f4-. as8 | c4. bes8 g4 f8 es~ |
  es1 | r2 r4 d \bar ":|]" \break
  \Coda f4 g2 d4-. | g8 bes bes bes~ bes c4 d8~ | d c4 bes8~ bes g4 a8 |
    bes4. g8~ g4. d8 | f4 \improvisationOn b2.
}


grille = \chordmode {
  \bar "[|:"
\repeat percent 2 g1:m7 d:9+ \/a2:m7 d:7 \break
\/ g2:m7 f:m7 \/ es:7+ c:m7 \/ e:m5-7 c:m7 \/ d:9+ g:m7 \startStaff \break
 c1:m7  \/ f2:7 f:7/es \/ bes:7+/d bes:7+/c \/ b:m7 e:7 \startStaff 
b1:m7 es:7 as:7+ d:9- \bar ":|]" \break
\repeat percent 2 g1:m7 d:9+ \/a2:m7 d:7 \break
\/ g2:m7 f:m7 \/ es:7+ c:m7 \/ e:m5-7 c:m7 \/ d:9+ g:m7 \bar "|." \break


\Coda \/ g:m7 f:m7 \/ es:7+ c:m7 \/e:m5-7 c:m7 \/ d:9+ g:m7
}

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*7 
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
        \new Staff \with { instrumentName = \CleSol } <<
          \new Voice \with { \consists "Pitch_squash_engraver" }  \theNotes
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
        \new Staff \with { instrumentName = \Bb } <<
          \new Voice \with { \consists "Pitch_squash_engraver" } \transpose c d \theNotes
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
        \new Staff \with { instrumentName = \Eb } <<
            \new Voice \with { \consists "Pitch_squash_engraver" } \transpose c a \theNotes
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
        \new Staff \with { instrumentName = \CleSol } 
        <<
             \new Voice \with { \consists "Pitch_squash_engraver" }  \theNotes
      >> >>
    } 
    \markup \pad-markup #2 " "
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
        \new Staff \with { instrumentName = \Bb } <<
            \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c d \theNotes
      >> >>
  }     
  \markup \pad-markup #2 " "
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
          \transpose c a, \harmonies
        }
        \new Staff \with { instrumentName = \Eb } <<
            \new Voice \with { \consists "Pitch_squash_engraver" } \transpose c a \theNotes
      >> >>
  } 
      \markup \pad-markup #2 " "
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
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
        }
        \transpose c a \grille
      >>
} } }