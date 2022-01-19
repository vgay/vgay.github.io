
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

title = #"Crystal Silence"
composer = #"Chick Corea"
meter = #"(Ballad)"
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
  s4 a1:m7 e:m7 f:7+ b:m7 bes:7+11+ 
  a:m9 b4:m c d:7sus4 e:9+ a1:m9 bes:7+11+
  d:m7 e:9+ d:m7 e:9+ f:7+ g:7sus4 a1*2:m9
  d1:7+ a:m7 bes:7+ f:m7 c:5+7+ g:m7 b:5+7 e:9-
  a1:m7 e:m7 f:7+ b:m7 bes:7+11+ 
  a:m9 b4:m c d:7sus4 e:9+ a1:m9 bes:7+11+
  r1 f:7+/a a:m9
}


theNotes =  \relative c''' {
  \clef "treble" \key c \major \time 4/4
 \partial 4 a4
  \repeat volta 2 {
    \A g2. e8 b | d2 b4. c8 | 
    \override Stem.direction = #DOWN \tuplet 3/2 { d4 c b } \revert Stem.direction a4. g8 | e2. e4 |
    e d \tuplet 3/2 { g c e } | d2 c4. d8
  }
  \alternative {
    { e4 d c b8 a16 g | a1~ | a2 r4 a' }
    { \break e d c4. a8 }
  } d2. c8 d | e4 d c4. a8 | d2 c4. d8 | 
  \tuplet 3/2 { e4 d c } b g | \tuplet 3/2 { d' c b } a4. f8 |
  a1~ | a2. g'4
  \bar "||" \break
  \B fis2. a4 | e2. g4 | d2. f4 | c2. es4 |
  b2. d4 | a2. c4 | g2. fis4 | e2. a'4 \bar "||" \break
  \A g2. e8 b | d2 b4. c8 | 
  \override Stem.direction = #DOWN
    \tuplet 3/2 { d4 c b } \revert Stem.direction a4. g8 | e2. e4 |
    e d \tuplet 3/2 { g c e } \break | d2 c4. d8
    e4 d c b8 a16 g | a1~ | \toCoda a2. r4 | R1
    _\markup "Solo Break------>"
    \break \bar ".|"
    \Coda a1~ | a \fermata
}

grille = \chordmode {
  \bar "[|:"
 a1:m7 e:m7 f:7+ \break
 b:m7 bes
  \bar ".." }

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
%   } }  \bookpart {
%     \score {
%       \layout {
%         indent = 0
%         ragged-right = ##f
%         ragged-last = ##f
%         \context {
%           \Score
%           \remove "Volta_engraver"
%           \omit Clef % Cacher la clef
%           \omit TimeSignature % cacher la métrique
%           \omit BarNumber             
%           \override SpacingSpanner.strict-note-spacing = ##t
%           proportionalNotationDuration = #(ly:make-moment 1/16)
%         }
%       }
%       <<
%         \new Staff \with {
%           \remove "Staff_symbol_engraver"
%         }    
%         \marques
%         \new ChordNames \with {
%           \override ChordName.extra-offset = #'(10 . -1 )         
%           \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
%           \override BarLine.bar-extent = #'(-5 . 5)
%           \consists "Bar_engraver"
%           \override StaffSymbol.line-positions = #'( -10 10 ) 
%           \consists "Staff_symbol_engraver"
%           \consists "Percent_repeat_engraver"
%           \consists "Volta_engraver"
%         }
%         \grille
%       >>
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
%   } }  \bookpart {
%     \score {
%       \layout {
%         indent = 0
%         ragged-right = ##f
%         ragged-last = ##f
%         \context {
%           \Score
%           \remove "Volta_engraver"
%           \omit Clef % Cacher la clef
%           \omit TimeSignature % cacher la métrique
%           \omit BarNumber             
%           \override SpacingSpanner.strict-note-spacing = ##t
%           proportionalNotationDuration = #(ly:make-moment 1/16)
%         }
%       }
%       <<
%         \new Staff \with {
%           \remove "Staff_symbol_engraver"
%         }    
%         \marques
%         \new ChordNames \with {
%           \override ChordName.extra-offset = #'(10 . -1 )         
%           \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
%           \override BarLine.bar-extent = #'(-5 . 5)
%           \consists "Bar_engraver"
%           \override StaffSymbol.line-positions = #'( -10 10 ) 
%           \consists "Staff_symbol_engraver"
%           \consists "Percent_repeat_engraver"
%           \consists "Volta_engraver"
%         }
%         \transpose c d \grille
%       >>
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
%   } }  \bookpart {
%     \score {
%       \layout {
%         indent = 0
%         ragged-right = ##f
%         ragged-last = ##f
%         \context {
%           \Score
%           \remove "Volta_engraver"
%           \omit Clef % Cacher la clef
%           \omit TimeSignature % cacher la métrique
%           \omit BarNumber             
%           \override SpacingSpanner.strict-note-spacing = ##t
%           proportionalNotationDuration = #(ly:make-moment 1/16)
%         }
%       }
%       <<
%         \new Staff \with {
%           \remove "Staff_symbol_engraver"
%         }    
%         \marques
%         \new ChordNames \with {
%           \override ChordName.extra-offset = #'(10 . -1 )         
%           \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
%           \override BarLine.bar-extent = #'(-5 . 5)
%           \consists "Bar_engraver"
%           \override StaffSymbol.line-positions = #'( -10 10 ) 
%           \consists "Staff_symbol_engraver"
%           \consists "Percent_repeat_engraver"
%           \consists "Volta_engraver"
%         }
%         \transpose c a \grille
%       >>
} } }