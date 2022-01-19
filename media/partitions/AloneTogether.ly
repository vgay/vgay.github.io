
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

title = #"Alone Together"
composer = #"Arthur Schwartz"
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
s8 d1:m6 e2:m5-7 a:9- d1:m6 e2:m5-7 a:9- d1:m6 a2:m5-7 d:9+ g1*2:m7
  b2:m7 e:7 g:m7 c:7 f1:7+ e2:m5-7 a:9- d1:7+ 
  e2:m5-7 a:9- d1:7+ 
  a1:m5-7 d:9- g1*2:m6 g1:m5-7 c:9- f:7+ e2:m5-7 a:9-
  d1:m6 e2:m5-7 a:9- d1:m6 e2:m5-7 a:9- d:m6 b:m5-7 bes2:7 a:9- d1:m6 \startParenthesis \parenthesize e2:m5-7  \endParenthesis \parenthesize a:9-
}


theNotes =  \relative c' {
  \clef "treble" \key f \major \time 4/4
  \partial 8 d8
  \repeat volta 2 {
    \A
    f2 ~ f4. d8 | e e4.~ e2 ~ | e4 r8 d e4. f8 | a1 ~ |
    a4 r8 d, e4. f8 | a1 ~ | a4 r8 g a4. bes8 | d2 ~ d4. d8 \bar "||" \break
    e2 ~ e4. d8 | c c4. ~ c4. bes8 | a4. g8 a4. g8 | a2 ~ a4. g8 | fis fis4. ~ fis2 ~ |
  }
  \alternative {
    {fis2. r8 d }
    {fis2. \repeatTie d4 }
  }
  \bar "||" \break
  \B
  c'1 ~ | \times 2/3 { c4 a bes } \times 2/3 { c es d } | bes1 ~ | bes2. d,4 |
  bes'1 ~ | \times 2/3 { bes4 g a } \times 2/3 { bes d c } | a2 ~ a4. f8 | g2 ~ g4. d8 \bar "||" \break
  
\A
f2 ~ f4. d8 | e e4.~ e2 ~ | e4 r8 d e4. f8 | a1 ~ |
a4 r8 a b4. d8 | f2 ~ f4. cis8 | d d4. ~ d2 ~ | d4 r r2  
\bar ".." 
}

grille = \chordmode {
  \bar "[|:"
 d1:m6 \/e2:m5-7 a:9- \startStaff d1:m6 \/e2:m5-7 a:9- \startStaff \break
 d1:m6 \/a2:m5-7 d:9- \startStaff  \repeat percent 2 g1:m7 \break
 \/b2:m7 e:7 \/g:m7 c:7 \startStaff f1:7+ \/e2:m5-7 a:9- \startStaff \break
 \set Score.repeatCommands = #'((volta "1")) d1:7+ \/e2:m5-7 a:9-
 \set Score.repeatCommands = #'((volta #f) (volta "2") end-repeat)
 \startStaff \repeat percent 2 d1:7+ \break  \bar "||" \set Score.repeatCommands = #'((volta #f))
 a:m5-7 d:9- \repeat percent 2g:m6 \break
 g:m5-7 c:9- f:7+ \/e2:m5-7 a:9- \startStaff \break
 d1:m6 \/e2:m5-7 a:9- \startStaff d1:m6 \/e2:m5-7 a:9- \startStaff \break
\/d2:m6 b:m5-7 \/bes:7 a:9- \startStaff d1:m6 \/e2:m5-7 a:9-
\bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*15 
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
      >> >>
  }   
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
  }   
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
  }   
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