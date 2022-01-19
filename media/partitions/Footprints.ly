
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

title = #"Footprints"
composer = #"Wayne Shorter"
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
  c1.:m11 s s s f:m11 s c:m11 s
  s8 fis2.:m5-7 f:11+13 e:5+7.9-11+ a:5+7.9-11+ c1.:m11
}


theNotes =  \relative c' {
  \clef "treble" \key bes \major \time 4/4
  \showStartRepeatBar \bar "[|:"
  <f bes>4-- q-- q--  q8( <g c> ~ q4. <e a>8 
  \times 6/5 { <f bes>8 <e a> <d g> <c f> <a d> ~ } q2 <g c>4-.)
  r2 r8 <a d>( ~ q2 <g c>4-.)
  r2 r8 <a d>( ~ q2 <g c>4-.) \break
  <f' bes>4-- q-- q--  q8( <g c> ~ q4. <as! d>8 
  \times 6/5 { <bes es>8 <as d> <g c> <f bes> <d g> ~ } q2 <c f>4-.)
  \times 6/5 { <f bes>8( <e a> <d g> <c f> <a d> ~ } q2 <g c>4-.)
  r2 r8 <a d>( ~ q2 <g c>4-.) \break
  \cadenzaOn s8
  %\once \override Score.AccidentalPlacement.right-padding = #-0.4
  <fis' b>4( q q <f b>8 <a d> ~ q4 <d, g>8 <f bes> ~ \cadenzaOff \bar "|"
  q2 ~ \times 2/3 { q8 <e a> <es as> } <d g>2 ~ q16 <g c> <d g> <des ges>)
  <c f>1. ~ q1. \break
  \bar ":|]"
}



Basse = \relative c' {
  \clef "bass" \key bes \major \time 6/4
  \showStartRepeatBar \bar "[|:"
  \repeat unfold 4 { c,4 g' c es2 ~ es8 g, }
  \repeat unfold 2 { c,4 f bes es2 ~ es8 a, }
  \repeat unfold 2 { c,4 g' c es2 ~ es8 g, }
  \cadenzaOn s8 fis2. f \cadenzaOff | e a, | \repeat unfold 2 { c4 g' c es2 ~ es8 g, }
}


grille = \chordmode {
  \bar "[|:"
 \repeat percent 4 c1:m11 \break
 \repeat percent 2 f:m11 \repeat percent 2 c:m11 \break
 \/ fis2:m5-7 f:7.11+13 \/ e2:5+7.9-11+ a2:5+7.9-11+ \repeat percent 2 c1:m11
  \bar ":|]" }

marques = \relative c' { 
  s1 
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
        \new StaffGroup <<     
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >>
        \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new Staff  <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \Basse
      >> >> >>
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
        \new StaffGroup <<     
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \transpose c d \theNotes
        >>
        \new ChordNames {
          \set chordChanges = ##t
          \transpose c d \harmonies
        }
        \new Staff  <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \Basse
      >> >> >>
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
        \new StaffGroup <<     
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \transpose c a \theNotes
        >>
        \new ChordNames {
          \set chordChanges = ##t
          \transpose c a \harmonies
        }
        \new Staff  <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \Basse
      >> >> >>
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
        \new StaffGroup <<     
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >>
        \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new Staff  <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \Basse
      >> >> >>
} % }  \bookpart {
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
        \new StaffGroup <<     
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \transpose c d \theNotes
        >>
        \new ChordNames {
          \set chordChanges = ##t
          \transpose c d \harmonies
        }
        \new Staff  <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \Basse
      >> >> >>
} % }  \bookpart {
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
        \new StaffGroup <<     
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \transpose c a \theNotes
        >>
        \new ChordNames {
          \set chordChanges = ##t
          \transpose c a \harmonies
        }
        \new Staff  <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \Basse
      >> >> >>
} % }  \bookpart {
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