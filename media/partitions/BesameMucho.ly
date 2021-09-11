
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
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Besame Mucho"
composer = #"Consuelo Velazquez"
meter = #"(Bolero)"
kwtempo = #"Medium"
kwstyle = #"Bolero"

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
  % asplayed = #"" % doit être commentée si vide
  url = #""
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
  d1*2:m6 g:m6 g2:m6 d:9- e:m5-7 a:9- d1:m6 \parenthesize a:5+7.9- 
  a:m5-7 d:9- g:m6 s d1:m6  b2:m5-7 e:9- a1:7 s e2:9- a:9- d1:m6 s
  g1:m6 d:m6 e2:5-7 a:9- d2:m6 \parenthesize d:9- g1:m6 d:m6 e2:7 bes:9- a1:9-
  d1*2:m6 g:m6 g2:m6 d:9- e:m5-7 a:9- d1:m6 \parenthesize a:5+9- 
  a:m5-7 d:9- g:m6 s d2:m6 \parenthesize b:m5-7 e:9- a:9- d1:m6
}


theNotes =  \relative c' {
  \clef "treble" \key f \major \time 4/4 \A
  \showStartRepeatBar \bar "[|:" \repeat volta 2 { 
    d4 8 8~ 2~ | 2 \tuplet 3/2 { 4 e f } | a2 g~ | 2. r4 |
    \tuplet 3/2 { 4 4 4 } \tuplet 3/2 { a4 4 4 } | 
    \tuplet 3/2 { bes4 4 4 } \tuplet 3/2 { cis d e } | a,1~ | 2 r | \break
    d4 8 8~ 2~ | 2 \tuplet 3/2 { d4 a fis } | a2 g~ | g r |
    \tuplet 3/2 { d'4 a f } \tuplet 3/2 { a f d } | 
  }
  \alternative {
    {\tuplet 3/2 { f e d } \tuplet 3/2 { e d cis } | e1~ | 2 r }
    { \tuplet 3/2 { f4 e d } \tuplet 3/2 { e d cis } |d1~ | 2 r }
  }
  \bar "||" \break \B
  \tuplet 3/2 { g4 g g } \tuplet 3/2 { g f e } |
  \tuplet 3/2 { f f f } \tuplet 3/2 { f e d } |
  \tuplet 3/2 { e e e } \tuplet 3/2 { e f g } | a1
  \tuplet 3/2 { g4 g g } \tuplet 3/2 { g f e } |
  \tuplet 3/2 { f f g } \tuplet 3/2 { f e d } |
  \tuplet 3/2 { e e e } \tuplet 3/2 { f f f } | e1 \bar "||" \break \A
  d4 8 8~ 2~ | 2 \tuplet 3/2 { 4 e f } | a2 g~ | 2. r4 |
  \tuplet 3/2 { 4 4 4 } \tuplet 3/2 { a4 4 4 } | 
  \tuplet 3/2 { bes4 4 4 } \tuplet 3/2 { cis d e } | a,1~ | 2 r | \break
  d4 8 8~ 2~ | 2 \tuplet 3/2 { d4 a fis } | a2 g~ | g r |
  \tuplet 3/2 { d'4 a f } \tuplet 3/2 { a f d } | 
  \tuplet 3/2 { f e d } \tuplet 3/2 { e d cis } | d1~ | 2 r
}

chordsRhythm = \relative c''' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t 
}

Basse = \relative c {
  \override Rest #'staff-position = #0
  \clef "bass" \key f \major \time 4/4
}

grille = \chordmode {
  \bar "[|:"
  \repeat percent 2 d1:m6 \repeat percent 2 g:m6 \break
  \/g2:m6 d:9- \/e:m5-7 a:9- d1:m6 \parenthesize a:5+7.9- \break
  a:m5-7 d:9- \repeat percent 2 g:m6 \break
  d:m6 \set Score.repeatCommands = #'((volta "1")) \/b2:m5-7 e:9-
  \repeat percent 2 a1:7   \set Score.repeatCommands = #'((volta #f) end-repeat) \break
  \stopStaff s1 \startStaff \set Score.repeatCommands = #'((volta "2"))
  \/e2:m5-7 a:9- \repeat percent 2 d1:m6 \set Score.repeatCommands = #'((volta #f))
  \bar "||" \break
  g:m6 d:m6 \/e2:m5-7 a:9- \/d:m6 d:9- \break
  g1:m6 d:m6 \/e2:7 bes:9- a1:9- \break
  \repeat percent 2 d1:m6 \repeat percent 2 g:m6 \break
  \/g2:m6 d:9- \/e:m5-7 a:9- d1:m6 \parenthesize a:5+7.9- \break
  a:m5-7 d:9- \repeat percent 2 g:m6 \break
  d:m6 \/e2:m5-7 a:9- \repeat percent 2 d1:m6
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*19 
  s1 ^\markup \bold \box \fontsize #7 B s1*7 
  s1 ^\markup \bold \box \fontsize #7 A
}

verse = \lyricmode {
  Bé -- sa -- me, bé -- sa -- me mu -- cho
  Co -- mo si fue -- ra_es -- ta no -- che la úl -- ti -- ma vez
  Bé -- sa -- me, bé -- sa -- me mu -- cho
  Que ten -- go mie -- do te -- ner -- te
  Per -- der -- te des -- pués
  ner -- te
  Per -- der -- te des -- pués

  Quie -- ro te -- ner -- te muy cer -- ca
  Mi -- rar -- me_en tus o -- jos
  Ver -- te jun -- to_a mí
  Pien -- sa que, tal vez, ma -- ña -- na
  Ya -- es -- ta -- ré le -- jos
  Muy le -- jos de ti

  Bé -- sa -- me, bé -- sa -- me mu -- cho
  Co -- mo si fue -- ra_es -- ta no -- che la úl -- ti -- ma vez
  Bé -- sa -- me, bé -- sa -- me mu -- cho
  Que ten -- go mie -- do te -- ner -- te
  per -- der -- te des -- pués
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
          \theNotes
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
          \theNotes \addlyrics \verse
        >> 
      >>
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
          \transpose c d \theNotes \addlyrics \verse
        >> 
      >>
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
          \transpose c a \theNotes \addlyrics \verse
        >> 
      >>
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
} } }