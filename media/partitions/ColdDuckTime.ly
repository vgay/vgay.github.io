
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
  ragged-last = ##t
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Cold Duck Time"
composer = #"Eddie Harris"
meter = #"(Med. Rock/Gospel)"
kwtempo = #"Medium"
kwstyle = #"Rock/Gospel"

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
  asplayed = #"Eddie Harris" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=_Ago8dP4fFA"
  composer = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  meter = "Intro : 4 bars bass only, 4 bars with drums and piano"
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
form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Bass line, chords rhythms and breaks continue for solos" } }
}

harmonies = \chordmode {
  \set chordChanges = ##f
  s2 
  f1:7 bes:7 f:7 bes:7 
  f1:7 bes:7 f:7 bes2..:7 
  des1:7+ es:7+9 f8:7
  s1 s2.. des8:7+ des2..:7+ es1:7+9 f8:7 s1 s2.. des1:7+ f:7
}


theNotes =  \relative c' {
  \clef "treble" \key es \major \time 4/4
  \partial 2 
  es8 f4-. as8
  \repeat volta 2 {
    r2 es8 f4-. as,8 | r2 es'8 f4-. as8->
    r8 bes r c as4 f8 es8 | f8 r4. es8 f4-. as8 \break
    r2 es8 f4-. as,8  | r2 es'8 f4-. as8->
    r8 bes r c as4 f8 es8 | f8 r4. es8 f4-. <c f as>8-> ~\break
    \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
    \tweak self-alignment-X #RIGHT
    \mark \markup  { \with-color #red { "To Coda on repeat" \fontsize #0 \musicglyph "scripts.varcoda" } }
    <c f as>2.. <g c f>8-> ~ | <g c f>2.. <a es' f>8-^ | 
    \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
    \mark \markup "Piano Fill --------------------"
    R1 r2 
    \startParenthesis \parenthesize
    es'8 f4-. 
    \endParenthesis \parenthesize as8
  }
  \break \Coda 
  \repeat volta 2 {
    <c, f as>2.. \repeatTie <g c f>8-> ~ | <g c f>2.. <a es' f>8-^ | 
    \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
    \mark \markup "Piano Fill --------------------"
    R1 | r2 es'8 f4-. <c f as>8-> ~ \break }
  <c f as>2.. <g c f>8-> ~ | <g c f>2.. <a es' f>8-^ |
}

Basse =  \relative c, {
  \clef "bass" \key es \major \time 4/4
  \partial 2 r2
 
  f8 c' es c d f r4 | bes, c8 as~ as4. f8~ | f8 c' es c d f r4 | bes, c8 as~ as4. f8~ |
  f8 c' es c d f r4 | bes, c8 as~ as4. f8~ | f8 c' es c d f r4 | bes, c8 as~ as4. d8->~ |
  d2.. es8->~ | es2.. f8-^ | R1*2 | d2..\repeatTie es8->~ | es2.. f8-^ | R1 | r2.. d8->~ | d2.. es8->~ | es2.. f8-^ |

}

grille = \chordmode {
  \bar "[|:"
  f1:7 bes:7 f1:7 bes:7 \break
  f1:7 bes:7 f1:7 bes:7 \break
  des:7+ es:7+9 \/ f2:7 r2 \startStaff r1 
 
  \bar ":|]" }

marques = \relative c' { 
  s1 % ^\markup \bold \box \fontsize #7 A s1*7 
  %   s1 ^\markup \bold \box \fontsize #7 B s1*7 
  %   s1 ^\markup \bold \box \fontsize #7 A
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
          \theNotes
      >> >>
    }  \form
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
        \new Staff \with { instrumentName = \Bb } <<
          \transpose c d \theNotes
      >> >>
    }  \form
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
        \new Staff \with { instrumentName = \Eb } <<
          \transpose c a \theNotes
      >> >>
    }  \form
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
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol  } 
          <<
            \theNotes
          >> 
          \new Staff 
          <<
            \Basse
          >>      
      
      >> >>
    } 
    \form
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
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Bb  } 
          <<
            \transpose c d \theNotes
          >> 
          \new Staff 
          <<
            \Basse
          >>      
      
      >> >>
    }
    \form
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
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Eb  } 
          <<
            \transpose c a \theNotes
          >> 
          \new Staff 
          <<
            \Basse
          >>      
      
      >> >>
    }   
    \form
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