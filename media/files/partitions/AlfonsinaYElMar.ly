
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

title = #"Alfonsina y el mar"
composer = #"Ariel Ramirez"
meter = #"(Med. Zamba)"
kwtempo = #"Medium"
kwstyle = #"Zamba"



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
  s8 a2.:m e:9- f4.:7 e:7
  a2.:m a:m
  e4.:dim a:7 d2.:m7 e:9- a:m d4.:m7 g:7 c:7+ f:7+
  b:9- e:9- a2.:m g:7 c4.:7+ d:m dis:dim e:9-
  a2.:m a:m
  d4.:m7 g:7 c2.:7+ e4.:dim a:7 d1.:m7 a2.:m7 
  e:7 bes4. a:7 d:m7 d:m6 c:7+ f b:9- e:7 a2.:m
}


theNotes =  \relative c'' {
  \clef "treble" \key c \major \time 6/8
  \Intro 
  \partial 8 es8 | % 1
  \repeat volta 2 {
    e!8. c16 a16 e16 e'4 ~ e16 cis16 | % 2
    d8. b16 gis16 e16 d'4. | % 3
    c4 b16 a16 b4. }
  \alternative {
    { a4. ~ a8 r8 es'8 }
    { a,4. ~ a8 g'16 a16 bes16 a16 }
  } \break
  \repeat volta 2 {
    \A
    bes8. a16 gis8 a4 g8 | 
    f4. ~ f8 d16 e16 f16 e16 | % 11
    f8. e16 dis8 e4 d8 | % 12
    c4. ~ c8 a16 b16 c16 b16 | % 13
    c8. b16 c8 d8. c16 d8 | % 14
    e8. d16 c8 d8. c16 b8 | % 15
    c8. b16 a8 b4. | % 16
    a4. ~ a8 d16 e16 f16 e16 | % 17
    f8. e16 f8 b4 a8 | % 18
    e8. d16 c8 d4. | % 19
    c8. b16 a8 b4.
  }
  \alternative {
    {
      | 
      a4. ~ a8 g'16 a16 bes16 a16
    }
    {
      | % 21
      a,4. ~ a8 a'16 b16 c16 b16
    }
  } \bar "||" \break
  \B c8. b16 c8 d8. b16 g8 | % 23
  e4. ~ e8 e16 f16 g16 a16 | % 24
  bes4 a8 g8. f16 e8 | % 25
  a4. ~ a8 d,16 e16 f16 e16 | % 26
  d8. a'16 g8 f8. e16 d8 | % 27
  c4. ~ c8 a'16 gis16 b16 a16 | % 28
  gis8. b16 bes8 c4 b8 | % 29
  bes4 a8 ~ a4 a16 g16 |
  f8. a16 g8 f8. e16 d8 | % 31
  e4 dis16 e16 f4 e16 f16 | % 32
  fis4 f16 fis16 as4 fis16 as16 | % 33
  a!4. r8 r4 
  
  \bar ".."
}

grille = \chordmode {
  \bar "[|:" a1:m e:9- \/f2:7 e:7 \startStaff a1:m \break \bar":|]"
  \bar "[|:" \/e2:dim a:7 \startStaff d1:m7 e:9- a:m \break
  \/d2:m7 g:7 \/c:7+ f:7+ \/b:9- e:9- \startStaff a1:m \break 
  g:7 \/c2:7+ d:m \/ dis:dim e:9- \startStaff a1:m \break 
  \/d2:m7 g:7 \startStaff c1:7+ \/e2:dim a:m \startStaff d1:m7 \break
  d:m7 a:m7 e:7 \/bes2 a:7 \break
  \/d:m7 d:m6 \/c:7+ f \/b:9- e:7 \startStaff a1:m
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 Intro s1*3 
  s1 ^\markup \bold \box \fontsize #7 A s1*11
  s1 ^\markup \bold \box \fontsize #7 B
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
          \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c a, \theNotes
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
          \new Voice  \transpose c a, \theNotes
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