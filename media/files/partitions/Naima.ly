
\version "2.19.80"
#(set-global-staff-size 18)
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
}

title = #"Naima"
composer = #"John Coltrane"
meter = #"(Ballad)"
kwtempo = #"Slow"
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
  asplayed = #"John Coltrane" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=QTMqes6HDqU"
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
  %   \context { \RemoveEmptyStaffContext 				% ne pas imprimer les lignes vides (autres que la première)
  %              \override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
  %   }
}



form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##t
  bes1:m7/es es:m7 as2:7+/es g:7+/es as1:7+/es
  b:7+/bes bes:5+7.9-11+ b:7+/bes bes:5+7.9-11+ 
  d:5+7+/bes b:7+/bes as:7+/bes ges:11+13/bes
  bes1:m7/es es:m7 as2:7+/es g:7+/es as1:7+/es
  as2:7+/es g:7+/es as1:7+ as2:7+/es g:7+/es as1:7+  
  as2:7+/es g:7+/es 
  as:7+ des:7+ as:7+ des:7+ as:7+ des:7+ as1:7+9
}


theNotes =  \relative c'' {
  \clef "treble" \key as \major \time 4/4
  \showStartRepeatBar \bar "[|:"
  \A \repeat volta 2 {
    c2. ~ \times 2/3 { c8 bes es } | f,2. r4 | 
    as2 ges4 ~ \times 2/3 { ges8 es ges } | es2. r4 \break }

  \B bes'2. ~ \times 2/3 { bes8 bes bes } g2. \times 2/3 { r8 es f }
  bes2. ~ \times 2/3 { bes8 bes bes } g2. \times 2/3 { r8 f es} \break
  des'2. ~ \times 2/3 { des8 bes des } | bes2. \times 2/3 { r8 ges bes }
  g2. ~ \times 2/3 { g8 es g } | es2. r4 | \bar "||" \break
  \A c'2. ~ \times 2/3 { c8 bes es } | f,2. r4 | 
  as2 ges4 ~ \times 2/3 { ges8 es ges } |
  es2. r4 \bar "|." \break \mark \markup \box Ending
  as2 ges4 ~ \times 2/3 { ges8 es ges } | es1
  as2 ges4 ~ \times 2/3 { ges8 es ges } | es1 \break
  as2 ges4 ~ \times 2/3 { ges8 es ges } 
  es2 f | g as | bes c | es1 \fermata
  \bar ".."
}


Basse = \relative c {
  \clef "bass" \key as \major \time 4/4
  \showStartRepeatBar \bar "[|:"
  \A \repeat volta 2 {
    es4~ \tuplet 3/2 { 8 es'8 8 } es,2 | 
    es4~ \tuplet 3/2 { 8 es'8 8 } \tuplet 3/2 { 8 es,4~ } 4 |
    es4~ \tuplet 3/2 { 8 es'8 8 } es,2 | 
    as,4~ \tuplet 3/2 { 8 es'8 8 } \tuplet 3/2 { 8 as,4~ } 4 } \break
  \B \repeat percent 4 { bes'4~ \tuplet 3/2 { bes8 8 8 } bes4~ \tuplet 3/2 { bes8 8 8 } }  \break
  \repeat percent 3 { bes4~ \tuplet 3/2 { bes8 8 8 } bes4~ \tuplet 3/2 { bes8 8 8 } }
  bes4~ \tuplet 3/2 { 8 8 8 } 4.. 16 \bar "||" \break
  \A es,4~ \tuplet 3/2 { 8 es'8 8 } es,2 | 
  es4~ \tuplet 3/2 { 8 es'8 8 } \tuplet 3/2 { 8 es,4~ } 4 |
  es4~ \tuplet 3/2 { 8 es'8 8 } es,2 |
  as,4~ \tuplet 3/2 { 8 es'8 8 } \tuplet 3/2 { 8 as,4~ } 4 |
  \bar "|." \break \mark \markup \box Ending
  \repeat percent 2 {
    es'4~ \tuplet 3/2 { 8 8 8 } es2 | 
    as,4~ \tuplet 3/2 { 8 es'8 8 } \tuplet 3/2 { 8 as,4~ } 4 } \break
  es'2 2 as, des as des as des as1 \fermata
}

grille = \chordmode {
  \bar "[|:"
 
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
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          \theNotes
        >> 
      >>
  } \markup \with-color #red \bold "Bass Line nest page" }
  \bookpart { \score { 
    <<
      \new ChordNames { \harmonies }
      \new Staff \Basse
              >> }
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "BbTab") 
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
        >> 
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c a \theNotes
        >> 
      >>
    } %\form
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
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >> 
        \new Staff \Basse
      >>
    } %\form
    %}  \bookpart {
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
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
        >> 
        \new Staff \Basse
      >>
    } %\form
    %}  \bookpart {
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
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice  
          \transpose c a \theNotes
        >> 
        \new Staff \Basse
      >>
    } %\form
    %}  \bookpart {
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