
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

title = #"Rapture"
composer = #"Harold Land"
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
  tagline = ##f
  asplayed = #"Poncho Sanchez" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=NxVU1Yk6NRo"
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
    \Staff
    printPartCombineTexts = ##f
    \consists "Merge_rests_engraver"
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
}



harmonies = \chordmode {
  \set chordChanges = ##t
  r1*9
  f4.:7+9 e4:7sus4 c4.:7+/d
  des1*4:7+ f1*3:7+ 
  \startParenthesis \parenthesize f4.:7+9 e4:7sus4 
  \endParenthesis \parenthesize c4.:7+/d
  f1:7+ f1:7+
  a:9-13 d:5+7.9-11+ g:9-13 c:5+7.9-11+
  f1*2:m9 bes:13sus2 f1*2:m9 bes:9-13
  es1:7+9 g:5+7.9-11+ c1*2:7+9 c:5+7.9-11+ c:7+9
}


theNotes =  \relative c'' {
  \clef "treble" \time 4/4
  \compressFullBarRests
  \override MultiMeasureRest #'expand-limit = #1
  \mark \markup \box \bold Intro
  \repeat volta 2 { \inlineMMRN R1*6 } 
  \alternative { 
    {  \inlineMMRN R1*2 }
    { R1 \Segno
      <a c>4. <b d>8~ q4 <c e> } }
  \repeat volta 2 {
    \A
    <c f>1~ | q~ | q~ | q2 r8 q8 \tuplet 3/2 { q16 <d g> <c f> } <bes es>8 | \break
    <g c>4. q8~ q2~ | q1~ |
  }
  \alternative {
    {  q | <a c>4. <b d>8~ q4 <c e> }
    { <g c>1 \repeatTie | <a c>4. <c f>8~ q4 <f a> }
  }
  \bar "||" \break
  \B \bar "||" \break
  <ges bes>2~ \tuplet 3/2 { q4 <f a> <ges bes> } |
  <f bes>2~ q8 <f a>4. |
  <e as>2~ \tuplet 3/2 { q4 <e g> <e bes'> } |
  <es as>2 \tuplet 3/2 { r4 <c es> <bes des> } 
  <as c>1~ | q2 \tuplet 3/2 { r4 <bes es> <es bes'> }
  <c g'>1~ | q2~ q8 <bes f'>4. | 
  <as c>1~ | q2 \tuplet 3/2 { r4 <bes es> <es bes'> } 
  <ces g'>1 | q2 r8 <es as>4. | 
  <f bes>2~ \tuplet 3/2 { q4 <d g> <bes es> } |
  <es as>2~ \tuplet 3/2 { q4 <d g> <c f> }  |
  \Coda
  <d g>1~ | q | 
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \once \override Score.RehearsalMark.extra-offset = #'(13 . 0)
  \mark \markup \with-color #red \bold \box "D.S. al Coda" |   
  \inlineMMRN R1*2
 
  \bar "|."
  \break \Coda
  <d g>1~ | q~ | q~ | q 
  %     \mark #1
  \bar ".."
}

Basse =  \relative c {
  \time 4/4 \clef "bass"
  \repeat volta 2 { 
    des4 as'8 des~ des es4 f8~ | f4. es8 f4 es | 
    des,4 as'8 des~ des es4 f8~ | f4. f8 es4 des | \break
    f,4. c'8~ c d4 e8~ | e4. e8 d4 c |
  }
  \alternative {
    { f,4. c'8~ c d4 e8~ | e4. e8 d4 c  }
    { f,4. c'8~ 2 | f,4. e8~ 4 d \break } 
  } 
  des4 as'8 des~ des es4 f8~ | f4. es8 f4 es | 
  des,4 as'8 des~ des es4 f8~ | f4. f8 es4 des | \break
  f,4. c'8~ c d4 e8~ | e4. e8 d4 c 
  f,4. c'8~ 2 | f,4. e8~ 4 d 
  f4. c'8~ c d4 e8~ | e4. e8 d4 c 
}

grille = \chordmode {
  \bar "[|:" \repeat percent 4 des1:7+ \break
  \repeat percent 4 f:7+ \bar ":\]" \break
  a:9-13 d:5+7.9-11+ g:9-13 c:5+7.9-11+ \break
  \repeat percent 2 f:m9 \repeat percent 2 bes:13sus2 \break
  \repeat percent 2 f:m9 \repeat percent 2 bes:13sus2 \break
  es:7+9 g:5+7.9-11+ \repeat percent 2 c:7+9 \break 
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
  \mark \markup \with-color #red "To Coda"
  \repeat percent 2 c:5+7.9-11+ \bar "|." \stopStaff s1 \bar "" s1 \bar "" \break
  \Coda
  \startStaff \repeat percent 4 c:7+9
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*11 
  s1 ^\markup \bold \box \fontsize #7 B 
}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  \header { meter = \markup \with-color #red "Partition sur 2 pages" }
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
        >> 
        \new Staff \Basse
      >>
    }     \markup 
    
    \fill-line {
      \column {  }
      \column { \line { \with-color #red \fontsize #2 "Solos on AAB then D.S. al Coda" } }
    }
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
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
        >> 
      >>
    }     \markup 
    
    \fill-line {
      \column {  }
      \column { \line { \with-color #red \fontsize #2 "Solos on AAB then D.S. al Coda" } }
    }
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
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c a, \theNotes
        >> 
      >>
    }     \markup 
    
    \fill-line {
      \column {  }
      \column { \line { \with-color #red \fontsize #2 "Solos on AAB then D.S. al Coda" } }
    }
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
        \new ChordNames \harmonies 
        \new Staff \with { instrumentName = \CleSol } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >> 
        \new Staff \Basse
      >>
    }
    \markup 
    
    \fill-line {
      \column {  }
      \column { \line { \with-color #red \fontsize #2 "Solos on AAB then D.S. al Coda" } }
    }
  }  \bookpart {
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
        >> 
      >>
      %   }   \markup \pad-markup #2 " "
    }     \markup 
    
    \fill-line {
      \column {  }
      \column { \line { \with-color #red \fontsize #2 "Solos on AAB then D.S. al Coda" } }
    }
  }  \bookpart {
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
          \transpose c a, \theNotes
        >> 
      >>
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
    }     \markup 
    
    \fill-line {
      \column {  }
      \column { \line { \with-color #red \fontsize #2 "Solos on AAB then D.S. al Coda" } }
    }
} }