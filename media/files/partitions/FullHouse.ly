
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

title = #"Full House"
composer = #"Wes Montgomery"
meter = #"(Med. Jazz Waltz)"
kwtempo = #"Medium"
kwstyle = #"Jazz Waltz"

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
  \set chordChanges = ##t
  r4. s2.*9
  f2.:m bes:7 f:m bes:7 f2.:m bes:7 f:m c:9+ 
  bes:7 f:m f:m
  bes:m7 es:7 as:7+ des:7
  ges:7 b:7+ g:m5-7 c:5+7.9-11+
  f2.:m bes:7 f:m bes:7 f2.:m bes:7 f:m c:9+ 
  bes:7 f:m f:m
}


theNotes =  \relative c'' {
  \clef "treble" \key as \major \time 3/4
  \mark \markup \bold \box Intro
  \partial 8*3 
  c8 r es8 | 
  \repeat volta 2 {
    f8 c es f r4 | r8 \acciaccatura fis8 g8 ~ g4. c,8 |
    es8 es c es r4 | r8 c4 es c8
    f8 c es f r g~ | g f4 es8 c bes | c bes as f r4
  }
  \alternative { { r4. c'4 es8 } { r2. } } \break
  \repeat volta 2 {
    f,8( as) r2 | f8( bes) r4. f8~ | 
    f as4 f8 as f | <bes d>8 <as c>  <bes d>4 <as c> | \break
    f8( as) r2 | }
  \alternative {
    { \set Score.repeatCommands = #'((volta "1, 3")) f8( bes) r4. f8~ | f as4 f8 as4 | r <c, es>2 \bar ":|]" }
    { \set Score.repeatCommands = #'((volta #f)(volta "2, 4")) f8( bes) r4. c,8 | f as g es4 c8 | f8-- g4-- as-- c8--  }
  }
  \bar "||" \break \B
  <f as>2. | r8 <g bes>4. r8 <es as>
  <c es>2. r8 <f as>4. r8 <des f>
  <bes des>2.~ | <bes des>4 <g bes>8 <as ces> <bes des> <b d> |
  \tieDown <c f>2.~ | <c e> \bar ".|:-||"
  \break \A
  \repeat volta 2 {
    f,8( as) r2 | f8( bes) r4. f8~ | 
    f as4 f8 as f | <bes d>8 <as c>  <bes d>4 <as c>  | \break
    f8( as) r2 | }
  \alternative {
    { f8( bes) r4. f8~ | f as4 f8 as4 | r <c, es>2 }
    { f8( bes) r4. c,8 | f as g es4 c8 | f2. }
  }
  \bar ".."
}

grille = \chordmode {
  \bar "[|:"
  f1:m bes:7 f:m bes:7 \break
  f:m bes:7 des:7 c:9+ \break
  f1:m bes:7 f:m bes:7 \break
  f:m bes:7 \/ des2:7 c:7 \startStaff f1:m \bar ":|]" \break
  bes:m7 es:7 as:7+ des:7 \break
  ges:7 b:7+ g:m5-7 c:5+7.9-11+ \break
  f1:m bes:7 f:m bes:7 \break
  f:m bes:7 des:7 c:9+ \break
  f1:m bes:7 f:m bes:7 \break
  f:m bes:7 \/ des2:7 c:7 \startStaff f1:m 
  \bar ".." }

marques = \relative c' { 
  s1  ^\markup \bold \box \fontsize #7 A s1*15
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
    \markup "N.B. dans les passages à 2 voix la mélodie originelle est celle du bas"
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
    } \markup "N.B. dans les passages à 2 voix la mélodie originelle est celle du bas"
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
    } \markup "N.B. dans les passages à 2 voix la mélodie originelle est celle du bas"
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
    }  \markup "N.B. dans les passages à 2 voix la mélodie originelle est celle du bas"
  }
  \bookpart {
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
      >> >>

    } \markup "N.B. dans les passages à 2 voix la mélodie originelle est celle du bas"
  }
  \bookpart {
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
      >> >>
    } \markup "N.B. dans les passages à 2 voix la mélodie originelle est celle du bas"
  }
  \bookpart {
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