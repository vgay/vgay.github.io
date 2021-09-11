
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

title = #"All of Me"
composer = #"Gerald Marks"
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
  %\set chordChanges = ##f
  \repeat volta 2 {
    c1:7+ c:7+ e:7 e:7 a:7 a:7 d:m7 d1:m7 }
  \alternative {
    { e:7 e:7 a:m7 a1:m7 d:7 d:7 d:m7 g:7 }
    { f:7+ f:m6 e:m7 a:7 d:m7 g:7 c2:6  \startParenthesis \parenthesize es:dim d:m7 \endParenthesis \parenthesize g:7 
} } }


theNotes =  \relative c'' {
  \clef "treble" \key c \major \time 4/4
  \showStartRepeatBar \bar "[|:"
  \repeat volta 2 {
    \A c4 g8 e8 ~ e2 ~ | % 2
    e2 \times 2/3 { c'4 d4 c4 } | % 3
    b4 gis8 e8 ~ e2 ~ | % 4
    e1 | % 5
    a4 g8 e8 ~ e2 ~ | % 6
    e4 dis4 \times 2/3 { e4 bes'4 a4 } | % 7
    g2 f2 ~ | % 8
    f1 \break | % 9
  }
  \alternative {
    {
      \B e4 es8 d8 ~ d2 ~ | 
      d2 \times 2/3 { e4 gis4 b4 } | % 11
      d2 c2 ~ | % 12
      c1 | % 13
      b4 bes8 a8 ~ a2 ~ | % 14
      a2 \times 2/3 { a4 d4 b4 } | % 15
      a1 | % 16
      b1 | % 17
    }
    {
      \C d2 c4 b4 | % 18
    }
  }
  d2. c4 | % 19
  b2 e,4 g4 | 
  b2. a4 | % 21
  c2 a4 c4 | % 22
  e2 e2 | % 23
  c1 | % 24
  R1 \bar "|."
}

grille = \chordmode {
  \repeat percent 2 c1:7+ \repeat percent 2 e:7 \break
  \repeat percent 2 a:7 \repeat percent 2 d1:m7 \break
  \set Score.repeatCommands = #'((volta "1"))
  \repeat percent 2 e:m7 \set Score.repeatCommands = #'((volta #f)) \repeat percent 2 a:m7 \break
  \repeat percent 2 d:7 d:m7 g:7 \break \bar ":|]"
  \set Score.repeatCommands = #'((volta "2"))
  f:7+ f:m6 \set Score.repeatCommands = #'((volta #f)) e:m7 a:7 \break
  d:m7 g:7 \/ c2:6 es:dim \/ d:m7 g:7
  \bar ".." }

marques = \relative c' { 
  s1  ^\markup \bold \box \fontsize #7 A s1*4
  s1 _\markup " " s1*2
  s1 ^\markup \bold \box \fontsize #7 B s1*4 
  s1 _\markup " " s1*2
  s1 ^\markup \bold \box \fontsize #7 C
}

verse = \lyricmode {
  All of me
  Why not take all of me
  Can't you see
  I'm no good with -- out you

  Take my lips
  I want to lose them
  Take my arms
  I'll ne -- ver use them

}

verseB = \lyricmode {
  
  Your goo -- dbye
  Left me with eyes that cry
  How can I
  Get a -- long with -- out you
  \repeat unfold 16 { \skip 1 }
  You took the part
  That once was my heart
  So why not take all of me
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
          \addlyrics \verse
          \addlyrics \verseB
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
          \addlyrics \verse
          \addlyrics \verseB
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
          \addlyrics \verse
          \addlyrics \verseB
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
        >> 
        \addlyrics \verse
        \addlyrics \verseB     
      >>
    }
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
        >> 
      >>
    }   
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