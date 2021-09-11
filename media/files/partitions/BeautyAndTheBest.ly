
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
  ragged-last = ##t
  markup-system-spacing = #'((basic-distance . 12)
                             (minimum-distance . 5)
                             (padding . 0))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
}

title = #"Beauty And The Best"
composer = #"Wayne Shorter"
meter = #"(Funk Ballad)"
kwtempo = #"Slow"
kwstyle = #"Funk Ballad"

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
  asplayed = #"Wayne Shorter" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=0PQKnjwlN6g"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
    voltaSpannerDuration = #(ly:make-moment 4 4)
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
  \set chordChanges = ##f
  f1*4:13sus4 f1*3:13sus4 f2:13 e:9+
  a1:m7 b2:5+9+ e2:5+9+ a1:m7 g2:m7 c:13
  f1:m7 es2:m7 as:13 des1:7+9 c:8 c:8
  b2:m7.11 e:7 a:m7.11 d:7 g1:m5-7 c1:8 f1*2:13sus4 R1*16 f1*2:13sus4
}


theNotes =  \relative c' {
  \clef "treble" \key f \major \time 4/4
  \new Voice \with { \consists "Pitch_squash_engraver" }  {
  \Intro
  \repeat percent 2 { <a bes d f>4-. q-. q-. q-. | <d fis b>8-. <es g c> <a, bes d f>4-. q-. q-.}
  \Segno \repeat volta 2 { 
    <a bes d f>4-. q-. q-. q-. | <d fis b>8-. <es g c> <a, bes d f>4-. q-. q-.
    <a bes d f>4-. q-. q-. q-. | 
    r8. g'16~ _\markup (sop.) g a8 g16 bes8. g16 b8. g16 \break
    e1 | r4 r16 g a g bes8 g b8. g16 |
    e1 | r4 r16 c' d c es8. c16 e8. c16 | \break
    as1 | c8. as16~ as2~ as16 c8 es16~ |
    es4~ es16 c as8~ as2 }
  \alternative {
    { \improvisationOn b1 \improvisationOff }
    { r8. as16 bes8. as16 b8. as16 c8. es16 }
  } \break
  e4.. b16~ b4.. c16 | d4.. a16~ a4.. bes16 | c2. r4 |
  c'8 bes16 as f e es c b! bes as f e es c b! |  \break
  \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
  \toCoda
  bes as8.~ as4 \comp #6 
  \repeat volta 2 {
    \once \override MultiMeasureRest.layer = #-2
    \once \override TextScript #'extra-offset = #'(35 . -1 )
    s1*0 ^\markup \fontsize #4 "Solos"
    \once \override MultiMeasureRestNumber.transparent = ##t
    \override Score.MultiMeasureRest.minimum-length = #90
    R1*16 }  \break 
  \doubleMark 
  \markup {\with-color #red { \bold "D.S. al Coda" \small "(take 2nd x)" } }
  \markup { \with-color #red \musicglyph "scripts.varcoda" }
  \repeat volta 2 { 
    bes16 as8.~ as4 \comp #6 | 
    \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
    \mark \markup "solo to fade  " }
} }

theNotesTab =  \relative c' {
  \clef "treble" \key f \major \time 4/4
  \new Voice \with { \consists "Pitch_squash_engraver" }  {
  \compressFullBarRests
  \override MultiMeasureRest.expand-limit = #2
  R1*4
  \Segno \repeat volta 2 { 
    R1*3
    r8. g'16~ g a8 g16 bes8. g16 b8. g16 \break
    e1 | r4 r16 g a g bes8 g b8. g16 |
    e1 | r4 r16 c' d c es8. c16 e8. c16 | \break
    as1 | c8. as16~ as2~ as16 c8 es16~ |
    es4~ es16 c as8~ as2 }
  \alternative {
    { \improvisationOn b1 \improvisationOff }
    { r8. as16 bes8. as16 b8. as16 c8. es16 }
  } \break
  e4.. b16~ b4.. c16 | d4.. a16~ a4.. bes16 | c2. r4 |
  c'8 bes16 as f e es c b! bes as f e es c b! |  \break
  \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
  \toCoda
  bes as8.~ as4 \comp #6 
  \repeat volta 2 {
    \once \override MultiMeasureRest.layer = #-2
    \once \override TextScript #'extra-offset = #'(35 . -1 )
    s1*0 ^\markup \fontsize #4 "Solos"
    \once \override MultiMeasureRestNumber.transparent = ##t
    \override Score.MultiMeasureRest.minimum-length = #90
    R1*16 }  \break 
  \doubleMark 
  \markup {\with-color #red { \bold "D.S. al Coda" \small "(take 2nd x)" } }
  \markup { \with-color #red \musicglyph "scripts.varcoda" }
  \repeat volta 2 { 
    bes16 as8.~ as4 \comp #6 | 
    \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
    \mark \markup "solo to fade  " }
} }

chordsRhythm = \relative c' {
  \clef "treble" \key f \major \time 4/4
  
}


Basse = \relative c {
  \clef "bass" \key f \major \time 4/4
  \new Voice \with { \consists "Pitch_squash_engraver" }  {
    \repeat percent 2 { r8. es16  r8. es16 r8. es16 r8. es16 | 
                        r4 r8. es16 r8 f16 es r8 <d gis>16 <es a> }
    r8. es16  r8. es16 r8. es16 r8. es16 |
    r4 r8. es16 r8 f16 es r8 <d gis>16 <es a>
    r8. es16  r8. es16 r8. es16 r8. es16 |
    \improvisationOn c2 c \improvisationOff
} }

grille = \chordmode {
  \bar "[|:"
 
  \bar ".." }

marques = \relative c' { 

}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotesTab
        >> 
      >>
    } %\form
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
          \transpose c d \theNotesTab
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
          \transpose c a, \theNotesTab
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
        \new Staff \with { instrumentName = \CleSol } \theNotes
        \new Staff  \Basse
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
        \new Staff \with { instrumentName = \Bb  } \transpose c d \theNotes
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
        \new Staff \with { instrumentName = \Eb } \transpose c a, \theNotes
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