
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



title = #"Don't Get Around Much Anymore"
composer = #"D. Ellington & B. Russel"
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
 r1s8 c4.:7+ d4:m7 dis8:dim c/e s1 s8 c4.:7 b4:7 bes8:7 a:7
  s1 d:7 g:7 c:6 g8:7 r2.. c1:6 g2:m7 c:7
  f1:6 fis:dim c:7+ c:7 f:6 fis2:m5-7 b:9- e:m7 es:dim d8:m7 r2..
  s8 c4.:7+ d4:m7 dis8:dim c/e s1 s8 c4.:7 b4:7 bes8:7 a:7
  s1 d:7 g:7 c2:6 
  \startParenthesis \parenthesize es:7 d:m7 \endParenthesis \parenthesize g:7
}

chordsRhythm = \relative c''' {
\override Rest #'staff-position = #6
  \improvisationOn \override NoteHead.no-ledgers = ##t 
  s1 r8 b4. b4 b8 b | s1 | r8 b4. b4 b8 b | s1*15
  r8 b4. b4 b8 b | s1 | r8 b4. b4 b8 b |
    \improvisationOff }

theNotes =  \relative c'' {
  \clef "treble" \key f \major \time 4/4
  \oneVoice               % j'ai supprimé les deux « \override ... »
  r8 e4 d8 c g f e~
  \repeat volta 2 {
    \A e1 | r8 e'4 d8 c g f e~ | e1     
    r8 g4 f8 e d c c'~ | \break
    c4. a8~ a2 | r8 e f fis g c, dis e
  }
  \alternative {
    { c1 | r8 e'4 d8 c g f e _\laissezVibrer }
    { c1~ | c2. r4 }
  }
  \bar "||" \break
  \B d'2 c8 a4 c8~ | c2. c4 | d2 c8 g4 e8~ | e2. c'4 |
  d2 c8 a4 c8~ | c1 | r8 b b b b a4 g8~ | g e'4 d8 c g f e~ | \bar "||" \break
  \A e1 | r8 e'4 d8 c g f e~ | e1
  r8 g4 f8 e d c c'~ | c4. a8~ a2 | r8 e f fis g c, dis e |
  c1~ | c4 r2.
  \bar "|."
}

grille = \chordmode {
  \bar "[|:"
 \w d2:7+ e4:m7 es:dim c1/e \w d2:7+ b4:7 bes:7 a1:7 \break
 d:7 g:7 c:6 \set Score.repeatCommands = #'((volta "1"))
 g:7   \set Score.repeatCommands = #'((volta #f) end-repeat) \break
 \stopStaff s \bar "" s \bar "" s
 \startStaff \set Score.repeatCommands = #'((volta "2")) \/g2:m7 c:7
 \startStaff \set Score.repeatCommands = #'((volta #f)) \break
 f1:6 fis:dim c:7+ c:7 \break
 f:6 \/fis2:m5-7 b:9- \/e:m7 es:dim7   d1:m7 \break
  \w d2:7+ e4:m7 es:dim c1/e \w d2:7+ b4:7 bes:7 a1:7 \break
  d:7 g:7 \/c2:6 es:7 \/d:m7 g:7
 
  \bar ".." }

marques = \relative c' { 
  s1  ^\markup \bold \box \fontsize #7 A s1*11 
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
          \new Voice \with { \consists "Pitch_squash_engraver" } \theNotes \\ \chordsRhythm
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
          \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c d \theNotes  \\ \chordsRhythm
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
          \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c a \theNotes \\ \chordsRhythm
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
          \new Voice \with { \consists "Pitch_squash_engraver" } \theNotes \\ \chordsRhythm
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
          \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c d \theNotes \\ \chordsRhythm
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
          \new Voice  \transpose c a \theNotes \\ \chordsRhythm
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