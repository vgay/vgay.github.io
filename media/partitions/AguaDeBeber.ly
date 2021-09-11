
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

title = #"Agua De Beber"
composer = #"Tom Jobim"
meter = #"(Med. Bossa Nova)"
kwtempo = #"Medium"
kwstyle = #"Bossa"


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
    \Staff
    printPartCombineTexts = ##f
    \consists "Merge_rests_engraver"
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
}


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
d1:m7 e2:7 a:5+7 d1:m7 e2:7 a:5+7 d1:m7 bes:7+ d:m7 s
e:9- a:5+9+ d1*2:m7 g1:m7 c:7 f1*2:7+
e2:7 es:5-7 d:m7 des:dim f:9/c f4:9+/c e:9+/b s1
e:9- a:9sus4 d1*2:m7
g1:7 g:m7 d1*2:m7 g1:7 g:m7 d:m7 a:m5-7
d1:m7 e2:7 a:5+7 d1:m7 e2:7 a:5+7 d1:m7 bes:7+ d:m7 
}


theNotes =  \relative c' {
  \clef "treble" \key f \major \time 4/4
\Intro
f8 d c d r4. f8 | gis16( a gis8) g as g4 f |
f8 d c d r4. f8 | gis16( a gis8) g as g4 f | 
f8 d c d r2 | d8 c d2. | d8 c d2. 
r4 d8 f~ f a4 gis8~ \bar "|." \break
\A gis4. a8~ a4. f8~ | f2~ f8 d4 f8~ | f d4.~ d2 | r4 d8 f~ f a4 c8~ |
c2~ c8 d4 a8~ | a2~ a8 g4 a8~ | a1 | r4 d,8 f~ f a4 gis8~ | \break
gis4. a8~ a4. f8~ | f2~ f8 g4 f8~ | f << { d4.~ d2 | e\rest e4.\rest  f8 }
 \\ { s4. s4 \startParenthesis \parenthesize c8 bes~ | \endParenthesis \parenthesize bes1 } >>
 f'8 f4 f8~ f g f4 | e4. b8~ b d4 f8~ | f e d2. | r4 d8 d f a g4~ \bar "||" \break
\B g1~ | g4 a8 g f d f4~ | f8 d d d r2 | r4 d8 d f a g4~ 
g1~ | g4 a8 g f d f4~ | f8 d d d r2 |
\startParenthesis \parenthesize d8 c \endParenthesis \parenthesize d2. \bar "||" \break
\C f8 d c d r4. f8 | gis16( a gis8) g as g4 f |
f8 d c d r4. f8 | gis16( a gis8) g as g4 f | 
f8 d c d r2 | d8 c d2. | d8 c d2. |
\startParenthesis \parenthesize r4 d8 f~ f a4 \endParenthesis \parenthesize gis8 \laissezVibrer

\bar ".."
}

grille = \chordmode {
d1:m7 \/e2:7 a:5+7  d1:m7 \/e2:7 a:5+7 \break
d1:m7 bes:7+ \repeat percent 2 d:m7 \break
e:9- a:5+9+ \repeat percent 2 d:m7 \break
g:m7 c:7 \repeat percent 2 f:7+ \break
\/e2:7 es:5-7 \/d:m7 des:dim \/f:9/c e:9+ e1:9+/b \break
e:9- a:9sus4 \repeat percent 2 d:m7 \break
g:7 g:m7 \repeat percent 2 d:m7 \break
g:7 g:m7 d:m7 a:m5-7 \break
d1:m7 \/e2:7 a:5+7  d1:m7 \/e2:7 a:5+7 \break
d1:m7 bes:7+ \repeat percent 2 d:m7 \break
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 Intro s1*7 
  s1 ^\markup \bold \box \fontsize #7 A s1*15 
  s1 ^\markup \bold \box \fontsize #7 B s1*7 
  s1 ^\markup \bold \box \fontsize #7 C
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
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
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
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
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
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c a \theNotes
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
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
      >> >>
      %   }   \markup \pad-markup #2 " "
  } }  \bookpart {
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
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
      >> >>
      %   }   \markup \pad-markup #2 " "
  } }  \bookpart {
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
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice  
          \transpose c a \theNotes
      >> >>
      %   }   \markup \pad-markup #2 " "
  } }  \bookpart {
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