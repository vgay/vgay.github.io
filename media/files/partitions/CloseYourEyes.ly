
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

title = #"Close Your Eyes"
composer = #"Bernice Petkere"
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
s2 f1:m5-7 bes:9- f:m5-7 bes2:9- bes:5+7.9-11+
  es:m6 \parenthesize c:5+7.9-11+ f:m5-7 bes:9- es1:m6 s 
  f2:m5-7 bes:9- es2.:7+9 \parenthesize es4:m6 s1
  bes:m7 es:7 bes:m7 es:7 as:7 s ces:7 bes:9-
  f1:m5-7 bes:9- f:m5-7 bes2:9- bes:5+7.9-11+
  es:m6 \parenthesize c:5+7.9-11+ f:m5-7 bes:9- es2:m6 \parenthesize es:7+
  
 
}


theNotes =  \relative c'' {
  \clef "treble" \key es \major \time 4/4
  \partial 2  bes4. f8 
    \A \repeat volta 2 { 
    as1 ~ | as2 bes4. f8 | % 3
    \times 2/3  { as4 bes4 as4 } \times 2/3  { f4 as4 f4 } | % 4
    d2 ges4.  d8 | % 5
    \break es1 ~ }
    \alternative { 
     { es4 es4 \times 2/3 { f4 ges4 as4 } | bes1 ~ | bes2 bes4. f8  }
  { es4 \repeatTie es4 \times 2/3 { f4 g! as4 } | bes1 ~ | bes2 es4. bes8 }
    } \bar "||" \break
      \B des1 ~ | % 11
  des2 es4. bes8 | % 12
  \times 2/3  { des4 es4 des4 } \times 2/3  { bes4 des4 bes4 } | % 13
  \times 2/3  { g4 bes4 g4 } \times 2/3  { es4 f4 es4 } \break | % 14
  \times 2/3  { ges4 es4 ges4 } es2 ~ | % 15
  es2 \times 2/3 { es4 f4 es4 } | % 16
  ges2 es2 | % 17
  f2  bes4. f8 \break
  \A as1 ~ | as2 bes4. f8 | % 3
    \times 2/3  { as4 bes4 as4 } \times 2/3  { f4 as4 f4 } | % 4
    d2 ges4.  d8 | % 5
    \break es1 | \times 2/3  { f4 ges4 as4 } bes4 bes4 | 
  bes1 | % 21
  R1  \bar "|."
}

grille = \chordmode {
  \bar "[|:"
  f1:m5-7 bes:9- f:m5-7 \/bes2:9- bes:5+7.9-11+ \break
  es1:m6 \/f2:m5-7 bes:9- 
  \set Score.repeatCommands = #'((volta "1")) \repeat percent 2 es1:m6   
  \set Score.repeatCommands = #'((volta #f) end-repeat) \break
  \stopStaff s1 \bar "" s \startStaff \set Score.repeatCommands = #'((volta "2"))
  \repeat percent 2 es1:7+9 \bar "||"
  \set Score.repeatCommands = #'((volta #f)) \break 
 bes:m7 es:7 bes:m7 es:7 \break
 \repeat percent 2 as:7 ces:7 es:7 \break
 f1:m5-7 bes:9- f:m5-7 \/bes2:9- bes:5+7.9-11+ \break
 es1:m6 \/f2:m5-7 bes:9- \repeat percent 2 es1:m6
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*11 
  s1 ^\markup \bold \box \fontsize #7 B s1*7 
  s1 ^\markup \bold \box \fontsize #7 A
}

verse = \lyricmode {
Close your eyes 
rest your head on my shoul -- der and sleep.
Close your eyes 
And I will close mine.
Close your \skip 1
Oh, this is di -- vine.

Mu -- sic play 
some -- thing drea -- my for dan -- cing 
while were here ro -- man -- cing 
It's love's ho -- li -- day 
And Love will be our guide

Close your Eyes 
When you o -- pen them dear 
I'll be near by your side 
So won't you close your eyes... 
}
verseB = \lyricmode {
  \repeat unfold 2 { \skip 1 }
  eyes 
Let's pre -- tend that we're both coun -- ting sheep 
Close your eyes 
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
          \addlyrics \verse
          \addlyrics \verseB
      >> >>
      %   }   \markup \pad-markup #2 " "
  } } \bookpart {
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
          \addlyrics \verse
          \addlyrics \verseB
      >> >>
      %   }   \markup \pad-markup #2 " "
  } } \bookpart {
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